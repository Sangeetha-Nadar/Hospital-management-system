<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin1.aspx.cs" Inherits="loginpg.signin1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
            button, .btn {
                background-color:rgb(102, 163, 166);
                width: 160px;
                height: 35px;
                padding: 10px 20px;
                border: none;
                color: white;
                cursor: pointer;
                font-size: 16px;
                border-radius: 5px;
                margin-left:230px;
            }

        button:hover, .btn:hover {
            background-color: rgb(132, 196, 210);
        }
</style>
</head>
<body style="background-color: rgb(162, 225, 225); font-size: 20px;" runat="server">
    <form id="form1" runat="server">
        <div>
             <img src="/wwwroot/images/signinstaff.jpg" style="height: 480px; width: 1450px; margin-left: 35px;"/><br /><br /><br />

<asp:Button ID="btnDoctor" runat="server" Text="Doctor" OnClick="btndoctorlogin_click" CssClass="btn" />
<asp:Button ID="btnReceptionist" runat="server" Text="Receptionist" OnClick="btnReceptionistLogin_Click" CssClass="btn" />
<asp:Button ID="btnAdmin" runat="server" Text="Admin" OnClick="btnadminlogin_click" CssClass="btn" />
        </div>
    </form>
</body>
</html>





    
        

