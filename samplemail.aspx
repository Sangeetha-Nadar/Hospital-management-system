<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="samplemail.aspx.cs" Inherits="loginpg.samplemail" %>

<!DOCTYPE html>
<html>
<head>
    <title>Send Email</title>
</head>
<body runat="server">
    <form id="form1" runat="server">
        <h2>Send an Email</h2>
        <div style="text-align: center;">
            <asp:Label ID="lblemail" runat="server" Text="Recipient Email:" AssociatedControlID="txtemail"></asp:Label>
            <asp:TextBox ID="txtemail" runat="server" placeholder="Enter email"></asp:TextBox><br /><br />

            <asp:Button ID="btnSend" runat="server" Text="Send Email" OnClick="btnSend_Click" /><br /><br />

            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>