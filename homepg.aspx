<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepg.aspx.cs" Inherits="loginpg.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hospital Management System</title>
    <style>
        body{
            background-color:rgb(162, 225, 225);
            align-items:center;
            font-size:25px;
        }
        h1{
            background-color: rgb(100, 196, 237);
            font-size: xx-large;
            
        }
        #b1{
         height: 350px;
         width: 1300px;
         padding-left:100px;
        }
#b2{
    height: 45px;
    width:50px;
    margin-left: 5px;
    margin-top: 4px;
}

a{
    padding-left: 700px;
    text-decoration: none;
    font-size: 20px;
}
button, .btn{
    background-color: rgb(102, 163, 166);
    width:170px;
    height:40px;
    margin: 10px 0;
    margin-left:650px;
     padding: 10px 20px;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 16px;
    border-radius: 5px;
}
button:hover, .btn:hover{
    background-color: rgb(132, 196, 210);
}

    </style>
</head>
<body runat="server">
    <form id="form1" runat="server">
        <div>
   <h1><img id="b2" src="hmslogo.jpg" alt="Hospital Logo" /><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;Caring for patient managing with excellence</i></h1><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp; RAZLI Hospital<br />
   
   <img id="b1" src="hms(homepg).jpg" alt="hospital management system"/>
   <br /><br />
   <asp:Button ID="signin" runat="server" Text="SIGN IN" OnClick="btnsignin_click" CssClass="btn"/>
   <br /><br />
   <asp:Button ID="signout" runat="server" Text="STAY SIGNED OUT" OnClick="btnsignout_click" CssClass="btn"/>
        </div>
    </form>
</body>
</html>
