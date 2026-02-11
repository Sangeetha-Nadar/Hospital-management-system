<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="loginpg.appointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointment</title>
    <style>
         
        body {
            background-color: rgb(162, 225, 225);
            font-size: 20px;
            background-image: url("/wwwroot/images/bookappointment.jpg");
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
        h2 {
            text-align: center;
            margin-top: 70px;
        }
         .content-section{
             display: none;
              margin-top: 20px;

         }
         .content-section.active{
          display: block;
         }
        .checkbox-label {
            display: block;
            margin-left: 300px;
        }
        button, .button{
            background-color: rgb(102, 163, 166);
            padding: 10px 20px;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            z-index: 1000;
        }
        button:hover, .button:hover{
            background-color: rgb(132, 196, 210);
        }
    .form-container {
    display: none;
    }

        
  
    </style>
    <script>
        function showSection(formId, event) {
            // Prevent default action (if triggered by a button)
            if (event) {
                event.preventDefault();
            }

            // Hide all forms
            const forms = document.querySelectorAll('.form-container');
            forms.forEach(form => form.style.display = 'none');

            // Show the selected form
            const selectedForm = document.getElementById(formId);
            if (selectedForm) {
                selectedForm.style.display = 'block'; // Correctly make it visible
            }
        }

    </script>

</head>
<body runat="server">
 <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" />
 
     <button type="button" onclick="showSection('bookAppointment', event)">Book Appointment</button>
     <button type="button" onclick="showSection('cancelAppointment', event)">Cancel Appointment</button>
   
    
<div id="bookAppointment" class="form-container" >
     <h2>Appointment Booking</h2>
             <asp:Label ID="patname" runat="server" Text=" Name:" AssociatedControlID="txtpatName"></asp:Label><br />
    <asp:TextBox ID="txtpatName" runat="server" placeholder="Enter patient's name"></asp:TextBox> <br /><br />
    <asp:Label ID="lbpatagel" runat="server" Text=" Age:" AssociatedControlID="txtpatage"></asp:Label><br />
    <asp:TextBox ID="txtpatage" runat="server" placeholder="Enter patient's age"></asp:TextBox> <br /><br />
     <asp:Label ID="lblpatno" runat="server" Text="contact number:" AssociatedControlID="txtpatnumber"></asp:Label><br />
   <asp:TextBox ID="txtpatnumber" runat="server" placeholder="Enter contact number"></asp:TextBox> <br /><br />
    <asp:Label ID="Lbladdress" runat="server" Text="Address:" AssociatedControlID="txtpataddress"></asp:Label><br />
    <asp:TextBox ID="txtpataddress" runat="server" placeholder="Enter address"></asp:TextBox> <br /><br />
   <asp:Label ID="lblpatGender" runat="server" Text="Gender:" AssociatedControlID="patGender"></asp:Label>
    <asp:RadioButtonList ID="patGender" runat="server" RepeatDirection="Horizontal">
     <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
  <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
  </asp:RadioButtonList><br /><br />
    <asp:Label ID="pattreatment" runat="server" Text="Treatment needed:" AssociatedControlID="txtpattreatment"></asp:Label>
  <asp:DropDownList ID="txtpattreatment" runat="server">
  <asp:ListItem Text="Treatment" Value="" />
  <asp:ListItem Text="Fever" Value="Fever"></asp:ListItem>
  <asp:ListItem Text="Cardiology" Value="Cardiology"></asp:ListItem>
  <asp:ListItem Text="Dental" Value="Dental"></asp:ListItem>
  <asp:ListItem Text=" Orthopedic" Value=" Orthopedic"></asp:ListItem>
  <asp:ListItem Text="Neurology" Value="Neurology"></asp:ListItem>
  <asp:ListItem Text="Pediatric" Value="Pediatric"></asp:ListItem>
  <asp:ListItem Text="Radiology" Value="Radiology"></asp:ListItem>
  <asp:ListItem Text="Dermatology" Value="Dermatology"></asp:ListItem>
  </asp:DropDownList><br /><br />
     <asp:Label ID="lblemail" runat="server" Text=" Mail ID:" AssociatedControlID="txtemail"></asp:Label>
 <asp:TextBox ID="txtemail" runat="server" placeholder="Enter email"></asp:TextBox><br /><br />

   <asp:Button ID="btnAddpat" runat="server" Text="Book Apointment" OnClick="btnapointpat_Click" CssClass="button"/> <br />    
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
     <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
        
            
</div>
 <div id="cancelAppointment" class="form-container" >
      <h2>Cancel Appointment </h2>
      <asp:Label ID="Lblcancelpatnm" runat="server" Text=" Name:" AssociatedControlID="txtcancelpatName"></asp:Label><br />
      <asp:TextBox ID="txtcancelpatName" runat="server" placeholder="Enter patient's name"></asp:TextBox> <br /><br />
        <asp:Label ID="Lblpatid" runat="server" Text=" ID:" AssociatedControlID="txtcancelpatid"></asp:Label><br />
      <asp:TextBox ID="txtcancelpatid" runat="server" placeholder="Enter patient's ID"></asp:TextBox> <br /><br />
        <asp:Button ID="Btncancel" runat="server" Text="Cancel Apointment" OnClick="cancelapointpat_Click" CssClass="button"/>     
         <asp:Label ID="Label3" runat="server" ForeColor="Green"></asp:Label>


 </div>
 </form>  
</body>
</html>
