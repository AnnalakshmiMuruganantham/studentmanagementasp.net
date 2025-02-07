using System;
using System.Data.SqlClient;
using System.Configuration;

namespace StudentManagementCrudOperation
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void onbtnLoginClicked(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (IsValidUser(username, password))
            {
                // Redirect to Home page if valid user
                Response.Redirect("Home.aspx");
            }
            else
            {
                // Show error message
                lblMessage.Text = "Invalid username or password!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool IsValidUser(string username, string password)
        {
            bool isValid = false;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM login_details WHERE username = @Username AND password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        con.Open();
                        int count = Convert.ToInt32(cmd.ExecuteScalar());
                        isValid = (count > 0); // If count > 0, user exists
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
            return isValid;
        }

       
    }
}
