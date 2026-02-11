using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginpg
{
    public partial class signout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctorNews();
            }
        }
        private void LoadDoctorNews()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            StringBuilder newsHtml = new StringBuilder();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT news FROM doctornews ORDER BY datetime DESC"; // Modify based on your column names

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            newsHtml.Append($"<div class='news-item'>{reader["News"]}</div>");
                        }
                    }
                }
            }

            newsContainer.InnerHtml = newsHtml.ToString();
        }
        protected void SubmitFeedback(object sender, EventArgs e)
        {
            int stars;
            if (!int.TryParse(selectedRating.Value, out stars) || stars == 0)
            {
                Response.Write("<script>alert('Please select a star rating before submitting.');</script>");
                return;
            }

            string feedbackText = feedbacktxt.Value;

            string connStr = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO rating (star, feedback) VALUES (@star, @feedback)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@star", stars);
                    cmd.Parameters.AddWithValue("@feedback", feedbackText);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Write("<script>alert('Thank you for your feedback!');</script>");
        }
    }
}