<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receptionistdashboard.aspx.cs" Inherits="loginpg.receptionistdashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>receptionist-dashboard</title>
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
            margin-left:54px;
        }
        button:hover, .button:hover {
            background-color: rgb(132, 196, 210);
        }
        .form-container {
            display: none;
            margin-top: 20px;
        }
        .form-container.active {
            display: block;
        }
        input, select {
            margin-bottom: 10px;
        }
        body{
            font-size: 20px;
            background-color:rgb(162, 225, 225);
        }
        #locationimg{
    height:220px;
    width:900px;
    margin-left:170px;
}
    </style>
    <script>
        function showForm(formId, event) {
            if (event) {
                event.preventDefault(); // Prevent default behavior
            }

            // Hide all forms
            document.querySelectorAll('.form-container').forEach(form => form.style.display = "none");

            // Show the selected form
            document.getElementById(formId).style.display = "block";
        
        if (formId === 'location') {
            const imgElement = document.getElementById('locationImg');
            imgElement.style.display = "block"; // Make the image visible
        }
        else {
            const imgElement = document.getElementById('locationImg');
            imgElement.style.display = "none"; // Hide the image
            }
        }
    </script>

</head>
<body runat="server">
     <form id="form1" runat="server">
         <img id="idimg" src="/wwwroot/images/receptionist.jpg" /><br />
       
         <asp:ScriptManager ID="ScriptManager1" runat="server" />
       
    <asp:Button ID="btnViewpat"  type="button" runat="server" Text="View Patient" CssClass="button" OnClick="btnViewpatient_Click" />
   <button type="button" onclick="showForm('addPatient', event)">Add patient</button>
    <button type="button" onclick="showForm('deletePatient', event)">Delete patient</button>
    <button type="button" onclick="showForm('dischargePatient', event)">Discharge patient</button>
    <asp:Button ID="btnvwnotice" type="button" runat="server" Text="View notice" CssClass="button" OnClick="btnViewNotices_Click" />
    <button type="button" onclick="showForm('generateBill', event)">Generate bill</button>
    <button type="button" onclick="showForm('location',event)">Location</button>
    <button type="button" onclick="showForm('logout', event)">Log out</button>


<div id="viewpatient" class="form-container" style="display: none;">
    <h3>View All patient</h3>
    <asp:Panel ID="pnlStaffGrid" runat="server">
        <asp:GridView ID="gvpatient" runat="server" AutoGenerateColumns="False" CssClass="table">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="phone_no" HeaderText="Phone No" />
                <asp:BoundField DataField="current_Status" HeaderText="Current status" />
                <asp:BoundField DataField="Payment_Status" HeaderText="Payment status" />

            </Columns>
        </asp:GridView>
    </asp:Panel>
</div>
    <div id="addPatient" class="form-container">
        <h3>Add Patient</h3>
        
            <asp:Label ID="patname" runat="server" Text="patient Name:" AssociatedControlID="txtpatName"></asp:Label><br />
            <asp:TextBox ID="txtpatName" runat="server" placeholder="Enter patient's name"></asp:TextBox> <br /><br />
            <asp:Label ID="lbpatagel" runat="server" Text="patient age:" AssociatedControlID="txtpatage"></asp:Label><br />
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
             <asp:Label ID="Lblroom" runat="server" Text="Allocate rooms" AssociatedControlID="patrooms"></asp:Label>
           <asp:RadioButtonList ID="patrooms" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Text="Room 1" Value="Room1"></asp:ListItem>
            <asp:ListItem Text="Room 2" Value="Room2"></asp:ListItem>
             <asp:ListItem Text="Room 3" Value="Room3"></asp:ListItem>
            <asp:ListItem Text="Room 4" Value="Room4"></asp:ListItem>
             <asp:ListItem Text="Room 5" Value="Room5"></asp:ListItem>
            <asp:ListItem Text="Room 6" Value="Room6"></asp:ListItem>
             <asp:ListItem Text="Room 7" Value="Room7"></asp:ListItem>
             <asp:ListItem Text="Room 8" Value="Room8"></asp:ListItem>
              <asp:ListItem Text="Room 9" Value="Room9"></asp:ListItem>
            <asp:ListItem Text="Room 10" Value="Room10"></asp:ListItem>
            
           </asp:RadioButtonList><br /><br />
            <asp:Button ID="btnAddpat" runat="server" Text="Add Patient" OnClick="btnaddpat_Click" CssClass="button" />     
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</div>


            <div id="deletePatient" class="form-container">
              <h3>Delete Patient</h3>
       
                <asp:Label ID="lblpatid" runat="server" Text="patient ID:" AssociatedControlID="txtpatientid"></asp:Label><br />
             <asp:TextBox ID="txtpatientid" runat="server" placeholder="Enter patient id"></asp:TextBox> <br /><br />
                <asp:Label ID="Lblptntname" runat="server" Text="patient name:" AssociatedControlID="txtptntname"></asp:Label><br />
                <asp:TextBox ID="txtptntname" runat="server" placeholder="Enter patient name"></asp:TextBox> <br /><br />
            
            
            <asp:Button ID="btndltpatient" runat="server" Text="delete patient" OnClick="btndeltptnt_Click" CssClass="button" />
          <asp:Label ID="Lbl2" runat="server" ForeColor="Green"></asp:Label>
        </div>
        <div id="location" class="form-container" style="display: none;">
         <h3>Location</h3>
         <img id="locationImg" src="/wwwroot/images/location.jpeg" alt="Location Image" style="display: none;" />
</div>

   <div id="dischargePatient" class="form-container">
                 <h3>Discharge Patient</h3>
       
              <asp:Label ID="Lbldispatid" runat="server" Text="patient ID:" AssociatedControlID="txtdispatientid"></asp:Label><br />
     <asp:TextBox ID="txtdispatientid" runat="server" placeholder="Enter patient id"></asp:TextBox> <br /><br />
        <asp:Label ID="Lbldispatname" runat="server" Text="patient name:" AssociatedControlID="txtdispatientname"></asp:Label><br />
        <asp:TextBox ID="txtdispatientname" runat="server" placeholder="Enter patient name"></asp:TextBox> <br /><br />
    
    
     <asp:Button ID="Buttondispat" runat="server" Text="discharge patient" OnClick="btndisptnt_Click" CssClass="button"/>
     <asp:Label ID="Label3" runat="server" ForeColor="Green"></asp:Label>
   </div>
   <div id="viewnotice" class="form-container" style="display: none;">
    <h3>Notices</h3>
    <!-- GridView to display notices -->
    <asp:GridView ID="gvNotices" runat="server" AutoGenerateColumns="false" CssClass="table">
        <Columns>
            <asp:BoundField DataField="message" HeaderText="Message" />
            <asp:BoundField DataField="created_at1" HeaderText="Time" />
        </Columns>
    </asp:GridView>
</div>


  


    <div id="generateBill" class="form-container" autopostback="false">
        <h3>Generate Bill</h3>
           <asp:Label ID="lblblpatientid" runat="server" Text="patient ID:" AssociatedControlID="txtblpatientid"></asp:Label><br />
            <asp:TextBox ID="txtblpatientid" runat="server" placeholder="Enter patient id"></asp:TextBox> <br /><br />
              <asp:Label ID="Lblpatinetnm" runat="server" Text="patient name:" AssociatedControlID="txtblpatientname"></asp:Label><br />
              <asp:TextBox ID="txtblpatientname" runat="server" placeholder="Enter patient name"></asp:TextBox> <br /><br />
                <asp:Label ID="Lblpatamt" runat="server" Text="Amount:" AssociatedControlID="txtblpatientamt"></asp:Label><br />
                <asp:TextBox ID="txtblpatientamt" runat="server" placeholder=""></asp:TextBox> <br /><br />

           <asp:Button ID="Billpat" runat="server" Text="generate bill" OnClick="btnbill_Click" CssClass="button" />
 <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
  
    </div>


    <div style="text-align: center; margin-top: 50px;" id="logout" class="form-container">
 <h3>Are you sure you want to log out?</h3>
 <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="logout_click" CssClass="button" /><br />
 <asp:Label ID="Label2" runat="server" ForeColor="Green"></asp:Label>

 </div>


    
         </form>
  
   </body>    
</html>
