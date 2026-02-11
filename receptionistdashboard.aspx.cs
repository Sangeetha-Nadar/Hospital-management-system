using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Net;
using System.Web.UI;
using static System.Net.Mime.MediaTypeNames;


namespace loginpg
{
    public partial class receptionistdashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnViewpatient_Click(object sender, EventArgs e)
        {
            LoadStaffData();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "showpatient", "showForm('viewpatient', event);", true);
        }

        private void LoadStaffData()
        {
            string connectionString = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT ID, name, age, gender, phone_no, current_Status, Payment_Status FROM patientdetail";
                
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvpatient.DataSource = dt;
                gvpatient.DataBind();
            }
        }
        protected void btnaddpat_Click(object sender, EventArgs e)
        {
            string patname = txtpatName.Text.Trim();
            string patgender = patGender.SelectedValue;
            string pataddress = txtpataddress.Text.Trim();
            string treattype = txtpattreatment.SelectedValue;
            string rooms = patrooms.SelectedValue;

            if (string.IsNullOrEmpty(patname) || string.IsNullOrEmpty(patgender) || string.IsNullOrEmpty(treattype) || string.IsNullOrEmpty(rooms) || string.IsNullOrEmpty(pataddress))
            {
                lblMessage.Text = "Please enter details in all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int patntage, patntcontact;
            if (!int.TryParse(txtpatage.Text.Trim(), out patntage) || !int.TryParse(txtpatnumber.Text.Trim(), out patntcontact))
            {
                lblMessage.Text = "Please enter valid numeric values for age and contact.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

            string insertQuery = "INSERT INTO patientdetail (name, age, gender, address, treatment, phone_no, room_no) VALUES (@name, @age, @gender, @address, @treatment, @phone_no, @room_no)";
            string updateQuery = "UPDATE patientdetail SET current_Status = 'Inpatient' WHERE current_Status IS NULL;";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Insert Patient Details
                    using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@name", patname);
                        insertCommand.Parameters.AddWithValue("@age", patntage);
                        insertCommand.Parameters.AddWithValue("@gender", patgender);
                        insertCommand.Parameters.AddWithValue("@phone_no", patntcontact);
                        insertCommand.Parameters.AddWithValue("@treatment", treattype);
                        insertCommand.Parameters.AddWithValue("@address", pataddress);
                        insertCommand.Parameters.AddWithValue("@room_no", rooms);

                        int rowsAffected = insertCommand.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            // Execute UPDATE Query
                            using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
                            {
                                updateCommand.ExecuteNonQuery();
                            }

                            lblMessage.Text = "Patient's details saved successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;

                            // Clear Input Fields
                            txtpatName.Text = string.Empty;
                            patrooms.SelectedIndex = 0;
                            txtpataddress.Text = string.Empty;
                            txtpatage.Text = string.Empty;
                            txtpatnumber.Text = string.Empty;
                            patGender.SelectedIndex = 0;
                            txtpattreatment.SelectedIndex = 0;
                        }
                        else
                        {
                            lblMessage.Text = "Failed to save patient's details.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                lblMessage.Text = "A database error occurred: " + sqlEx.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void btndeltptnt_Click(object sender, EventArgs e)
        {
            string dltpatname = txtptntname.Text.Trim();
            int dltid;

            // Check if fields are empty
            if (string.IsNullOrEmpty(dltpatname) || string.IsNullOrEmpty(txtpatientid.Text.Trim()))
            {
                lblMessage.Text = "Please enter both Patient Name and ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validate patient ID as a number
            if (!int.TryParse(txtpatientid.Text.Trim(), out dltid))
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
                            txtptntname.Text = string.Empty;
                            txtpatientid.Text = string.Empty;
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
        protected void btndisptnt_Click(object sender, EventArgs e)
        {
            string dispatname = txtdispatientname.Text.Trim();
            int disid;

            // Check if fields are empty
            if (string.IsNullOrEmpty(dispatname) || string.IsNullOrEmpty(txtdispatientid.Text.Trim()))
            {
                lblMessage.Text = "Please enter both Patient Name and ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validate patient ID as a number
            if (!int.TryParse(txtdispatientid.Text.Trim(), out disid))
            {
                lblMessage.Text = "Please enter a valid numeric Patient ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

            // SQL Query to delete a patient where both ID and Name match
            string query = "UPDATE patientdetail SET current_Status = 'Discharged' WHERE ID = @ID AND name = @name" ;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to prevent SQL injection
                        command.Parameters.AddWithValue("@ID", disid);
                        command.Parameters.AddWithValue("@name", dispatname);

                        // Open the connection
                        connection.Open();

                        // Execute the query
                        int rowsAffected = command.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Patient discharged successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;

                            // Optionally clear input fields
                            txtptntname.Text = string.Empty;
                            txtpatientid.Text = string.Empty;
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
        protected void btnViewNotices_Click(object sender, EventArgs e)
        {
            LoadNotices();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "shownotices", "document.getElementById('viewnotice').style.display = 'block';", true);
        }
        private void LoadNotices()
        {

            string connectionString = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                string query = @" 
                SELECT message, created_at1 FROM adminmessage1 ORDER BY created_at1 DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvNotices.DataSource = dt;
                gvNotices.DataBind();

            }
        }
        protected void btnbill_Click(object sender, EventArgs e)
        {
            string patientID = txtblpatientid.Text.Trim();
            string patientName = txtblpatientname.Text.Trim();

            if (string.IsNullOrEmpty(patientID) || string.IsNullOrEmpty(patientName))
            {
                Label1.Text = "Please enter both Patient ID and Name.";
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT treatment FROM patientdetail WHERE ID = @ID AND name = @name";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ID", patientID);
                        cmd.Parameters.AddWithValue("@name", patientName);

                        object treatmentObj = cmd.ExecuteScalar();
                        if (treatmentObj != null)
                        {
                            string treatment = treatmentObj.ToString().Trim();
                            int amount = GetTreatmentAmount(treatment);
                            txtblpatientamt.Text = amount.ToString();
                            Label1.Text = "Bill generated successfully.";

                        }
                        else
                        {
                            Label1.Text = "Patient not found.";
                        }
                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowBillSection", "showGenerateBill();", true);
                }
                catch (Exception ex)
                {
                    Label1.Text = "Error: " + ex.Message;
                }
            }
        }
             private int GetTreatmentAmount(string treatment)
             {
                     switch (treatment)
                     {
                         case "Fever": return 800;
                        case "Cardiology": return 3500;
                        case "Dental": return 1800;
                         case "Orthopedic": return 2600;
                         case "Neurology": return 2950;
                         case "Pediatric": return 1700;
                         case "Radiology": return 1650;
                        case "Dermatology": return 1850;
                         default: return 0; // Default value if treatment not found
                     }
             }
        protected void logout_click(object sender, EventArgs e)
        {
            Response.Redirect("homepg.aspx");
        }
    }
}