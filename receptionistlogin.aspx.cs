using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginpg
{
    public partial class receptionistlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnrecep_submit(object sender, EventArgs e)
        {
            string username = txtrecepName.Text;  // Get username 
            string password = txtrecepPassword.Text;  //get password
            if (ValidaterecepLogin(username, password))
            {
                // Redirect to Doctor Dashboard if login is successful
                Response.Redirect("receptionistdashboard.aspx");
            }
            else
            {
                // Show an error message if login is unsuccessful
                Response.Write("<script>alert('Invalid Username or Password');</script>");
            }
        }
        private bool ValidaterecepLogin(string username, string password)
        {
            string connectionString = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;"; // Update connection string if needed

            string query = "SELECT COUNT(1) FROM receptionistdetail WHERE name = @name AND pwd = @pwd";

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