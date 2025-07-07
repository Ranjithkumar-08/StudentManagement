<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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
            position: relative;
            text-align: center;
            padding: 15px 0;
            font-size: 28px;
            color: #00ff88;
            letter-spacing: 1px;
            background-color: #000;
            border-bottom: 1px solid #1a1a1a;
            font-weight: bold;
       }

       .top-heading img {
            height: 50px;
            vertical-align: middle;
            margin-left: 10px;
       }

       .top-heading button {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            padding: 10px 20px;
            background-color: #1DB954;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
       }

       .top-heading button:hover {
            background-color: #17a74b;
       }

       .navbar {
            display: flex;
            justify-content: center;
            background-color: #121212;
            padding: 12px 0;
            box-shadow: 0 2px 8px rgba(0, 184, 255, 0.2);
       }

       .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 20px;
            font-size: 16px;
            padding: 8px 15px;
            border-radius: 4px;
            transition: background 0.3s ease;
       }

       .navbar a:hover {
            background-color: #1f1f1f;
       }

       .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 115px); 
       }

       .container {
            background: #121212;
            padding: 45px 35px;
            border-radius: 8px;
            width: 360px;
            box-shadow: 0 0 15px rgba(0, 184, 255, 0.2);
            text-align: center;
       }

       h1 {
            color: #00b8ff;
            margin-bottom: 25px;
            font-size: 26px;
       }

       label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            color: #ccc;
            font-size: 14px;
       }

       input, button[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 4px;
            font-size: 14px;
            outline: none;
       }

       input {
            background: #1e1e1e;
            border: 1px solid #333;
            color: #fff;
       }

       input:focus {
            border-color: #00b8ff;
       }

       button[type="submit"] {
            background: #00b8ff;
            color: #fff;
            border: none;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
       }

       button[type="submit"]:hover {
            background: #0092cc;
       }
    </style>
</head>
<body>

<div class="top-heading">
    <i>Welcome To TWIN BIRDS SCHOOL</i>
    <img src="/img/birds.png" alt="Bird Emoji">
    <button onclick="logout()">Logout</button>
</div>

<div class="navbar">
    <a href="#">Home</a>
    <a href="list">Students</a>
    <a href="#">About</a>
    <a href="#">Services</a>
</div>

<div class="main-content">
    <div class="container">
        <h1>Student Registration</h1>
        <form action="/students/save" method="post">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>

            <label for="department">Department</label>
            <input type="text" id="department" name="department" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</div>

<script>
    function logout() {
        setTimeout(() => {
            window.location.href = "/students/login";
        }, 1000);
    }
</script>

</body>
</html>
