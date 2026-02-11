<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctorlogin.aspx.cs" Inherits="loginpg.doctorlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor login</title>
    <style>
        
        .form-container {
            background: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        input {
            font-size: 18px;
            padding: 8px;
            margin: 5px 0;
            width: 100%;
        }
        button, .btn {
            font-size: 18px;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
            background-color: rgb(102, 163, 166);
            color: white;
            border: none;
            border-radius: 5px;
        }

        button:hover, .btn:hover {
            background-color: rgb(132, 196, 210);
        }
        body{
             display: flex;
             justify-content: center;
             align-items: center;
             height: 100vh;  /* Full height */
             margin: 0;
             font-size:20px;
        }
        
    </style>
</head>
<body runat="server" style="background-color: aqua; font-size:20px; background-repeat:no-repeat; background-size: cover;" background="/wwwroot/images/hsptldept.jpg" >
   <form id="form1" runat="server">
    <div class="form-container">
        <h2>Doctor Login</h2>

       <asp:Label ID="lblDoctorName" runat="server" Text="Doctor Name:" AssociatedControlID="txtDoctorName"></asp:Label>
       <asp:TextBox ID="txtDoctorName" runat="server" placeholder="Enter doctor's name"></asp:TextBox>     <br /><br />
       <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword"></asp:Label>
       <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            <br /><br />
        <asp:Button ID="Doctorlogin" runat="server" Text="Login" OnClick="btnSubmit_Click" CssClass="btn" />
       <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

        
    </div>
       </form>
    </body>
</html>
