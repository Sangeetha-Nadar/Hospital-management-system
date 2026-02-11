<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultonline.aspx.cs" Inherits="loginpg.consultonline" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor-Patient Chat</title>
<style>
        body {
            background-color: rgb(162, 225, 225);
            font-size: 20px;
            text-align: center;
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
            height: 420px;
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

        .patient-message {
            background-color: #d1e7dd;
            align-self: flex-end;
            text-align: right;
        }

        .doctor-message {
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
    </style>
  <script type="text/javascript">
      function scrollToBottom() {
          var chatHistory = document.getElementById("<%= rptChat.ClientID %>");
          if (chatHistory) {
              chatHistory.scrollTop = chatHistory.scrollHeight;
          }
      }

      // Trigger scrolling on page load
      window.onload = function () {
          scrollToBottom();
      };

      // Ensure scrolling after UpdatePanel refresh
      document.addEventListener("readystatechange", function () {
          if (document.readyState === "complete") {
              scrollToBottom();
          }
      });
  </script>

</head>
<body>
    <form id="form1" runat="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
        <div class="chatbox">
            <asp:Label ID="lblPatient" runat="server" Text="Enter Patient Username:"></asp:Label>
            <asp:TextBox ID="txtPatient" runat="server"></asp:TextBox><br /><br />

            <label>Treatment:</label>
            <asp:DropDownList ID="ddlTreatments" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTreatments_SelectedIndexChanged"></asp:DropDownList>
            <br /><br />

            <label>Doctor:</label>
            <asp:DropDownList ID="ddlDoctors" runat="server"></asp:DropDownList>
            <br /><br />

         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Timer ID="ChatRefreshTimer" runat="server" Interval="3000" OnTick="ChatRefreshTimer_Tick" />
        <div class="chat-history">
            <asp:Repeater ID="rptChat" runat="server">
                <ItemTemplate>
                    <div class='<%# Eval("sender").ToString() == "Doctor" ? "chat-message doctor-message" : "chat-message patient-message" %>'>
                        <strong><%# Eval("sender") %>:</strong> <%# Eval("message") %>
                        <br /><small><%# Eval("sent_at") %></small>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
            <div class="chat-input">
                <asp:TextBox ID="txtMessage" runat="server" Placeholder="Type your message..."></asp:TextBox>
                <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
            </div>
        </div>
    </form>
</body>
</html>
