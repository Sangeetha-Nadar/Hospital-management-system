<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="loginpg.help" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background-color: rgb(162, 225, 225);
            font-size: 20px;
            background-image:url("/wwwroot/images/helpbgimg.jpg");
            background-size: cover; /* Ensures the image covers the full background */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>Welcome to the Razli's Hospital Management System. Our platform is designed to improve the efficiency of hospital operations and
            patient care
    by streamlining administrative and clinical tasks. Below, you will find step-by-step instructions and guidance to help you get the most
            out of queries in the system.<br /><b>Logging In:</b><br />
    open Razli's Hospital Management System home page.<br />only authorized person can enter their username and password (provided by the IT 
    department) Click Login to access the dashboard. or else you may simply click on stay siggned out and access the website as an user or patient.<br />
          <b>Logged out</b><br />  you may check
    all the details about the hospital provided you can know about the history, disclaimer, about us, our privacy policy and you may also 
            get help about Razli's health care.<br />You can view the doctor 
    and book your appointment the time slot on the day in which the doctor are available is known as per the treatment needed .<br />you may book, or cancel your appointment.<br />
   <br />receptionist can also view all the patient and their details like name, age, gender,
            payment_status, current status of patient, etc.<br /><b>Data:</b><br />patient details are added while booking appointment
            , their detailsare also removed when they cancel appointment or receptionist can also delete patient
    asked<br /><b>Booking an Appointment:</b><br />Go to Appointment you may do this by stay logged out.<br />enter all your data.<br />Select the 
            the type of treatment you need <br /> click on book appointment to confirm your appointment.
    <br /><b>Why is the system running
         slowly?</b><br /> Check 
     your internet connection. If you are on a slow network, it may affect the system's performance.Try refreshing the page or clearing 
your browser's cache.<br /><br /><b>How does the system handle patient privacy and data security?</b><br />
    The system is built with security protocols, including authentication to ensure patient data is secure. Only authorized
    person are granted access to sensitive patient information.<br /> <b>What support is available if I face technical issues?</b><br />
    If you encounter any technical issues with our system, our support team is always available here to help you through phone, email.<br />
    <b>How do I cancel my appointment?</b><br />If you need to cancel your appointment, go to appointment session 
 <br /> enter you appointment ID and your name.<br /> click on cancel appointment to cancel your appointment.<br /><br />
      <b>How to know the doctor availability?</b><br /> go to find doctor session<br /> choose the type of treatment you need <br /> there
            will be details of the doctor availabilty for those treatment with time and days in the week doctor is available.<br />
            <b>How to do online payment? </b><br />go to payment session<br />Enter patient ID and their name<br />Enter the amount need to be paid<br />Choose you payment type (credit/debit, netbanking)fill the required details<br />click on proceed payment<br /><br />
            you may rate us as per your staisfaction and also provide feedback of our hospital<br /><br /><b>How to know updates regarding hospital?</b><br />all the details(rules) and new updates(procedure),event related to hospital is updated by the doctor in the website you may visit our website and get to know about it
   <br /><b>How to consult doctor online ?</b><br />you can do this by signed out. click on consult online part<br /> enter the details asked there<br /> select the type of treatment you need<br /> the list of doctors name who are specialist in which treatment you need they will be shown select the doctor you need to preffer<br /> the your message and send it.....and you will also receive message from those doctor after a while<br /><br />    
            For any further queries you may contact us <br />Phone: 9137860686 / 9967342343<br />mail: razli2004@gmail.com
 </p>
    </form>
</body>
</html>
