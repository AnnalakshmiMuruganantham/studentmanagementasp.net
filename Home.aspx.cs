using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace StudentManagementCrudOperation
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        string connectionString = "Data Source=ANNA06\\SQLEXPRESS;Initial Catalog=programming_DB;User ID=sa;Password=anna";

        protected void onbtnAddClicked(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    // Parse student ID safely
                    int studentId = int.TryParse(txtStudentId.Text, out int sId) ? sId : 0;

                    // Check if StudentID already exists
                    string checkQuery = "SELECT COUNT(*) FROM Student_Details WHERE StudentID = @StudentId";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue("@StudentId", studentId);
                        int count = (int)checkCmd.ExecuteScalar();

                        if (count > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Student ID already exists!');", true);
                            return; // Exit function if ID exists
                        }
                    }

                    // Create INSERT SQL query
                    string query = "INSERT INTO Student_Details (StudentID, StudentName, Address, Age, Contact) " +
                                   "VALUES (@StudentId, @StudentName, @StudentAddress, @StudentAge, @StudentContact)";

                    using (SqlCommand comm = new SqlCommand(query, con))
                    {
                        // Parse age safely
                        double studentAge = double.TryParse(txtStudentAge.Text, out double sAge) ? sAge : 0.0;

                        // Add parameters
                        comm.Parameters.AddWithValue("@StudentId", studentId);
                        comm.Parameters.AddWithValue("@StudentName", txtStudentName.Text);
                        comm.Parameters.AddWithValue("@StudentAddress", ddlStudentAddress.SelectedValue);
                        comm.Parameters.AddWithValue("@StudentAge", studentAge);
                        comm.Parameters.AddWithValue("@StudentContact", txtStudentContact.Text);

                        // Execute the query
                        int rowsAffected = comm.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data Inserted Successfully!');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No Data Inserted!');", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Show error only in an alert, not on the screen
                    string errorMessage = ex.Message.Replace("'", "\\'"); // Prevent JavaScript syntax errors
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Error: {errorMessage}');", true);
                }
                finally
                {
                    // Clear fields
                    txtStudentId.Text = "";
                    txtStudentAge.Text = "";
                    txtStudentContact.Text = "";
                    txtStudentName.Text = "";
                    ddlStudentAddress.Items.Clear();
                }
            }
        }

        protected void onBtnShowStudents(object sender, EventArgs e)
        {
            Response.Redirect("StudentDetails.aspx");
        }
    }
}
