<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctorchat.aspx.cs" Inherits="loginpg.doctorchat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblusername" runat="server" Text="Name:" AssociatedControlID="txtuserName"></asp:Label>
            <asp:TextBox ID="txtuserName" runat="server" placeholder="Enter name"></asp:TextBox> <br /><br />
             <asp:Label ID="lblpwd" runat="server" Text="Password:" AssociatedControlID="txtpwd"></asp:Label>
            <asp:TextBox ID="txtpwd" runat="server" placeholder="Enter password"></asp:TextBox> <br /><br />
               <asp:Button ID="btnsubmit" runat="server" Text="Submit " OnClick="btnSubmit_Click"/>
            <asp:Label ID="Label2" runat="server" ForeColor="Green"></asp:Label>
       
        </div>
    </form>
</body>
</html>
