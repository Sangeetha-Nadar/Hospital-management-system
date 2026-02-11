using System;
using System.Net;
using System.Net.Mail;

public partial class SendEmail : System.Web.UI.Page
{
    protected global::System.Web.UI.WebControls.TextBox txtemail;
    protected global::System.Web.UI.WebControls.Label lblStatus;
    protected global::System.Web.UI.WebControls.Button btnSend;
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            string fromEmail = txtemail.Text.Trim();  // Get user-entered email

            Sendmail(fromEmail);
            lblStatus.Text = "Email sent successfully!";
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Error: " + ex.Message;
            lblStatus.ForeColor = System.Drawing.Color.Red;
        }
    }

    private void Sendmail(string fromEmail)
    {
        string smtpServer = "smtp.gmail.com"; // ✅ Replace with actual SMTP server
        int smtpPort = 587; // ✅ Correct SMTP port (Gmail: 587, Outlook: 587, etc.)
        string smtpUsername = "your-email@gmail.com"; // ✅ Replace with your SMTP email
        string smtpPassword = "your-email-password"; // ✅ Replace with your SMTP password

        MailMessage mail = new MailMessage();
        mail.From = new MailAddress(smtpUsername); // ✅ Sender must be your SMTP email
        mail.To.Add(fromEmail);  // ✅ User-entered email will receive the message
        mail.Subject = "Notification"; // ✅ Fixed subject (cannot send without it)
        mail.Body = "This is an automated message."; // ✅ Fixed message body

        SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort)
        {
            Credentials = new NetworkCredential(smtpUsername, smtpPassword),
            EnableSsl = true
        };

        smtpClient.Send(mail);
    }
}