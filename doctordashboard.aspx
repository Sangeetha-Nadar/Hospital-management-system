<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctordashboard.aspx.cs" Inherits="loginpg.doctordashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor Dashboard</title>
    <style>
        button, .button {
            background-color: rgb(102, 163, 166);
            margin-top: 50px;
            margin-left: 100px;
            padding: 10px 20px;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }
        button:hover, .button:hover {
            background-color: rgb(132, 196, 210);
        }
        .content-section {
            display: none;
            margin-top: 20px;
        }
        body {
            background-color: rgb(200, 220, 220);
            font-size: 20px;
            text-align: center;
        }

        #txtNotice {
            width: 400px; /* Adjust width */
            height: 150px; /* Adjust height */
            font-size: 16px;
        }
        .chatbox {
            width: 500px;
            background: white;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            margin: auto;
            margin-top: 50px;
        }

        .chat-history {
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
            display: flex;
            flex-direction: column;
        }

        .chat-message {
            max-width: 70%;
            padding: 10px;
            margin: 5px;
            border-radius: 10px;
            word-wrap: break-word;
        }

        .doctor-message {
            background-color: #d1e7dd;
            align-self: flex-end;
            text-align: right;
        }

        .patient-message {
            background-color: #f8d7da;
            align-self: flex-start;
            text-align: left;
        }

        .chat-input {
            margin-top: 10px;
        }

        .chat-input input {
            width: 80%;
            padding: 5px;
            font-size: 16px;
        }

        .chat-input button {
            padding: 5px 10px;
            font-size: 16px;
            cursor: pointer;
        }
                #idimg{
    height:320px;
    width:1200px;
    margin-left:40px;
}
    </style>
<script>
    function showSection(formId) {
        // Hide all sections
        document.querySelectorAll('.content-section').forEach(section => section.style.display = "none");

        // Show the selected section
        var selectedSection = document.getElementById(formId);
        if (selectedSection) {
            selectedSection.style.display = "block";
        }

        // Store selected section in hidden field so ASP.NET can track it
        document.getElementById('<%= hfActiveSection.ClientID %>').value = formId;
    }

    window.onload = function () {
        var activeSection = document.getElementById('<%= hfActiveSection.ClientID %>').value;
        if (activeSection) {
            showSection(activeSection);
        }
    };
</script>
<style>
    #view-chat {
        display: none;
    }
</style>
<script type="text/javascript">
    function openChat() {
        document.getElementById('view-chat').style.display = 'block';
        __doPostBack('LoadChatData', '');
    }
</script>
<script type="text/javascript">
    function scrollToBottom() {
        var chatHistory = document.querySelector(".chat-history");
        if (chatHistory) {
            setTimeout(function () {
                chatHistory.scrollTop = chatHistory.scrollHeight;
            }, 100); // Small delay to ensure messages are loaded
        }
    }

    // Run after UpdatePanel refresh
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        scrollToBottom();
    });

    window.onload = function () {
        scrollToBottom();
    };

</script>



</head>
<body runat="server">
 <form id="form1" runat="server">
      <img id="idimg" src="/wwwroot/images/doctors.jpg" /><br />
       
   <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:Button ID="btnViewPatient" runat="server" Text="View Patient" CssClass="button" OnClick="btnViewPatient_Click" />
    <asp:Button ID="btnviewnotice" runat="server" Text="View Notice" CssClass="button" OnClick="btnLoadNotices_Click" />
    <button type="button" onclick="showSection('add-news')">Add News</button>
    <button type="button" onclick="showSection('view-chat'); document.getElementById('<%= btnLoadChat.ClientID %>').click();">View Chat</button>
        
    <button type="button" onclick="showSection('logout')">Logout</button>

    <div id="view-patient" class="content-section">
     <h3>Patient List</h3>
      <asp:Panel ID="pnlStaffGrid" runat="server">
       <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="False" CssClass="table">
        <Columns>
         <asp:BoundField DataField="name" HeaderText="Name" />
         <asp:BoundField DataField="age" HeaderText="Age" />
         <asp:BoundField DataField="gender" HeaderText="Gender" />
         <asp:BoundField DataField="treatment" HeaderText="Treatment Type" />
         <asp:BoundField DataField="phone_no" HeaderText="Phone No" />
         <asp:BoundField DataField="room_no" HeaderText="Room No" />
         <asp:BoundField DataField="current_Status" HeaderText="Current Status" />
        </Columns>
       </asp:GridView>
      </asp:Panel>
    </div>

    <div id="viewnotice" class="content-section">
     <h3>Notices</h3>
      <asp:Panel ID="Panel1" runat="server">
       <asp:GridView ID="gvnotice" runat="server" AutoGenerateColumns="false" CssClass="table">
        <Columns>
         <asp:BoundField DataField="message" HeaderText="Message" />
         <asp:BoundField DataField="created_at1" HeaderText="Time" />
        </Columns>
       </asp:GridView>
      </asp:Panel>
    </div>

    <div style="text-align: center; margin-top: 50px;" id="add-news" class="content-section">
     <h3>Add News</h3>
     <asp:Panel ID="Panel2" runat="server">
      <asp:TextBox ID="txtNotice" runat="server" TextMode="MultiLine" placeholder="Enter Notice"></asp:TextBox><br />
       <asp:Button ID="Button3" runat="server" Text="Add News" OnClick="newsSubmit_Click" CssClass="button"/>
       <asp:Label ID="Lbl2" runat="server" ForeColor="Green"></asp:Label>
      </asp:Panel>
     </div>

        <asp:HiddenField ID="hfActiveSection" runat="server" />

      <div id="view-chat" class="content-section">
           <div class="chatbox">
            <h3>Doctor's Chat</h3>

            <asp:Label ID="lblDoctor" runat="server" Text="Doctor Name:"></asp:Label>
            <asp:TextBox ID="txtDoctor" runat="server" ReadOnly="true"></asp:TextBox><br /><br />

            <asp:Label ID="lblPatient" runat="server" Text="Select Patient:"></asp:Label>
            <asp:DropDownList ID="ddlPatients" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPatients_SelectedIndexChanged"></asp:DropDownList><br /><br />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Timer ID="ChatRefreshTimer" runat="server" Interval="3000" OnTick="ChatRefreshTimer_Tick" />
        <div class="chat-history">
            <asp:Repeater ID="rptChat" runat="server">
                <ItemTemplate>
                    <div class='<%# Eval("sender").ToString() == "Doctor" ? "chat-message doctor-message" : "chat-message patient-message" %>'>
                        <strong><%# Eval("sender") %>:</strong> <%# Eval("message") %>
                        <br /><small><%# Eval("SentAt") %></small>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        
    </ContentTemplate>
</asp:UpdatePanel>

            <div class="chat-input">
                <asp:TextBox ID="txtMessage" runat="server" Placeholder="Type your reply..."></asp:TextBox>
                <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" CssClass="button" />
            </div>
        </div>
        <asp:Button ID="btnLoadChat" runat="server" Text="Load Chat" OnClick="btnLoadChat_Click"  Style="display:none;"/>
        </div>

        <div style="text-align: center; margin-top: 50px;" id="logout" class="content-section">
            <h3>Are you sure you want to log out?</h3>
            <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="logout_click" CssClass="button" /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>