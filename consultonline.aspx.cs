using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginpg
{
    public partial class consultonline : System.Web.UI.Page
    {
        string connStr = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTreatments();
            }
        }

        private void LoadTreatments()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT DISTINCT specialist_in FROM doctordetails1";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlTreatments.DataSource = dt;
                ddlTreatments.DataTextField = "specialist_in";
                ddlTreatments.DataValueField = "specialist_in";
                ddlTreatments.DataBind();
                ddlTreatments.Items.Insert(0, new ListItem("--Select Treatment--", ""));
            }
        }

        protected void ddlTreatments_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDoctorsByTreatment(ddlTreatments.SelectedValue);
        }

        private void LoadDoctorsByTreatment(string treatment)
        {
            ddlDoctors.Items.Clear();
            if (string.IsNullOrEmpty(treatment))
            {
                ddlDoctors.Items.Insert(0, new ListItem("--Select Doctor--", ""));
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT id, name FROM doctordetails1 WHERE specialist_in = @Treatment";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Treatment", treatment);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlDoctors.DataSource = dr;
                ddlDoctors.DataTextField = "name";
                ddlDoctors.DataValueField = "id";
                ddlDoctors.DataBind();

                conn.Close();
            }
            ddlDoctors.Items.Insert(0, new ListItem("--Select Doctor--", ""));
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            string patient = txtPatient.Text;
            string doctor = ddlDoctors.SelectedItem.Text;
            string message = txtMessage.Text;

            if (!string.IsNullOrWhiteSpace(message))
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO chat_messages (patient_username, doctor_name, message, sender, sent_at) VALUES (@patient, @doctor, @message, @sender, GETDATE())";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@patient", patient);
                    cmd.Parameters.AddWithValue("@doctor", doctor);
                    cmd.Parameters.AddWithValue("@message", message);
                    cmd.Parameters.AddWithValue("@sender", "Patient");

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            txtMessage.Text = "";
            LoadMessages();
        }

        private void LoadMessages()
        {
            if (string.IsNullOrWhiteSpace(txtPatient.Text))
            {
                // If the patient name is empty, show an error or return
                return;
            }

            if (ddlDoctors.SelectedItem == null || string.IsNullOrWhiteSpace(ddlDoctors.SelectedValue))
            {
                // If no doctor is selected, return or show an error
                return;
            }
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT message, sender, sent_at FROM chat_messages WHERE patient_username = @patient AND doctor_name = @doctor ORDER BY sent_at ASC";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patient", txtPatient.Text);
                cmd.Parameters.AddWithValue("@doctor", ddlDoctors.SelectedItem.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptChat.DataSource = dt;
                rptChat.DataBind();
            }
        }

        protected void ddlDoctors_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadMessages();
        }
        protected void ChatRefreshTimer_Tick(object sender, EventArgs e)
        {
            LoadMessages();
        }
    }
}


//[WebMethod]
//        public static void SendMessage(string patient, string doctor, string message, string senderType)
//        {
//            string connStr = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

//            using (SqlConnection conn = new SqlConnection(connStr))
//            {
//                string query = "INSERT INTO chat_messages (patient_username, doctor_name, message, sender, sent_at) VALUES (@patient, @doctor, @message, @sender, GETDATE())";
//                SqlCommand cmd = new SqlCommand(query, conn);
//                cmd.Parameters.AddWithValue("@patient", patient);
//                cmd.Parameters.AddWithValue("@doctor", doctor);
//                cmd.Parameters.AddWithValue("@message", message);
//                cmd.Parameters.AddWithValue("@sender", senderType);

//                conn.Open();
//                cmd.ExecuteNonQuery();
//                conn.Close();
//            }
//        }

//        [WebMethod]
//        public static List<Dictionary<string, string>> GetChatMessages(string patient, string doctor)
//        {
//            List<Dictionary<string, string>> messages = new List<Dictionary<string, string>>();
//            string connStr = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

//            using (SqlConnection conn = new SqlConnection(connStr))
//            {
//                string query = "SELECT message, sender, sent_at FROM chat_messages WHERE patient_username = @patient AND doctor_name = @doctor ORDER BY sent_at ASC";
//                SqlCommand cmd = new SqlCommand(query, conn);
//                cmd.Parameters.AddWithValue("@patient", patient);
//                cmd.Parameters.AddWithValue("@doctor", doctor);

//                conn.Open();
//                SqlDataReader reader = cmd.ExecuteReader();
//                while (reader.Read())
//                {
//                    messages.Add(new Dictionary<string, string>
//                    {
//                        { "message", reader["message"].ToString() },
//                        { "sender", reader["sender"].ToString() },
//                        { "timestamp", reader["sent_at"].ToString() }
//                    });
//                }
//                conn.Close();
//            }
//            return messages;
//        }
//    }
//}
