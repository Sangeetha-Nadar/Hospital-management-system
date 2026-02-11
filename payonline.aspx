
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payonline.aspx.cs" Inherits="loginpg.payonline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>payment</title>
    <style>
        body{
            background-color:rgb(162, 225, 225);
            font-size:20px;
            background-image:url("/wwwroot/images/paymentonlinebg.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed; /* Ensures background stays fixed */
            min-height: 100vh; /* Ensures body takes full height of viewport */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        button, .button{
            background-color:rgb(102, 163, 166);
            padding: 10px 20px;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }
        button:hover, .button:hover{
            background-color:rgb(132, 196, 210);
        }
    </style>
   
</head>
<body  runat="server" style=" justify-content: center; align-items: center;">
  <form id="form1" runat="server">
        <div class="form-container">
            <h2>Patient Payment</h2>

            <asp:Label ID="pName1" runat="server" Text="Patient Name:" AssociatedControlID="txtpatientName"></asp:Label><br />
            <asp:TextBox ID="txtpatientName" runat="server" placeholder="Enter patient's name"></asp:TextBox> <br /><br /><br />

            <asp:Label ID="pid" runat="server" Text="Patient ID:" AssociatedControlID="txtpatientID"></asp:Label><br />
            <asp:TextBox ID="txtpatientID" runat="server" placeholder="Enter patient's ID"></asp:TextBox> <br /><br /><br />

            <asp:Label ID="LabelAmount" runat="server" Text="Payment Amount:" AssociatedControlID="txtAmount"></asp:Label><br />
            <asp:TextBox ID="txtAmount" runat="server" placeholder="Enter amount"></asp:TextBox> <br /><br /><br />

            <asp:Label ID="LabelPaymentMethod" runat="server" Text="Payment Method:"  AssociatedControlID="ddlPaymentMethod"></asp:Label><br />
            <asp:DropDownList ID="ddlPaymentMethod" runat="server">
                <asp:ListItem Text="Select Payment Method" Value="" />
                <asp:ListItem Text="CreditCard" Value="CreditCard" />
                <asp:ListItem Text="NetBanking" Value="NetBanking" />
            </asp:DropDownList> <br /><br /><br />
            <!-- Credit Card Details -->
<div id="creditCardFields" style="display: none;">
    <asp:Label ID="lblCardNumber" runat="server" Text="Card Number:"></asp:Label><br />
    <asp:TextBox ID="txtCardNumber" runat="server" placeholder="Enter Card Number"></asp:TextBox><br /><br />

    <asp:Label ID="lblCVV" runat="server" Text="CVV:"></asp:Label><br />
    <asp:TextBox ID="txtCVV" runat="server" placeholder="Enter CVV" TextMode="Password"></asp:TextBox><br /><br />
</div>

<!-- Net Banking Details -->
<div id="netBankingFields" style="display: none;">
    <asp:Label ID="lblAccountNumber" runat="server" Text="Account Number:"></asp:Label><br />
    <asp:TextBox ID="txtAccountNumber" runat="server" placeholder="Enter Account Number"></asp:TextBox><br /><br />

    <asp:Label ID="lblIFSC" runat="server" Text="IFSC Code:"></asp:Label><br />
    <asp:TextBox ID="txtIFSC" runat="server" placeholder="Enter IFSC Code"></asp:TextBox><br /><br />
</div>
 <asp:Label ID="lblemail" runat="server" Text=" Mail ID:" AssociatedControlID="txtemail"></asp:Label>
 <asp:TextBox ID="txtemail" runat="server" placeholder="Enter email"></asp:TextBox><br /><br />

            <asp:Button ID="btnSubmit" runat="server" Text="Proceed Payment" OnClick="btnpay_Click" CssClass="button" />
            
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
             <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
        
        </div>
    </form>
        <script>
            document.addEventListener("DOMContentLoaded", function ()
            {
                var ddlPayment = document.getElementById('<%= ddlPaymentMethod.ClientID %>');

            // Add event listener on change
                ddlPayment.addEventListener("change", function ()
                {
                    togglePaymentFields(ddlPayment.value);
                 });
            });

            function togglePaymentFields(paymentMethod)
            {
                document.getElementById("creditCardFields").style.display = (paymentMethod === "CreditCard") ? "block" : "none";
                document.getElementById("netBankingFields").style.display = (paymentMethod === "NetBanking") ? "block" : "none";
            }
</script>
</body>
</html>
