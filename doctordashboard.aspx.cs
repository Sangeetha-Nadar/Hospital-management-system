using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginpg
{
    public partial class doctordashboard : System.Web.UI.Page
    {
        string connStr = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfActiveSection.Value = ""; // Default to no section
            }
            if (!IsPostBack)
            {
                Session["ChatMessages"] = new List<ChatMessage>();
            }

        }

        protected void btnLoadNotices_Click(object sender, EventArgs e)
        {
            LoadNotices(); // Call the method to load notices
            hfActiveSection.Value = "viewnotice";
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowSection", "showSection('viewnotice');", true);
        }

        private void LoadNotices()
        {
            string connStr = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT message, created_at1 FROM adminmessage1 ORDER BY created_at1 DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvnotice.DataSource = dt;
                gvnotice.DataBind();
            }
        }

        protected void logout_click(object sender, EventArgs e)
        {
            Response.Redirect("homepg.aspx");
        }

        protected void newsSubmit_Click(object sender, EventArgs e)
        {
            string newsText = txtNotice.Text.Trim();

            // Check if the notice is empty
            if (string.IsNullOrEmpty(newsText))
            {
                Lbl2.Text = "Please enter a news before submitting.";
                Lbl2.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // SQL Server connection string
            string connStr = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string query3 = "INSERT INTO doctornews (news, datetime) VALUES (@news, GETDATE())";
                    using (SqlCommand cmd = new SqlCommand(query3, conn))
                    {
                        cmd.Parameters.AddWithValue("@news", newsText);
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Lbl2.Text = "News added successfully!";
                            Lbl2.ForeColor = System.Drawing.Color.Green;
                            txtNotice.Text = ""; // Clear the input field after insertion
                        }
                        else
                        {
                            Lbl2.Text = "Error in Adding news. Try again.";
                            Lbl2.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Lbl2.Text = "Database Error: " + ex.Message;
                    Lbl2.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnViewPatient_Click(object sender, EventArgs e)
        {
            // Retrieve doctor's name from session
            string loggedInDoctor = Session["username"] as string;

            if (!string.IsNullOrEmpty(loggedInDoctor))
            {
                LoadPatientData(loggedInDoctor);
                hfActiveSection.Value = "view-patient"; // Set active section
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowSection", "showSection('view-patient');", true);
            }
            else
            {
                lblMessage.Text = "Session expired! Please log in again.";
            }
        }

        private void LoadPatientData(string doctorName)
        {
            string connectionString = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT p.name, p.age, p.gender, p.treatment, p.phone_no, p.room_no, p.current_Status
                FROM patientdetail p
                JOIN doctordetails1 d ON p.treatment = d.specialist_in
                WHERE d.name = @DoctorName";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DoctorName", doctorName);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPatients.DataSource = dt;
                gvPatients.DataBind();
            }
        }
        private void LoadDoctorName()
        {
            txtDoctor.Text = Session["username"] as string;
        }

        private void LoadPatients()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT DISTINCT patient_username FROM chat_messages WHERE doctor_name = @doctor";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@doctor", txtDoctor.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlPatients.DataSource = dt;
                ddlPatients.DataTextField = "patient_username";
                ddlPatients.DataValueField = "patient_username";
                ddlPatients.DataBind();
                ddlPatients.Items.Insert(0, new ListItem("--Select Patient--", ""));
            }
        }

        protected void ddlPatients_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadChatMessages();
        }
        private void LoadChatMessages()
        {
            if (string.IsNullOrEmpty(ddlPatients.SelectedValue))
            {
                rptChat.DataSource = null;
                rptChat.DataBind();
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT message, sender, FORMAT(sent_at, 'yyyy-MM-dd HH:mm:ss') AS SentAt " +
                               "FROM chat_messages " +
                               "WHERE patient_username = @patient AND doctor_name = @doctor " +
                               "ORDER BY sent_at ASC";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patient", ddlPatients.SelectedValue);
                cmd.Parameters.AddWithValue("@doctor", txtDoctor.Text);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptChat.DataSource = dt;
                rptChat.DataBind();
            }
        }

        //private void LoadMessages()
        //{
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        string query = "SELECT message, sender, sent_at FROM chat_messages WHERE patient_username = @patient AND doctor_name = @doctor ORDER BY sent_at ASC";
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@patient", ddlPatients.SelectedValue);
        //        cmd.Parameters.AddWithValue("@doctor", txtDoctor.Text);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);

        //        rptChat.DataSource = dt;
        //        rptChat.DataBind();
        //    }
        //}

        //protected void btnSend_Click(object sender, EventArgs e)
        //{
        //    string doctor = txtDoctor.Text;
        //    string patient = ddlPatients.SelectedValue;
        //    string message = txtMessage.Text;

        //    if (!string.IsNullOrWhiteSpace(message))
        //    {
        //        using (SqlConnection conn = new SqlConnection(connStr))
        //        {
        //            string query = "INSERT INTO chat_messages (patient_username, doctor_name, message, sender, sent_at) VALUES (@patient, @doctor, @message, @sender, GETDATE())";
        //            SqlCommand cmd = new SqlCommand(query, conn);
        //            cmd.Parameters.AddWithValue("@patient", patient);
        //            cmd.Parameters.AddWithValue("@doctor", doctor);
        //            cmd.Parameters.AddWithValue("@message", message);
        //            cmd.Parameters.AddWithValue("@sender", "Doctor");

        //            conn.Open();
        //            cmd.ExecuteNonQuery();
        //            conn.Close();
        //        }
        //    }
        //    LoadMessages();
        //}

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtMessage.Text) || string.IsNullOrEmpty(ddlPatients.SelectedValue))
                return;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO chat_messages (patient_username, doctor_name, message, sender, sent_at) " +
                               "VALUES (@patient, @doctor, @message, @sender, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patient", ddlPatients.SelectedValue);
                cmd.Parameters.AddWithValue("@doctor", txtDoctor.Text);
                cmd.Parameters.AddWithValue("@message", txtMessage.Text);
                cmd.Parameters.AddWithValue("@sender", "Doctor");

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            txtMessage.Text = "";  // Clear message input field
            LoadChatMessages();    // Refresh chat to show new messages
        }

        protected void btnLoadChat_Click(object sender, EventArgs e)
        {
            LoadDoctorName();
            LoadPatients();
            LoadChatMessages();
        }

        protected void ChatRefreshTimer_Tick(object sender, EventArgs e)
        {
            LoadChatMessages();
        }

    }
    public class ChatMessage
    {
        public string Sender { get; set; }
        public string Message { get; set; }
        public string SentAt { get; set; }
    }
}