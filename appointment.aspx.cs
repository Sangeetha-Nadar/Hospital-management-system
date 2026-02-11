using System;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web;
using System.Web.UI;


namespace loginpg
{
    public partial class appointment : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.Label lblStatus;
        protected global::System.Web.UI.WebControls.Button btnSend;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnAddpat.Click += new EventHandler(btnapointpat_Click);
            }
        }
        protected void btnapointpat_Click(object sender, EventArgs e)
        {
            string patname = txtpatName.Text.Trim();
            string patgender = patGender.SelectedValue;
            string pataddress = txtpataddress.Text.Trim();
            string treattype = txtpattreatment.SelectedValue;
            string userEmail = txtemail.Text.Trim();

            if (string.IsNullOrEmpty(patname) || string.IsNullOrEmpty(patgender) || string.IsNullOrEmpty(treattype) || string.IsNullOrEmpty(pataddress))
            {
                lblMessage.Text = "Please enter details in all field.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            int patntage;
            int patntcontact;
            if (!int.TryParse(txtpatage.Text.Trim(), out patntage) || !int.TryParse(txtpatnumber.Text.Trim(), out patntcontact))
            {
                lblMessage.Text = "Please enter valid numeric values for age and contact.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            lblMessage.Text = "Appointment booked successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

            // SQL Query to insert data into patientdetail table
            string query = "INSERT INTO patientdetail (name, age, gender, address, treatment, phone_no) VALUES (@name, @age, @gender, @address, @treatment, @phone_no)";
            string updateQuery = "UPDATE patientdetail SET current_Status = 'Inpatient' WHERE current_Status IS NULL;";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to prevent SQL injection
                        command.Parameters.AddWithValue("@name", patname);
                        command.Parameters.AddWithValue("@age", patntage);
                        command.Parameters.AddWithValue("@gender", patgender);
                        command.Parameters.AddWithValue("@address", pataddress);
                        command.Parameters.AddWithValue("@treatment", treattype);
                        command.Parameters.AddWithValue("@phone_no", patntcontact);
                        
                       
                       

                        // Open the connection
                        connection.Open();

                        // Execute the query
                        int rowsAffected2 = command.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected2 > 0)
                        {
                            using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
                            {
                                updateCommand.ExecuteNonQuery();
                            }
                            lblMessage.Text = "Appointment booked successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            // Optionally clear input fields
                            txtpatName.Text = string.Empty;
                            txtpataddress.Text = string.Empty;
                            txtpatage.Text = string.Empty;
                            txtpatnumber.Text = string.Empty;
                            patGender.SelectedIndex = 0;
                            txtpattreatment.SelectedIndex = 0;
                        }
                        else
                        {
                            lblMessage.Text = "Failed to book your Appointment";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                // Specific SQL exception handling
                lblMessage.Text = "A database error occurred: " + sqlEx.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                // General exception handling
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            try
            {
                Sendmail(userEmail, patname, treattype);
                lblStatus.Text = "Appointment booking successful! Email confirmation sent.";
                lblStatus.ForeColor = System.Drawing.Color.Green;

                // Show success alert and refresh page
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Appointment booking successful! A confirmation email has been sent.'); window.location='appointment.aspx';", true);
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
        protected void cancelapointpat_Click(object sender, EventArgs e)
        {
            string dltpatname = txtcancelpatName.Text.Trim();
            int dltid;

            // Check if fields are empty
            if (string.IsNullOrEmpty(dltpatname) || string.IsNullOrEmpty(txtcancelpatid.Text.Trim()))
            {
                lblMessage.Text = "Please enter both Patient Name and ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validate patient ID as a number
            if (!int.TryParse(txtcancelpatid.Text.Trim(), out dltid))
            {
                lblMessage.Text = "Please enter a valid numeric Patient ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

            // SQL Query to delete a patient where both ID and Name match
            string query = "DELETE FROM patientdetail WHERE ID = @ID AND name = @name";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to prevent SQL injection
                        command.Parameters.AddWithValue("@ID", dltid);
                        command.Parameters.AddWithValue("@name", dltpatname);

                        // Open the connection
                        connection.Open();

                        // Execute the query
                        int rowsAffected = command.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Patient deleted successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;

                            // Optionally clear input fields
                            txtcancelpatName.Text = string.Empty;
                            txtcancelpatid.Text = string.Empty;
                        }
                        else
                        {
                            lblMessage.Text = "No matching patient found.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                // Specific SQL exception handling
                lblMessage.Text = "Database error: " + sqlEx.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                // General exception handling
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
           
        }

        private void Sendmail(string userEmail, string patname, string treattype)
        {
            string smtpServer = "smtp.gmail.com";
            int smtpPort = 587;
            string smtpUsername = "sangeetha2004nadar@gmail.com";
            string smtpPassword = ConfigurationManager.AppSettings["SMTPPassword"];

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(smtpUsername);
            mail.To.Add(userEmail);
            mail.Subject = "Appointment booking successful - Hospital Management System";
            mail.Body = $"Dear {patname},\n\n" +
                        $"Your appointment for {treattype} via online has been successfully processed.\n" +
                        $"Thank you for choosing our hospital.\n\nBest Regards,\nRazli \n Hospital Management Team";

            SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort)
            {
                Credentials = new NetworkCredential(smtpUsername, smtpPassword),
                EnableSsl = true
            };

            smtpClient.Send(mail);
        }
    }
    
}