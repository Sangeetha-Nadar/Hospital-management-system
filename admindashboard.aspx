<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admindashboard.aspx.cs" Inherits="loginpg.admindashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        button, .button {
            background-color: rgb(102, 163, 166);
            margin: 5px;
            padding: 10px 20px;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin-left:39px;
        }
        button:hover, .button:hover {
            background-color:rgb(132, 196, 210);
        }
        .form-container {
            display: none;
            margin-top: 20px;
        }
        .form-container.active {
            display: block;
        }
        input, select, textarea {
            margin-bottom: 10px;
            padding: 5px;
        }
        body {
            font-size: 18px;
            margin: 20px;
            background-color:rgb(162, 225, 225);
        }
        #txtNotice{
            height:300px;
            width:550px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: rgb(102, 163, 166);
            color: white;
        }
        .dashboard-buttons {
            margin-bottom: 20px;
        }
        #DoctorGender {
            width: 92px; /* Adjust width */
            height: 12px; /* Adjust height */
            margin-left: 700px; /* Space between radio button and label */
        }
        #recepGender{
             width: 92px; /* Adjust width */
            height: 12px; /* Adjust height */
            margin-left: 700px;
        }
        #nurseGender{
             width: 92px; /* Adjust width */
                height: 12px; /* Adjust height */
            margin-left: 700px;
        }
        #idimg{
            height:320px;
            width:1100px;
            margin-left:200px;
        }
    </style>
<script>
    function showForm(formId, event) {
        if (event) {
            event.preventDefault(); // Prevent default behavior
        }
        document.querySelectorAll('.form-container').forEach(form => form.style.display = "none");// Hide all forms
        document.getElementById(formId).style.display = "block";// Show the selected form
    }
</script>
</head>
<body runat="server">
    <form id="form1" runat="server">
         <img id="idimg" src="/wwwroot/images/admin.jpg" />
           <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="dashboard-buttons">
         <asp:Button ID="btnViewStaff"  type="button" runat="server" Text="View All Staff" CssClass="button" OnClick="btnViewStaff_Click" />
  <button type="button" onclick="showForm('addDoctorForm', event)">Add Doctor</button>
            <button type="button" onclick="showForm('deleteStaffForm', event)">Delete Staff</button>
             <button type="button" onclick="showForm('addNurseForm', event)">Add Nurse</button>
            <button type="button" onclick="showForm('addReceptionistForm', event)">Add Receptionist</button>
            <button type="button" onclick="showForm('sendNoticeForm', event)">Send Notice</button>
            <asp:Button ID="btnviewfeedback"  type="button" runat="server" Text="View feedback" CssClass="button" OnClick="btnViewfeedback_Click" />
             <button type="button" onclick="showForm('logoutForm', event)">Log Out</button>
        </div>
      <div id="viewStaffForm" class="form-container" style="display: none;"> <!-- View Staff Form -->
    <h3>View All Staff</h3>
    <asp:Panel ID="pnlStaffGrid" runat="server">
        <asp:GridView ID="gvStaff" runat="server" AutoGenerateColumns="False" CssClass="table">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="phone_no" HeaderText="Phone No" />
                <asp:BoundField DataField="Designation" HeaderText="Designation" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
</div>
        <%-- <asp:Button ID="btnLoadStaff" runat="server" Text="Load Staff Data" OnClick="btnLoadStaff_Click" Style="display:none;" />
   --%>
        <!-- Add Doctor Form -->
      <div style="text-align: center; margin-top: 50px;" id="addDoctorForm" class="form-container">
            <h3>Add Doctor</h3>
               <asp:Label ID="DoctorName1" runat="server" Text="Doctor Name:" AssociatedControlID="txtDoctorName"></asp:Label>
            <asp:TextBox ID="txtDoctorName" runat="server" placeholder="Enter doctor's name"></asp:TextBox> <br /><br />
            <asp:Label ID="DoctorAddress1" runat="server" Text="Address:" AssociatedControlID="DoctorAddress"></asp:Label>
            <asp:TextBox ID="DoctorAddress" runat="server" placeholder="Enter doctor's address"></asp:TextBox><br /><br />
            <asp:Label ID="DoctorAge1" runat="server" Text="Age:" AssociatedControlID="DoctorAge"></asp:Label>
          <asp:TextBox ID="DoctorAge" runat="server" placeholder="Enter doctor's age"></asp:TextBox><br /><br />
            <asp:Label ID="DoctorContact" runat="server" Text="Contact Number:" AssociatedControlID="DoctorNumber"></asp:Label>
            <asp:TextBox ID="DoctorNumber" runat="server" placeholder="Enter contact number"></asp:TextBox> <br /><br /> 
 <asp:Label ID="DoctorGender1" runat="server" Text="Gender:" AssociatedControlID="DoctorGender"></asp:Label>
<asp:RadioButtonList ID="DoctorGender" runat="server" RepeatDirection="Horizontal">
    <asp:ListItem Text="Male" Value="Male"></asp:ListItem> 
    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
</asp:RadioButtonList><br /><br />
            <asp:Label ID="DoctorSpecialist1" runat="server" Text="Specialist in:" AssociatedControlID="DoctorSpecialist"></asp:Label>
<asp:DropDownList ID="DoctorSpecialist" runat="server">
<asp:ListItem Text="specialistin" Value="" />
<asp:ListItem Text="Fever" Value="Fever"></asp:ListItem>
<asp:ListItem Text="Cardiology" Value="Cardiology"></asp:ListItem>
<asp:ListItem Text="Dental" Value="Dental"></asp:ListItem>
<asp:ListItem Text=" Orthopedic" Value=" Orthopedic"></asp:ListItem>
<asp:ListItem Text="Neurology" Value="Neurology"></asp:ListItem>
<asp:ListItem Text="Pediatric" Value="Pediatric"></asp:ListItem>
<asp:ListItem Text="Radiology" Value="Radiology"></asp:ListItem>
    <asp:ListItem Text="Dermatology" Value="Dermatology"></asp:ListItem>
</asp:DropDownList><br /><br />
          <asp:Label ID="pwd" runat="server" Text="Doctor Password:" AssociatedControlID="DoctorPassword"></asp:Label>
          <asp:TextBox ID="DoctorPassword" runat="server" placeholder="Enter doctor's password"></asp:TextBox><br /><br /><br />
            <asp:Button ID="btnAddDoctor" runat="server" Text="Add Doctor" CssClass="button" OnClick="btnSubmit_Click"/>
          <asp:Label ID="Label2" runat="server" ForeColor="Green"></asp:Label>
        </div>
<div id="deleteStaffForm" class="form-container"> <!-- Delete Staff Form -->
            <h3>Delete Staff</h3>
          <asp:Label ID="Label14" runat="server" Text="Specialist in:" AssociatedControlID="stafftype"></asp:Label>
             <asp:DropDownList ID="stafftype" runat="server">
                <asp:ListItem Text="Select Staff Type" Value="" />
                <asp:ListItem Text="Doctor" Value="Doctor"></asp:ListItem>
                <asp:ListItem Text="Nurse" Value="Nurse"></asp:ListItem>
                <asp:ListItem Text="Receptionist" Value="Receptionist"></asp:ListItem>
            </asp:DropDownList><br />
           <asp:Label ID="lblstaffName" runat="server" Text="staff Name:" AssociatedControlID="txtstaffName"></asp:Label> <br /><!-- Staff Name TextBox -->
           <asp:TextBox ID="txtstaffName" runat="server" placeholder="Enter staff name"></asp:TextBox><br /><br />
             <asp:Label ID="lblstaffid" runat="server" Text="staff ID:" AssociatedControlID="txtstaffID"></asp:Label> <br />
            <asp:TextBox ID="txtstaffID" runat="server" placeholder="Enter staff ID"></asp:TextBox><br /><br />
                 
                   <!-- UpdatePanel for Asynchronous Postback -->
            <asp:UpdatePanel ID="UpdatePanelDelete" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Button ID="btnDeleteStaff" runat="server" Text="Delete" OnClick="btnDeleteStaff_Click" Visible="true" CssClass="button" />
                     <asp:Label ID="lblDeleteMessage" runat="server" ForeColor="Green"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>

            <!-- Status Message Label -->
           
 </div>
        <!-- Add nurse Form -->
                <div style="text-align: center; margin-top: 50px;" id="addNurseForm" class="form-container">
             <h3>Add Nurse</h3>
            <asp:Label ID="Label9" runat="server" Text="Name:" AssociatedControlID="nurseName"></asp:Label>
            <asp:TextBox ID="nurseName" runat="server" placeholder="Enter nurse name"></asp:TextBox> <br /><br />
            <asp:Label ID="Label10" runat="server" Text="Address:" AssociatedControlID="nurseAddress"></asp:Label>
            <asp:TextBox ID="nurseAddress" runat="server" placeholder="Enter nurse address"></asp:TextBox><br /><br />
            <asp:Label ID="Label11" runat="server" Text="Age:" AssociatedControlID="nurseAge"></asp:Label>
          <asp:TextBox ID="nurseAge" runat="server" placeholder="Enter nurse age"></asp:TextBox><br /><br />
            <asp:Label ID="Label12" runat="server" Text="Contact Number:" AssociatedControlID="nurseNumber"></asp:Label>
            <asp:TextBox ID="nurseNumber" runat="server" placeholder="Enter contact number"></asp:TextBox> <br /><br /> 
 <asp:Label ID="Label13" runat="server" Text="Gender:" AssociatedControlID="nurseGender"></asp:Label>
<asp:RadioButtonList ID="nurseGender" runat="server" RepeatDirection="Horizontal">
    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
</asp:RadioButtonList><br /><br />
            
  <asp:Button ID="Button2" runat="server" Text="Add Nurse" OnClick="btnaddnurse_Click" CssClass="button"/>
<asp:Label ID="Label15" runat="server" ForeColor="Green"></asp:Label>
        
        </div>


        <!-- add receptionist Form -->
        <div style="text-align: center; margin-top: 50px;" id="addReceptionistForm" class="form-container">
             <h3>Add Receptionist</h3>
            <asp:Label ID="Label1" runat="server" Text="Name:" AssociatedControlID="recepName"></asp:Label>
            <asp:TextBox ID="recepName" runat="server" placeholder="Enter receptionist name"></asp:TextBox> <br /><br />
            <asp:Label ID="Label3" runat="server" Text="Address:" AssociatedControlID="recepAddress"></asp:Label>
            <asp:TextBox ID="recepAddress" runat="server" placeholder="Enter receptionist address"></asp:TextBox><br /><br />
            <asp:Label ID="Label4" runat="server" Text="Age:" AssociatedControlID="recepAge"></asp:Label>
          <asp:TextBox ID="recepAge" runat="server" placeholder="Enter receptionist age"></asp:TextBox><br /><br />
            <asp:Label ID="Label5" runat="server" Text="Contact Number:" AssociatedControlID="recepNumber"></asp:Label>
            <asp:TextBox ID="recepNumber" runat="server" placeholder="Enter contact number"></asp:TextBox> <br /><br /> 
 <asp:Label ID="Label6" runat="server" Text="Gender:" AssociatedControlID="recepGender"></asp:Label>
<asp:RadioButtonList ID="recepGender" runat="server" RepeatDirection="Horizontal">
    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
</asp:RadioButtonList><br /><br />
            <asp:Label ID="Label7" runat="server" Text="Password:" AssociatedControlID="recepPassword"></asp:Label>
<asp:TextBox ID="recepPassword" runat="server" placeholder="Enter password"></asp:TextBox><br /><br /><br /><br />
 
  <asp:Button ID="Button1" runat="server" Text="Add Receptionist" OnClick="btnaddrecep_Click" CssClass="button"/>
<asp:Label ID="Label8" runat="server" ForeColor="Green"></asp:Label>
        
        </div>
        <!-- Send Notice Form -->
        <div style="text-align: center; margin-top: 50px;" id="sendNoticeForm" class="form-container">
            <h3>Send Notice</h3>
            <asp:TextBox ID="txtNotice" runat="server" TextMode="MultiLine" placeholder="Enter Notice"></asp:TextBox><br />
            <asp:Button ID="Button3" runat="server" Text="Send notice" OnClick="noticeSubmit_Click" CssClass="button"/>
            <asp:Label ID="Lbl2" runat="server" ForeColor="Green"></asp:Label>
        </div>
     <div id="viewfeedback" class="form-container">
            <h3>View feedback</h3>
      <asp:Panel ID="Panel1" runat="server">
       <asp:GridView ID="gridviewfdbk" runat="server" AutoGenerateColumns="False" CssClass="table">
        <Columns>
            <asp:BoundField DataField="star" HeaderText="star" />
            <asp:BoundField DataField="feedback" HeaderText="feedback" />
        </Columns>
       </asp:GridView>
      </asp:Panel>
        </div>
        <!-- Logout -->
        <div style="text-align: center; margin-top: 50px;" id="logoutForm" class="form-container">
            <h3>Are you sure you want to log out?</h3>
            <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="logout_click" CssClass="button"/>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
   
        </div>
            

     </form>
</body>
</html>
