<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StudentManagementCrudOperation.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Management System</title>
    <style>
        .whole {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .bg-video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -999; /* Sends video to the background */
        }

        .content {
            position: relative;
            z-index: 1; /* Ensures text stays on top */
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 90vh;
            margin-top: 50px;
        }

        .container {
            background: rgba(70, 70, 70, 0.6); /* Black with 60% transparency */
            color: ghostwhite; /* White text for contrast */
            padding: 30px 30px 60px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.6); /* Soft shadow */
        }

        h1 {
            color: cornsilk;
            font-size: 50px;
            text-align: center;
        }



        .table-container {
            display: flex;
            justify-content: start !important;
            align-items: center;
        }

        td span {
            display: flex;
            justify-content: start;
        }

        span {
            font-weight: 600;
            font-size: 25px;
        }

        input {
            width: 300px;
            padding: 8px;
            background-color: #fffdf3;
            border-radius: 10px;
            border: 2px solid black;
        }

        #ddlStudentAddress {
            width: 320px;
            padding: 8px;
            background-color: #fffdf3;
            border-radius: 10px;
            border: 2px solid black;
        }

        .btn {
            margin-top: 20px;
            width: 150px;
            background-color: cornsilk;
            color: black;
            border: 2px solid black;
            font-size: 20px;
            font-weight: 400;
            transition: 1s;
            cursor: pointer;
            border-radius: 10px;
        }

            .btn:hover {
                background-color: red;
            }

        .error-message {
            position: absolute;
            top: 20px;
            right: 10px;
            color: black;
            padding: 10px;
            width: 350px;
            font-size: 20px;
            margin: 10px;
            z-index: 10;
            font-weight: 900;
            border-radius: 5px;
            box-shadow: 0px 4px 6px rgba(70, 70, 70, 0.7);
        }

            .error-message::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgb(70 70 70 / 0.8); /* Semi-transparent black */
                border-radius: 5px; /* Match error message border-radius */
                z-index: -1; /* Places it behind the message */
            }


            .error-message li {
                position: relative;
                padding: 5px;
                color: white;
                z-index: 10;
                justify-content: start;
                text-align: left;
            }

        .btn-show-students {
            padding: 10px 0px;
            position: absolute;
            left: 150px;
            top: 20px;
            background-color: cornsilk;
            color: black;
            border: 2px solid black;
            font-size: 20px;
            font-weight: 400;
            transition: 1s;
            cursor: pointer;
            width: 200px;
            border-radius: 10px;
        }

            .btn-show-students:hover {
                background-color: red;
                color: white;
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

            <asp:Button runat="server" Text="Show Students" CssClass="btn-show-students" OnClick="onBtnShowStudents" />
            <div class="container">
                <h1>Student Management System</h1>
                <h2>Students Details Form</h2>
                <br />
                <div class="table-container">

                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblStudentId">Student ID:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox runat="server" ID="txtStudentId"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblStudentName">Student Name:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox runat="server" ID="txtStudentName" ControlToValidate="txtStudentName"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblStudentAddress">Address:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList runat="server" ID="ddlStudentAddress">
                                    <asp:ListItem>Select State</asp:ListItem>
                                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Assam</asp:ListItem>
                                    <asp:ListItem>Bihar</asp:ListItem>
                                    <asp:ListItem>Chhattisgarh</asp:ListItem>
                                    <asp:ListItem>Goa</asp:ListItem>
                                    <asp:ListItem>Gujarat</asp:ListItem>
                                    <asp:ListItem>Haryana</asp:ListItem>
                                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Jharkhand</asp:ListItem>
                                    <asp:ListItem>Karnataka</asp:ListItem>
                                    <asp:ListItem>Kerala</asp:ListItem>
                                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                    <asp:ListItem>Maharashtra</asp:ListItem>
                                    <asp:ListItem>Manipur</asp:ListItem>
                                    <asp:ListItem>Meghalaya</asp:ListItem>
                                    <asp:ListItem>Mizoram</asp:ListItem>
                                    <asp:ListItem>Nagaland</asp:ListItem>
                                    <asp:ListItem>Odisha</asp:ListItem>
                                    <asp:ListItem>Punjab</asp:ListItem>
                                    <asp:ListItem>Rajasthan</asp:ListItem>
                                    <asp:ListItem>Sikkim</asp:ListItem>
                                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                                    <asp:ListItem>Telangana</asp:ListItem>
                                    <asp:ListItem>Tripura</asp:ListItem>
                                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                    <asp:ListItem>Uttarakhand</asp:ListItem>
                                    <asp:ListItem>West Bengal</asp:ListItem>
                                    <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                    <asp:ListItem>Chandigarh</asp:ListItem>
                                    <asp:ListItem>Dadra and Nagar Haveli and Daman and Diu</asp:ListItem>
                                    <asp:ListItem>Delhi</asp:ListItem>
                                    <asp:ListItem>Lakshadweep</asp:ListItem>
                                    <asp:ListItem>Puducherry</asp:ListItem>
                                    <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                    <asp:ListItem>Ladakh</asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblStudentAge">Age:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox runat="server" ID="txtStudentAge"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblStudentContact">Contact:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox runat="server" ID="txtStudentContact"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                </div>
                <asp:Button runat="server" Text="Add" OnClick="onbtnAddClicked" class="btn" ValidationGroup="error" />
            </div>

            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtStudentId"
                ErrorMessage="Student ID must be a number." ValidationGroup="error"
                ValidationExpression="^\d+$" Display="None"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtStudentName"
                ErrorMessage="Student Name must be at least 4 characters long and contain only letters."
                ValidationGroup="error" Display="None"
                ValidationExpression="^[A-Za-z]{4,}$">
</asp:RegularExpressionValidator>

            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtStudentAge"
                ErrorMessage="Age must be a number." ValidationGroup="error"
                ValidationExpression="^\d+$" Display="None"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtStudentContact"
                ErrorMessage="Contact must be exactly 10 digits." ValidationGroup="error"
                ValidationExpression="^\d{10}$" Display="None"></asp:RegularExpressionValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStudentId" ErrorMessage="Student Id Required." SetFocusOnError="True" ValidationGroup="error" Display="None"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Student Name Required." SetFocusOnError="True" ValidationGroup="error" ControlToValidate="txtStudentName" Display="None"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Age is Required." Display="None" ValidationGroup="error" ControlToValidate="txtStudentAge" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Contact is Required." Display="None" ValidationGroup="error" ControlToValidate="txtStudentContact" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="error" DisplayMode="BulletList" class="error-message" HeaderText="Rectify the errors to submit the form !" ForeColor="red" Font-Bold="True" />
        </div>

    </form>
</body>
</html>
