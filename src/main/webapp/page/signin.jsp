<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <title>Student Registration</title>
    <link rel="icon" type="image/png" href="/img/TwinBird.png">
    <style>
       body {
    margin: 0;
    height: 100vh;
    background: url('/img/classroom.png') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Segoe UI', sans-serif;
    color: #fff;
}
 	   .top-heading {
            text-align: center;
            padding: 15px 0;
            font-size: 28px;
            color: #00ff88;
            letter-spacing: 1px;
            background-color: #000;
            border-bottom: 1px solid #1a1a1a;
    		font-weight: bold;
            
        }
        .container {
            background-color: rgba(0, 0, 0, 0.7); 
            padding: 45px 35px;
            border-radius: 8px;
            width: 360px;
            text-align: center;
           box-shadow: 0 0 15px rgba(0, 184, 255, 0.2);
        }
        h1 {
            font-size: 36px;
            margin-bottom: 10px;
            color: #1DB954;
        }
        h2 {
            font-size: 18px;
            margin-bottom: 20px;
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: none;
            border-radius: 5px;
        }
        button {
            width: 95%;
            padding: 10px;
            background-color: #1DB954;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #17a74b;
        }
        a {
            color: #1DB954;
            text-decoration: underline;
        }
        .message {
            margin-top: 15px;
            color: yellow;
            font-size: 14px;
        }
    </style>
</head>
<body>

	<div class="top-heading">
    <i>TWIN BIRDS SCHOOL</i>
    <img src="/img/birds.png" alt="Bird Emoji" style="height: 50px; vertical-align: middle;">
</div>

    <br>
    <br>
    <br>
	<center>
    <div class="container">
        <h1><img src="/img/TwinBird.png" alt="Bird Emoji" style="height: 100px; vertical-align: middle;">
        <br> Student Registration</h1>
        <h2>Sign In to Your Account</h2>
        
        <input type="text" id="signin-username" placeholder="User name">
        <input type="password" id="signin-password" placeholder="Password">
        
        <button onclick="signIn()">Sign In</button>
        
        <p id="signin-message" class="message"></p>
    </div>
    </center>
    
<script>
function signIn() {
    const username = document.getElementById("signin-username").value.trim();
    const password = document.getElementById("signin-password").value;
    const message = document.getElementById("signin-message");

    if (username === "" || password === "") {
        message.textContent = "Please fill all fields.";
        return;
    }

    if (username === "Ranjith" && password === "123") {
        message.textContent = "Signed in successfully.";
        alert(" Welcome To Twin Birds School !");

        setTimeout(() => {
            window.location.href = "/students/register";
        }, 1000);
    } else {
        message.textContent = "Invalid username or password.";
    }
}
</script>

</body>
</html>
