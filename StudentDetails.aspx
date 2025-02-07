<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="StudentManagementCrudOperation.StudentDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Details</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .whole {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
            height: 100vh;
        }

        .bg-video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .content {
            position: relative;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 90vh;
            margin-top: 50px;
        }

        .container {
            background: rgba(70, 70, 70, 0.6);
            color: ghostwhite;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.6);
        }

        h1 {
            color: cornsilk;
            font-size: 40px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 2px solid black;
            background-color: #fffdf3;
            color: black;
            text-align: left;
        }

        .btn-back, .btn-edit, .btn-delete, .btn-update, .btn-cancel {
            padding: 10px 20px;
            background-color: cornsilk;
            color: black;
            border: 2px solid black;
            font-size: 16px;
            cursor: pointer;
            border-radius: 10px;
            transition: 0.3s;
        }

        .btn-back {
            position: absolute;
            left: 150px;
            top: 100px;
        }

            .btn-back:hover, .btn-edit:hover, .btn-delete:hover {
                background-color: red;
                color: white;
            }

        .pagination-container {
            text-align: center;
            margin-top: 15px;
          
        }

            .pagination-container table {
                display: inline-block;
                border-collapse: collapse;
                border-radius: 8px;
                padding: 5px;
            }

            .pagination-container td {
                padding: 8px 12px;
                border: 1px solid #ddd;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
            }

            

            .pagination-container .aspNetDisabled {
                color: gray;
                cursor: not-allowed;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <video class="bg-video" autoplay="autoplay" loop="loop" muted="muted" playsinline="playsinline">
            <source src="Assests/vedio/banner.mp4" type="video/mp4" />
            Your browser does not support the video tag.
       
        </video>

        <div class="content">
            <asp:Button runat="server" Text="Go Back" CssClass="btn-back" OnClick="onBtnBack" />
            <div class="container">
                <h1>STUDENT DETAILS</h1>
                <asp:GridView ID="StudentGridView" runat="server" AutoGenerateColumns="False"
                    AllowPaging="True" PageSize="5"
                    PagerSettings-Mode="Numeric"
                    CssClass="table table-bordered"
                    OnPageIndexChanging="StudentGridView_PageIndexChanging"
                    OnRowEditing="StudentGridView_RowEditing"
                    OnRowCancelingEdit="StudentGridView_RowCancelingEdit"
                    OnRowUpdating="StudentGridView_RowUpdating"
                    OnRowDeleting="StudentGridView_RowDeleting"
                    DataKeyNames="StudentID">

                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />

                    <Columns>
                        <asp:BoundField DataField="StudentID" HeaderText="Student ID" ReadOnly="true" />

                        <asp:TemplateField HeaderText="Student Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("StudentName") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="txtStudentName" Text='<%# Bind("StudentName") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Age">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Age") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="txtAge" Text='<%# Bind("Age") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Address") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="txtAddress" Text='<%# Bind("Address") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contact">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Contact") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="txtContact" Text='<%# Bind("Contact") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button runat="server" CommandName="Edit" Text="Edit" CssClass="btn-edit" />
                                <asp:Button runat="server" CommandName="Delete" Text="Delete" CssClass="btn-delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button runat="server" CommandName="Update" Text="Update" CssClass="btn-update" />
                                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
