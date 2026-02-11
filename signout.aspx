<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signout.aspx.cs" Inherits="loginpg.signout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>stay signed out</title>
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
        }
        button:hover, .button:hover {
            background-color: rgb(132, 196, 210);
        }
        #b1{
            margin-left: 50px;
            text-decoration: none;
            text-align: match-parent;
            color:rgb(102, 163, 166);
        }
#b2{
    margin-left: 50px;
    text-decoration: none;
    color:rgb(102, 163, 166);
}
#b3{
    margin-left: 50px;
    text-decoration: none;
    color:rgb(102, 163, 166);
}
#b4{
    margin-left: 50px;
    text-decoration: none;
    color:rgb(102, 163, 166);
}
#b5{
    margin-left: 700px;
    text-decoration: none;
    color:rgb(102, 163, 166);
}
a{
   background-color:rgb(139, 230, 200); 
}
#b1:hover{
    background-color: rgb(132, 196, 210);
}
#b2:hover{
    background-color: rgb(132, 196, 210);
}
#b3:hover{
    background-color: rgb(132, 196, 210);
}
#b4:hover{
    background-color: rgb(132, 196, 210);
}
#b5:hover{
    background-color: rgb(132, 196, 210);
}
h4{
    background-color: rgb(100, 196, 237);
    height:55px;
    text-align: center;
}
#b6{
    height:46px;
    width: 70px;
    margin-top: 6px;
    margin-left: 50px;
}
body{
    background-color: rgb(162, 225, 225);
    
}
img{
    height:500px;
    width: 550px;
    margin-left: 400px;

}
p{
    font-size: 20px;
    margin-left: 130px;
    margin-right: 50px;
}
.box {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 30px; /* Space between the buttons */
    margin-top: 50px; /* Optional, you can adjust based on your needs */
}

/* Styling for the individual button (a tag) */
.btn {
    display: flex;
    flex-direction: column; /* Stack image and text vertically */
    align-items: center; /* Center align items */
    justify-content: center;
    padding: 20px;
    width: 200px; /* Fixed width for each button */
    background-color: rgb(177, 250, 250);
    border-radius: 15px;
    text-decoration: none;
    box-shadow: 6px 6px 70px rgba(19, 70, 143, 0.23);
    border: 2px dotted;
    text-align: center;
    position: relative;
}

/* Image inside the button */
.btn img {
    height: 150px; /* Set the height for images */
    width: auto;
    object-fit: cover; /* Maintain aspect ratio */
    margin-left: 10px;
}

/* Optional: Style for text */
    .btn h5 
    {
        margin-top: 10px;
         font-size: 16px;
        font-weight: bold;
    }
    .star 
    {
        font-size: 30px;
        cursor: pointer;
        color: gray;
    }
    .star:hover, .selected {
        color: gold;
    }
    .news-container {
            width: 1000px;
            height: 200px;
            overflow: hidden;
            border: 2px solid #ccc;
            background-color:rgb(206, 245, 234);
            position: relative;
            margin-top: 20px;
            padding: 10px;
            font-size: 24px;
            text-align: center;
            margin-left:230px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .news-track {
            display: flex;
            flex-direction: column;
            position: absolute;
            animation: scrollNews 10s linear infinite;
        }

        .news-item {
            padding: 5px;
            color: #333;
            font-weight: bold;
        }

        @keyframes scrollNews {
            0% { transform: translateY(100%); }
            100% { transform: translateY(-100%); }
        }
        #feedbacktxt{
            height:180px;
            width:600px;
        }
    </style>
    <script>
        function rate(stars) {
            document.getElementById("selectedRating").value = stars;
            let starsList = document.querySelectorAll(".star");
            starsList.forEach((star, index) => {
                star.classList.toggle("selected", index < stars);
            });
        }
    </script>

</head>
<body runat="server">

    <form id="form1" runat="server">
        <h4>
        <img id="b6" src="/wwwroot/images/hmslogo.jpg" />
        <a id="b5" href="history.aspx">History</a>
        <a id="b1" href="abouthms.aspx">About</a>
        <a id="b2" href="privacypolicy.aspx">privacy policy</a>
        <a id="b3" href="disclaimer.aspx">Disclaimer</a>
        <a id="b4" href="help.aspx">Help</a>
    </h4>
        <p><br />Your Trusted Healthcare Partner for a Healthier Tomorrow <br /><br /><br />we are committed to providing the highest standard of care to our patients and the community. Our mission is to ensure every patient receives compassionate, expert treatment in a safe and comfortable environment. We offer a comprehensive range of healthcare services to meet your needs. we are dedicated to providing exceptional healthcare with compassion, expertise, and advanced medical technology. Our commitment to your health and well-being drives everything we do. Whether you're visiting for routine care or need specialized treatment, we ensure that every patient receives personalized, high-quality care in a welcoming and supportive environment.</p>
    <img src="/wwwroot/images/hsptl.jpg" /><br /><br /><br /><br />
    <div class="box">
        <a href="appointment.aspx" class="btn">
            <img src="/wwwroot/images/appointmentbooking.png" alt="Appointment Booking" />
            <h5>Appointment </h5>
        </a>
        <a href="finddoctor.aspx" class="btn">
            <img src="/wwwroot/images/finddoctor.png" alt="Find Doctor" />
            <h5>Find Doctor</h5>
        </a>
        <a href="consultonline.aspx" class="btn">
            <img src="/wwwroot/images/consultDOConline.jpg" alt="Consult Online" />
            <h5>Consult Online</h5>
        </a>
        <a href="payonline.aspx" class="btn">
            <img src="/wwwroot/images/payment.png" alt="Payment" />&nbsp;
            <h5>Payment</h5>

        </a>
    </div>
        <div class="news-container">
                <div class="news-track" id="newsContainer" runat="server">
                    <!-- News from doctornews table will be displayed here -->
                </div>
        </div>
        <br />
    
        Our vision is to be a leader in healthcare delivery, providing innovative and compassionate medical services. We aim to enhance the quality of life for our patients by fostering an environment where health and healing are at the forefront of everything we do. We are here to be your partner in health, supporting you throughout your wellness journey.
         
        <img src="/wwwroot/images/hsptldept.jpg" /><br />
    <p><b>Our Services</b> <br /> We offer a wide variety of specialized services to meet your healthcare needs.<br /> <b>Emergency Care:</b> Prompt and efficient care, available 24/7 for life-threatening situations.
       <br /> <b>Cardiology: </b>Comprehensive heart care, including diagnostics, treatments, and surgeries.
       <br /><b>Surgery: </b>From minor procedures to major surgeries, our skilled surgeons ensure optimal outcomes.
       <br /><b>Pediatrics:</b> Providing expert care for infants, children, and adolescents, ensuring their healthy development.
       <br /><b>Orthopedics:</b> Specialized treatment for bones, joints, and musculoskeletal issues.
        </p>
    <img src="/wwwroot/images/patientcare.jpg" />
    <p><b>Why Choose Us?</b><br />
        <b>Expert Medical Team:</b>Our doctors, nurses, and support staff are highly trained professionals dedicated to providing you with the best possible care.
        <br /><b>State-of-the-Art Facilities: </b>We use the latest medical technology to diagnose, treat, and monitor our patients’ health.
        <br /><b>Patient-Centered Care:</b> We place your health and well-being at the center of everything we do, offering personalized care and attention.
        <br /><b>24/7 Availability:</b> Our hospital operates round-the-clock to provide urgent care, emergency services, and inpatient care.<br /><br />

        <img src="/wwwroot/images/location.jpeg" />

    <br /><br /><b>Our Values</b><br />
    <b>Compassion:</b> We approach every patient with care, kindness, and empathy, understanding their needs and concerns.
    <br /><b>Excellence:</b> We strive for the highest standards in medical care, using advanced technologies, evidence-based practices, and continuous education.
    <br /><b>Integrity:</b> We uphold the highest ethical standards in all of our practices, ensuring trust and transparency in all interactions.
    <br /><b>Collaboration:</b> We work as a team—physicians, nurses, support staff, and patients—ensuring the best possible care outcomes.
    <br /><b>Innovation:</b> We embrace new technologies, research, and medical techniques to continuously improve healthcare delivery.
<br /><br /><b>Our team includes</b>
<br /><b>Doctors:</b> Highly skilled physicians in every specialty, from cardiology to pediatrics.
<br /><b>Nurses:</b> Compassionate and experienced nurses who provide round-the-clock care and support.
<br /><b>Medical Technicians: </b>Trained specialists in diagnostic testing, radiology, and other technical fields.
<br /><b>Administrative Staff:</b> Our support team works tirelessly to ensure a smooth, efficient experience for every patient.</p>
<div style="text-align: center; margin-top: 50px;">
    <h3>Rate Us</h3>
    <div id="rating">
        <span class="star" onclick="rate(1)">&#9733;</span>
        <span class="star" onclick="rate(2)">&#9733;</span>
        <span class="star" onclick="rate(3)">&#9733;</span>
        <span class="star" onclick="rate(4)">&#9733;</span>
        <span class="star" onclick="rate(5)">&#9733;</span>
    </div>
    <br />
    <input type="hidden" id="selectedRating" name="selectedRating" runat="server" />
            <textarea id="feedbacktxt" runat="server" rows="4" cols="50" placeholder="Write your feedback here..."></textarea>
            <br /><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" OnClick="SubmitFeedback" CssClass="button" />
       </div>

        
    </form>
</body>
</html>
