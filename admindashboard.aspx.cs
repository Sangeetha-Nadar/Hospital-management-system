using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Net;
using System.Web.UI;

namespace loginpg
{
    public partial class admindashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load data only when the button is clicked, not on every postback
        }

        protected void btnViewStaff_Click(object sender, EventArgs e)
        {
            LoadStaffData();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "showStaff", "showForm('viewStaffForm', event);", true);
        }

        private void LoadStaffData()
        {
            string connectionString = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT ID, name, age, gender, phone_no, 'Doctor' AS Designation FROM doctordetails1
                UNION
                SELECT ID, name, age, gender, phone_no, 'Nurse' AS Designation FROM nursedetail
                UNION
                SELECT ID, name, age, gender, phone_no, 'Receptionist' AS Designation FROM receptionistdetail";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvStaff.DataSource = dt;
                gvStaff.DataBind();
            }
        }
        protected void btnViewfeedback_Click(object sender, EventArgs e)
        {
            loadfeedback();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showfeedback", "showForm('viewfeedback', event);", true);
        }
        private void loadfeedback()
        {
            string connectionString = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

            using (SqlConnection conns = new SqlConnection(connectionString))
            {
                string querys = @"
                SELECT star, feedback FROM rating";

                SqlDataAdapter das = new SqlDataAdapter(querys, conns);
                DataTable dts = new DataTable();
                das.Fill(dts);

                gridviewfdbk.DataSource = dts;
                gridviewfdbk.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve input values
            string doctorName = txtDoctorName.Text;
            string address = DoctorAddress.Text;
            string gender = DoctorGender.SelectedValue;
            string specialistin = DoctorSpecialist.SelectedValue;
            string password = DoctorPassword.Text;

            // Validate inputs
            if (string.IsNullOrEmpty(doctorName) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(gender) || string.IsNullOrEmpty(specialistin) || string.IsNullOrEmpty(address))
            {
                lblMessage.Text = "Please enter details in all field.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            int age;
            int contact;
            if (!int.TryParse(DoctorAge.Text, out age) || !int.TryParse(DoctorNumber.Text, out contact))
            {
                lblMessage.Text = "Please enter valid numeric values for age and contact.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Success message
            lblMessage.Text = "Doctor details added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            // Additional code to save the data to the database can be added here
            string connectionString = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

            // SQL Query to insert data into Doctors_details table
            string query = "INSERT INTO doctordetails1 (name, age, gender, phone_no, specialist_in, addres, pwd) VALUES (@name, @age, @gender, @phone_no, @specialist_in, @addres, @pwd)";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to prevent SQL injection
                        command.Parameters.AddWithValue("@name", doctorName);
                        command.Parameters.AddWithValue("@age", age);
                        command.Parameters.AddWithValue("@gender", gender);
                        command.Parameters.AddWithValue("@phone_no", contact);
                        command.Parameters.AddWithValue("@specialist_in", specialistin);
                        command.Parameters.AddWithValue("@addres", address);
                        command.Parameters.AddWithValue("@pwd", password);

                        // Open the connection
                        connection.Open();

                        // Execute the query
                        int rowsAffected2 = command.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected2 > 0)
                        {
                            lblMessage.Text = "Doctor's details saved successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            // Optionally clear input fields
                            txtDoctorName.Text = string.Empty;
                            DoctorPassword.Text = string.Empty;
                            DoctorAddress.Text = string.Empty;
                            DoctorAge.Text = string.Empty;
                            DoctorNumber.Text = string.Empty;
                            DoctorGender.SelectedIndex = 0;
                            DoctorSpecialist.SelectedIndex = 0;
                        }
                        else
                        {
                            lblMessage.Text = "Failed to save doctor's details.";
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
        }
        protected void btnaddrecep_Click(object sender, EventArgs e)
        {
            string recepname = recepName.Text;
            string recepgender = recepGender.SelectedValue;
            string recepaddress = recepAddress.Text;
            string receppassword = recepPassword.Text;

            if (string.IsNullOrEmpty(recepname) || string.IsNullOrEmpty(recepgender) || string.IsNullOrEmpty(recepaddress) || string.IsNullOrEmpty(receppassword))
            {
                lblMessage.Text = "Please enter details in all field.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            int recepage;
            int recepcontact;
            if (!int.TryParse(recepAge.Text, out recepage) || !int.TryParse(recepNumber.Text, out recepcontact))
            {
                lblMessage.Text = "Please enter valid numeric values for age and contact.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Success message
            lblMessage.Text = "receptionist details added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            string connectionString1 = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

            // SQL Query to insert data into Doctors_details table
            string query1 = "INSERT INTO receptionistdetail (name, age, gender, phone_no, address, pwd) VALUES (@name, @age, @gender, @phone_no, @address, @pwd)";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString1))
                {
                    using (SqlCommand command = new SqlCommand(query1, connection))
                    {
                        // Add parameters to prevent SQL injection
                        command.Parameters.AddWithValue("@name", recepname);
                        command.Parameters.AddWithValue("@age", recepage);
                        command.Parameters.AddWithValue("@gender", recepgender);
                        command.Parameters.AddWithValue("@phone_no", recepcontact);
                        command.Parameters.AddWithValue("@address", recepaddress);
                        command.Parameters.AddWithValue("@pwd", receppassword);

                        // Open the connection
                        connection.Open();

                        // Execute the query
                        int rowsAffected1 = command.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected1 > 0)
                        {
                            lblMessage.Text = "receptionist details saved successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            // Optionally clear input fields
                            recepName.Text = string.Empty;
                            recepPassword.Text = string.Empty;
                            recepAddress.Text = string.Empty;
                            recepAge.Text = string.Empty;
                            recepNumber.Text = string.Empty;
                            recepGender.SelectedIndex = 0;

                        }
                        else
                        {
                            lblMessage.Text = "Failed to save receptionist details.";
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

        }
        protected void btnaddnurse_Click(object sender, EventArgs e)
        {
            string nursename = nurseName.Text;
            string nursegender = nurseGender.SelectedValue;
            string nurseaddress = nurseAddress.Text;
            

            if (string.IsNullOrEmpty(nursename) || string.IsNullOrEmpty(nursegender) || string.IsNullOrEmpty(nurseaddress))
            {
                lblMessage.Text = "Please enter details in all field.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            int nurseage;
            int nursecontact;
            if (!int.TryParse(nurseAge.Text, out nurseage) || !int.TryParse(nurseNumber.Text, out nursecontact))
            {
                lblMessage.Text = "Please enter valid numeric values for age and contact.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Success message
            lblMessage.Text = "nurse details added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            string connectionString2 = "Data Source=BANU\\SQLEXPRESS;Initial Catalog=demo;User ID=sa;Password=123;";

            // SQL Query to insert data into nursedetail table
            string query2 = "INSERT INTO nursedetail (name, age, gender, phone_no, address) VALUES (@name, @age, @gender, @phone_no, @address)";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString2))
                {
                    using (SqlCommand command = new SqlCommand(query2, connection))
                    {
                        // Add parameters to prevent SQL injection
                        command.Parameters.AddWithValue("@name", nursename);
                        command.Parameters.AddWithValue("@age", nurseage);
                        command.Parameters.AddWithValue("@gender", nursegender);
                        command.Parameters.AddWithValue("@phone_no", nursecontact);
                        command.Parameters.AddWithValue("@address", nurseaddress);
                        

                        // Open the connection
                        connection.Open();

                        // Execute the query
                        int rowsAffected3 = command.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected3 > 0)
                        {
                            lblMessage.Text = "nurse details saved successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            // Optionally clear input fields
                            nurseName.Text = string.Empty;
                            nurseAddress.Text = string.Empty;
                            nurseAge.Text = string.Empty;
                            nurseNumber.Text = string.Empty;
                            nurseGender.SelectedIndex = 0;

                        }
                        else
                        {
                            lblMessage.Text = "Failed to save nurse details.";
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
        }
        protected void noticeSubmit_Click(object sender, EventArgs e)
        {
            // Get notice text from the TextBox
            string noticeText = txtNotice.Text.Trim();

            // Check if the notice is empty
            if (string.IsNullOrEmpty(noticeText))
            {
                Lbl2.Text = "Please enter a notice before submitting.";
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
                    string query3 = "INSERT INTO adminmessage1 (message, created_at1) VALUES (@message, GETDATE())";
                    Debug.WriteLine(query3);
                    using (SqlCommand cmd = new SqlCommand(query3, conn))
                    {
                        cmd.Parameters.AddWithValue("@message", noticeText);
                        int rowsAffected4 = cmd.ExecuteNonQuery();

                        if (rowsAffected4 > 0)
                        {
                            Lbl2.Text = "Notice sent successfully!";
                            Lbl2.ForeColor = System.Drawing.Color.Green;
                            txtNotice.Text = ""; // Clear the input field after insertion
                        }
                        else
                        {
                            Lbl2.Text = "Error in sending notice. Try again.";
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
        protected void logout_click(object sender, EventArgs e)
        {
            Response.Redirect("homepg.aspx");
        }

        // Connection string (consider storing it in web.config for better security)


        protected void btnDeleteStaff_Click(object sender, EventArgs e)
        {
            // Get the selected staff type and name
            string staffType = stafftype.SelectedValue;
            string staffName = txtstaffName.Text;
            string staffid = txtstaffID.Text.Trim();

            // Validate inputs
            if (string.IsNullOrEmpty(staffType) || string.IsNullOrEmpty(staffName) || string.IsNullOrEmpty(staffid))
            {
                lblDeleteMessage.Text = "Please select a staff type, enter a staff name and ID";
                lblDeleteMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (!int.TryParse(staffid, out _))
            {
                lblDeleteMessage.Text = "Staff ID must be a number.";
                lblDeleteMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Connection string (update this with your actual database details)
            string connectionString4 = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

            string query4 = string.Empty;

            // Choose the correct table based on the staff type
            switch (staffType)
            {
                case "Doctor":
                    query4 = "DELETE FROM doctordetails1 WHERE name = @name AND id = @ID";
                    break;
                case "Nurse":
                    query4 = "DELETE FROM nursedetail WHERE name = @name AND id = @ID";
                    break;
                case "Receptionist":
                    query4 = "DELETE FROM receptionistdetail WHERE name = @name AND id = @ID";
                    break;
                default:
                    lblDeleteMessage.Text = "Invalid staff type selected.";
                    lblDeleteMessage.ForeColor = System.Drawing.Color.Red;
                    return;
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString4))
                {
                    using (SqlCommand command = new SqlCommand(query4, connection))
                    {
                        // Add parameters to prevent SQL injection
                        
                        command.Parameters.AddWithValue("@name", staffName);
                        command.Parameters.AddWithValue("@ID", int.Parse(staffid));

                        // Open the connection
                        connection.Open();

                        // Execute the deletion query
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblDeleteMessage.Text = "Staff record deleted successfully!";
                            lblDeleteMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblDeleteMessage.Text = "No staff found with the given name and ID";
                            lblDeleteMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblDeleteMessage.Text = "An error occurred: " + ex.Message;
                lblDeleteMessage.ForeColor = System.Drawing.Color.Red;
            }
          
        }
       
    }
}


