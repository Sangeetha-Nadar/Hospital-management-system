<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receptionistlogin.aspx.cs" Inherits="loginpg.receptionistlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>receptionist Login</title>
    <style>
        
        .form-container {
           background: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        button, .button{
            font-size: 18px;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
            background-color: rgb(102, 163, 166);
            color: white;
            border: none;
            border-radius: 5px;
        }
        button:hover, .button:hover{
           background-color: rgb(132, 196, 210);
        }
        input {
            font-size: 18px;
            padding: 8px;
            margin: 5px 0;
            width: 100%;
        }
        body {
            background-color: aqua;   /* Fallback color if image doesn't load */
            background-image: url('/wwwroot/images/hsptldept.jpg');   /* Path to image */
            background-repeat: no-repeat;
            background-size: cover;   /* Make the image cover the full page */
            background-position: center center;   /* Center the image */
            font-size: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;  /* Full height */
            margin: 0;
        }
    </style>
</head>
<body runat="server" style="background-color: aqua; height: 751px; font-size: 20px; background-image: url('/wwwroot/images/hsptldept.jpg'); background-repeat: no-repeat; background-size: cover; margin: 0;">
    <form id="form1" runat="server">
        <div class="form-container">
         <h2>Receptionist Login</h2>

<asp:Label ID="lblrecepName" runat="server" Text="Receptionist Name:" AssociatedControlID="txtrecepName"></asp:Label>
<asp:TextBox ID="txtrecepName" runat="server" placeholder="Enter receptionist name"></asp:TextBox>     <br /><br />
<asp:Label ID="recepPassword" runat="server" Text="Password:" AssociatedControlID="txtrecepPassword"></asp:Label>
<asp:TextBox ID="txtrecepPassword" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
     <br /><br />
 <asp:Button ID="receplogin" runat="server" Text="Login" OnClick="btnrecep_submit" CssClass="button"/>
<asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

    </div>
        </form>
</body>
</html>
