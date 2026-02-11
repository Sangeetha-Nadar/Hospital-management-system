<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="loginpg.WebForm2" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Display Image</title>
  <style>
    .form-container {
      display: none; /* Initially hidden */
      border: 1px solid #ccc;
      padding: 10px;
      margin-top: 10px;
    }
    .form-container img {
      max-width: 100%; /* Ensures the image scales properly */
      height: auto;
    }
  </style>
</head>
<body>
  <button type="button" onclick="showForm('location')">Location</button>
  <div id="location" class="form-container">
    <h3>Location</h3>
    <img id="locationImg" src="/wwwroot/images/location.jpeg" alt="Location Image" style="display: none;" />
  </div>

  <script>
    function showForm(id) {
      const formContainer = document.getElementById(id);
      const imgElement = document.getElementById('locationImg'); // Corrected: Use the `img` element's ID

      // Toggle the visibility of the container
      if (formContainer.style.display === 'none' || formContainer.style.display === '') {
        formContainer.style.display = 'block';
        imgElement.style.display = 'block'; // Make the image visible
      } else {
        formContainer.style.display = 'none';
        imgElement.style.display = 'none'; // Hide the image
      }
    }
  </script>
</body>
</html>
