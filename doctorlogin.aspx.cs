using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginpg
{
    public partial class doctorlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = txtDoctorName.Text;  // Get username 
            string password = txtPassword.Text;  //get password

            if (ValidateDoctorLogin(username, password))
            {
                Session["username"] = username;
                // Redirect to Doctor Dashboard if login is successful
                Response.Redirect("doctordashboard.aspx");
            }
            else
            {
                // Show an error message if login is unsuccessful
                Response.Write("<script>alert('Invalid Username or Password');</script>");
            }
        }
        private bool ValidateDoctorLogin(string username, string password)
        {
            string connectionString = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;"; // Update connection string if needed

            string query = "SELECT COUNT(1) FROM doctordetails1 WHERE name = @name AND pwd = @pwd";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@name", username);
                command.Parameters.AddWithValue("@pwd", password);

                connection.Open();
                int count = Convert.ToInt32(command.ExecuteScalar()); // Executes query and checks for matching row

                return count > 0;  // If count is greater than 0, login is successful
            }
        }
    }
}