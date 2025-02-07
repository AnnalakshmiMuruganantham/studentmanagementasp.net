using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;

namespace StudentManagementCrudOperation
{
    public partial class StudentDetails : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentDetails();
            }
        }

        private void LoadStudentDetails()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Student_Details", con))
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            StudentGridView.DataSource = dt;
                            StudentGridView.DataBind();
                        }
                        else
                        {
                            dt.Rows.Add(dt.NewRow());
                            StudentGridView.DataSource = dt;
                            StudentGridView.DataBind();
                            StudentGridView.Rows[0].Cells.Clear();
                            StudentGridView.Rows[0].Cells.Add(new TableCell { ColumnSpan = dt.Columns.Count });
                            StudentGridView.Rows[0].Cells[0].Text = "No records found.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }


        protected void StudentGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            StudentGridView.EditIndex = e.NewEditIndex;
            LoadStudentDetails();
        }

        protected void StudentGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            StudentGridView.EditIndex = -1;
            LoadStudentDetails();
        }

        protected void StudentGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int studentID = Convert.ToInt32(StudentGridView.DataKeys[e.RowIndex].Value);
            GridViewRow row = StudentGridView.Rows[e.RowIndex];

            string studentName = ((TextBox)row.FindControl("txtStudentName")).Text.Trim();
            string ageText = ((TextBox)row.FindControl("txtAge")).Text.Trim();
            string address = ((TextBox)row.FindControl("txtAddress")).Text.Trim();
            string contact = ((TextBox)row.FindControl("txtContact")).Text.Trim();

            // **Validation**
            if (string.IsNullOrWhiteSpace(studentName) || !System.Text.RegularExpressions.Regex.IsMatch(studentName, "^[A-Za-z\\s]{4,}$"))
            {
                Response.Write("<script>alert('Error: Student Name must be at least 4 characters and contain only letters.');</script>");
                return;
            }

            if (!int.TryParse(ageText, out int age))
            {
                Response.Write("<script>alert('Error: Age must be a given and contain only number.');</script>");
                return;
            }

            if (string.IsNullOrWhiteSpace(address))
            {
                Response.Write("<script>alert('Error: Address cannot be empty.');</script>");
                return;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(contact, "^[0-9]{10}$"))
            {
                Response.Write("<script>alert('Error: Contact must be a 10-digit number.');</script>");
                return;
            }

            // **Proceed with update if validation passes**
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "UPDATE Student_Details SET StudentName=@StudentName, Age=@Age, Address=@Address, Contact=@Contact WHERE StudentID=@StudentID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@StudentID", studentID);
                        cmd.Parameters.AddWithValue("@StudentName", studentName);
                        cmd.Parameters.AddWithValue("@Age", age);
                        cmd.Parameters.AddWithValue("@Address", address);
                        cmd.Parameters.AddWithValue("@Contact", contact);

                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }

            StudentGridView.EditIndex = -1;
            LoadStudentDetails();
        }


        protected void StudentGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Add JavaScript confirmation
            ClientScript.RegisterStartupScript(this.GetType(), "confirm", "if(!confirm('Are you sure you want to delete this record?')) return;", true);

            int studentID = Convert.ToInt32(StudentGridView.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "DELETE FROM Student_Details WHERE StudentID=@StudentID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@StudentID", studentID);
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }

            LoadStudentDetails();
        }

        protected void onBtnBack(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void StudentGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            StudentGridView.PageIndex = e.NewPageIndex;
            LoadStudentDetails();
        }

    }
}
