using System;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginpg
{
    public partial class payonline : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.Label lblStatus;
        protected global::System.Web.UI.WebControls.Button btnSend;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnpay_Click(object sender, EventArgs e)
        {
            string patientName = txtpatientName.Text.Trim();
            string patientID = txtpatientID.Text.Trim();
            string amount = txtAmount.Text.Trim();
            string paymentMethod = ddlPaymentMethod.SelectedValue;
            string userEmail = txtemail.Text.Trim();

            if (string.IsNullOrEmpty(patientName) || string.IsNullOrEmpty(patientID) ||
                string.IsNullOrEmpty(amount) || string.IsNullOrEmpty(paymentMethod) ||
                string.IsNullOrEmpty(userEmail))
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM patientdetail WHERE ID = @ID AND name = @name";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", patientID);
                    cmd.Parameters.AddWithValue("@name", patientName);

                    int count = (int)cmd.ExecuteScalar();
                    if (count == 0)
                    {
                        lblMessage.Text = "Invalid Patient Name or ID.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }

                // Update payment status
                string updateQuery = "UPDATE patientdetail SET Payment_Status = 'Paid' WHERE ID = @ID";
                using (SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn))
                {
                    cmdUpdate.Parameters.AddWithValue("@ID", patientID);
                    cmdUpdate.ExecuteNonQuery();
                }
            }

            try
            {
                Sendmail(userEmail, patientName, amount, paymentMethod);
                lblStatus.Text = "Payment successful! Email confirmation sent.";
                lblStatus.ForeColor = System.Drawing.Color.Green;

                // Show success alert and refresh page
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Payment Successful! A confirmation email has been sent.'); window.location='payonline.aspx';", true);
            }
            catch (Exception ex)
            {
                if (lblStatus != null)
                {
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "alert('An error occurred: " + ex.Message + "');", true);
                }
            }
        }

        private void Sendmail(string userEmail, string patientName, string amount, string paymentMethod)
        {
            string smtpServer = "smtp.gmail.com";
            int smtpPort = 587;
            string smtpUsername = "sangeetha2004nadar@gmail.com";
            string smtpPassword = ConfigurationManager.AppSettings["SMTPPassword"];

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(smtpUsername);
            mail.To.Add(userEmail);
            mail.Subject = "Payment Successful - Hospital Management System";
            mail.Body = $"Dear {patientName},\n\n" +
                        $"Your payment of ₹{amount} via {paymentMethod} has been successfully processed.\n" +
                        $"Thank you for choosing our hospital.\n\nBest Regards,\nRazli Hospital Management Team";

            SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort)
            {
                Credentials = new NetworkCredential(smtpUsername, smtpPassword),
                EnableSsl = true
            };

            smtpClient.Send(mail);
        }
    }
}