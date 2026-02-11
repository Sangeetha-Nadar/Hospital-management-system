<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="finddoctor.aspx.cs" Inherits="loginpg.finddoctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Find Doctor</title>
    <style>
        body {
            background-color: rgb(162, 225, 225);
            font-size: 20px;
        }
        .box {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 30px; /* Space between the buttons */
            margin-top: 50px;
        }
        .btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            width: 200px;
            background-color: rgb(177, 250, 250);
            border-radius: 15px;
            text-decoration: none;
            box-shadow: 6px 6px 70px rgba(19, 70, 143, 0.23);
            border: 2px dotted;
            text-align: center;
            cursor: pointer;
        }
        .btn img {
            height: 150px;
            width: auto;
            object-fit: cover;
            margin-left: 10px;
        }
        .btn h5 {
            margin-top: 10px;
            font-size: 16px;
            font-weight: bold;
        }
        .content {
            display: none; /* Hide all sections initially */
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
            margin: 20px auto;
            max-width: 80%;
        }
        .active {
            display: block; /* Show only the active content */
        }
    </style>
    <script>
        function showContent(id) {
            // Hide all content divs
            var sections = document.getElementsByClassName("content");
            for (var i = 0; i < sections.length; i++) {
                sections[i].style.display = "none";
            }
            // Show the selected content
            document.getElementById(id).style.display = "block";
        }
    </script>
</head>
<body runat="server">
    <form id="form1" runat="server">
        <div class="box">
            <div class="btn" onclick="showContent('pediatric-service')">
                <img src="/wwwroot/images/pediatric.jpg" alt="Pediatric" />
                <h5>Pediatric</h5>
            </div>
            <div class="btn" onclick="showContent('dental-service')">
                <img src="/wwwroot/images/dental.jpg" alt="Dental" />
                <h5>Dental</h5>
            </div>
            <div class="btn" onclick="showContent('cardiology-service')">
                <img src="/wwwroot/images/cardiology.jpg" alt="Cardiology" />
                <h5>Cardiology</h5>
            </div>
            <div class="btn" onclick="showContent('neurology-service')">
                <img src="/wwwroot/images/neurology123.jpg" alt="Neurology" />
                <h5>Neurology</h5>
            </div>
            <div class="btn" onclick="showContent('radiology-service')">
                <img src="/wwwroot/images/radiology.jpg" alt="Radiology" />
                <h5>Radiology</h5>
            </div>
            <div class="btn" onclick="showContent('dermatology-service')">
                <img src="/wwwroot/images/skindermatology.png" alt="Dermatology" />
                <h5>Dermatology</h5>
            </div>
            <div class="btn" onclick="showContent('fever-service')">
                <img src="/wwwroot/images/fever.jpg" alt="Fever" />
                <h5>Fever</h5>
            </div>
        </div>

        <!-- Content Sections -->
 <div id="pediatric-service" class="content">
        <h2>Pediatric Care at Our Hospital</h2>
    <p>At our hospital, we provide specialized pediatric care for infants, children, and adolescents. Our dedicated team ensures that every child receives the best medical attention in a child-friendly environment.</p>
    
    <h3>Experienced Pediatricians</h3>
    <p>Our pediatric doctors have over <strong>15 years of experience</strong> in treating various child health conditions, ensuring the best care for your little ones.</p>
    
    <h3>Doctor Availability</h3>
    <p><strong>Consultation Timings:</strong> <br /> 
    🕚 <strong>8:00 AM - 1:00 PM</strong> (Monday to Friday)</p>

    <h3>Services We Offer</h3>
    <ul>
        <li>Newborn & Infant Care</li>
        <li>Vaccinations & Immunization</li>
        <li>Child Nutrition & Growth Monitoring</li>
        <li>General & Emergency Pediatric Care</li>
    </ul>

    <p>Book an appointment today and ensure your child gets the best care!</p>
</div>
        <!--dental service-->
        <div id="dental-service" class="content">
    <h2>Dental Care at Our Hospital</h2>
    <p>We offer top-quality dental care with advanced treatments to ensure healthy teeth and a bright smile. Our expert dentists use modern techniques to provide pain-free and effective dental services.</p>
    
    <h3>Experienced Dental Specialists</h3>
    <p>Our dental team consists of highly skilled professionals with over <strong>10 years of experience</strong> in dental treatments, ensuring the best oral care for our patients.</p>
    
    <h3>Doctor Availability</h3>
    <p><strong>Consultation Timings:</strong> <br /> 
    🕛 <strong>2:00 PM - 9:00 PM</strong> (Sunday to Saturday)</p>

    <h3>Services We Offer</h3>
    <ul>
        <li>General & Preventive Dentistry</li>
        <li>Root Canal & Cavity Treatment</li>
        <li>Cosmetic Dentistry & Teeth Whitening</li>
        <li>Orthodontics & Braces</li>
        <li>Emergency Dental Care</li>
    </ul>

    <p>Visit us today for expert dental care and maintain a healthy, confident smile!</p>
</div>
        <!--cardiology-service-->
        <div id="cardiology-service" class="content">
    <h2>Cardiology Care at Our Hospital</h2>
    <p>Our hospital is equipped with advanced cardiology facilities to diagnose and treat heart-related conditions effectively. We provide comprehensive cardiac care, ensuring the best treatment for every patient.</p>
    
    <h3>Experienced Cardiologists</h3>
    <p>Our cardiology team consists of highly experienced specialists with over <strong>23 years of expertise</strong> in diagnosing and treating heart diseases. They are dedicated to providing personalized cardiac care.</p>
    
    <h3>Doctor Availability</h3>
    <p><strong>Consultation Timings:</strong> <br /> 
    🕘 <strong>9:00 AM - 2:00 PM</strong> (Thursday to Sunday)</p>

    <h3>Services We Offer</h3>
    <ul>
        <li>Comprehensive Heart Checkups</li>
        <li>ECG, Echocardiography & Stress Tests</li>
        <li>Coronary Artery Disease Treatment</li>
        <li>Hypertension & Cholesterol Management</li>
        <li>Advanced Cardiac Surgery & Angioplasty</li>
    </ul>

    <p>Book an appointment with our expert cardiologists and take proactive steps towards a healthy heart!</p>
</div>
        <!--neurology-->
       <div id="neurology-service" class="content">
    <h2>Neurology Care at Our Hospital</h2>
    <p>Our hospital provides world-class neurology services with state-of-the-art facilities for diagnosing and treating neurological disorders. We are committed to delivering expert care for conditions affecting the brain, spine, and nervous system.</p>
    
    <h3>Experienced Neurologists</h3>
    <p>Our neurology specialists have over <strong>18 years of experience</strong> in treating complex neurological conditions, ensuring the best possible care for our patients.</p>
    
    <h3>Doctor Availability</h3>
    <p><strong>Consultation Timings:</strong> <br /> 
    🕐 <strong>1:00 PM - 8:00 PM</strong> (Sunday to wednesday)</p>

    <h3>Services We Offer</h3>
    <ul>
        <li>Diagnosis & Treatment of Neurological Disorders</li>
        <li>Stroke Prevention & Rehabilitation</li>
        <li>Epilepsy & Seizure Management</li>
        <li>Headache & Migraine Treatment</li>
        
    </ul>

    <p>Schedule a consultation with our expert neurologists and receive personalized neurological care for a better quality of life.</p>
</div>
       <!--Radiolog y-->
        <div id="radiology-service" class="content">
    <h2>Radiology Services at Our Hospital</h2>
    <p>Our hospital provides state-of-the-art radiology services, utilizing advanced imaging technology for accurate diagnosis and treatment planning. We ensure precise and efficient imaging to support medical professionals in delivering the best patient care.</p>
    
    <h3>Experienced Radiologists</h3>
    <p>Our radiology team consists of highly skilled specialists with over <strong>18 years of experience</strong> in diagnostic imaging and radiology services, ensuring accurate assessments and expert interpretations.</p>
    
    <h3>Doctor Availability</h3>
    <p><strong>Consultation Timings:</strong> <br /> 
    🕙 <strong>10:00 AM - 6:00 PM</strong> (Friday to Tuesday)</p>

    <h3>Services We Offer</h3>
    <ul>
        <li>X-Ray, Ultrasound, and MRI Scans</li>
        <li>CT Scans & 3D Imaging</li>
        <li>Fluoroscopy & Interventional Radiology</li>
        <li>Bone Density Scans </li>
    </ul>

    <p>Visit our radiology department for precise imaging and expert diagnosis to aid in your healthcare journey.</p>
</div>
        <!--dermatolog y-->
        <div id="dermatology-service" class="content">
    <h2>Dermatology Services at Our Hospital</h2>
    <p>Our hospital offers top-tier dermatology services, providing expert care for all skin, hair, and nail-related conditions. We use the latest medical advancements and treatments to ensure the best results for our patients.</p>
    
    <h3>Experienced Dermatologists</h3>
    <p>Our dermatology team consists of highly trained specialists with over <strong>18 years of experience</strong> in treating various skin disorders and cosmetic dermatology procedures.</p>
    
    <h3>Doctor Availability</h3>
    <p><strong>Consultation Timings:</strong> <br /> 
    🕒 <strong>3:00 PM - 9:00 PM</strong> (Saturday to Tuesday)</p>

    <h3>Services We Offer</h3>
    <ul>
        <li>Treatment for Acne, Eczema, and Psoriasis</li>
        <li>Skin Allergy Testing and Treatment</li>
        <li>Hair Loss Treatment & Scalp Care</li>
        <li>Laser Skin Treatments & Scar Removal</li>
        <li>Anti-Aging & Cosmetic Dermatology</li>
    </ul>

    <p>Visit our dermatology department to get expert skin care solutions tailored to your needs.</p>
</div>
        <!--fever-->
        <div id="fever-service" class="content">
    <h2>Fever Treatment at Our Hospital</h2>
    <p>Our hospital provides comprehensive fever diagnosis and treatment, ensuring a thorough evaluation of symptoms to determine the underlying cause. Whether it’s a viral infection, bacterial illness, or any other condition, our specialists ensure the best medical care for a quick recovery.</p>
    
    <h3>Experienced Specialists</h3>
    <p>Our fever treatment team includes highly qualified doctors with over <strong>28 years of experience</strong> in diagnosing and treating various fever-related illnesses, including viral infections, dengue, typhoid, and seasonal flu.</p>
    
    <h3>Doctor Availability</h3>
    <p><strong>Consultation Timings:</strong> <br /> 
    🕙 <strong>10:00 AM - 8:00 PM</strong> (Sunday to Saturday)</p>

    <h3>Services We Offer</h3>
    <ul>
        <li>Comprehensive Fever Diagnosis</li>
        <li>Blood Tests and Fever Panel Examinations</li>
        <li>Personalized Treatment Plans</li>
        <li>24/7 Emergency Care for High Fever Cases</li>
        <li>Home Remedies and Preventive Guidance</li>
    </ul>

    <p>If you have a persistent fever or flu-like symptoms, visit our hospital for expert medical attention.</p>
</div>
    </form>
</body>
</html>