<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentManagementCrudOperation.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
            padding: 10px 30px 60px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.6); /* Soft shadow */
        }

        h1 {
            color: cornsilk;
            font-size: 30px;
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
            width: 200px;
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
            font-weight:900;
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
                justify-content:start;
                text-align:left;
            }

            

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <video class="bg-video" autoplay="autoplay" loop="loop" muted="muted" playsinline="playsinline">
            <source src="Assests/vedio/home_banner.mp4" type="video/mp4" />
            Your browser does not support the video tag.
        </video>

         <div class="content">
             <asp:Label runat="server" ID="lblMessage"></asp:Label>

            <div class="container">
                <h1>LOG IN</h1>
                <br />
                <div class="table-container">

                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblUser">User Name:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox runat="server" ID="txtUser"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblPassword">Password:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox runat="server" ID="txtPassword" ControlToValidate="txtStudentName"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                       

                    </asp:Table>

                </div>
                <asp:Button runat="server" Text="Login" OnClick="onbtnLoginClicked" class="btn" ValidationGroup="error" />
            </div>
              <asp:RequiredFieldValidator runat="server" ErrorMessage="User Name is Required." ControlToValidate="txtUser" Display="None" SetFocusOnError="True" ValidationGroup="error"></asp:RequiredFieldValidator>
              <asp:RequiredFieldValidator runat="server" ErrorMessage="Password is Required." ControlToValidate="txtPassword" Display="None" SetFocusOnError="True" ValidationGroup="error"></asp:RequiredFieldValidator>
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="error" DisplayMode="BulletList" class="error-message" HeaderText="Rectify the errors to Log In !" ForeColor="red" Font-Bold="True" />
           
        </div>
    </form>
</body>
</html>
