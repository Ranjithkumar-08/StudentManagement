<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <link rel="icon" type="image/png" href="/img/TwinBird.png">
    <style>
        body {
            background: url('/img/classroom.png') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
        }
        
        .top-heading {
		    position: relative;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 15px 20px;
		    font-size: 28px;
		    color: #00b8ff;
		    background-color: #000;
		    border-radius: 5px;
		    border-bottom: 1px solid #1a1a1a;
		}

		.top-heading b {
		    text-align: center;
		}
		
		.top-heading .logout-btn {
		    position: absolute;
		    right: 20px;
		    padding: 10px 20px;
		    background-color: #1DB954;
		    color: #fff;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-weight: bold;
		    transition: background-color 0.3s;
		}
		
		.top-heading .logout-btn:hover {
		    background-color: #17a74b;
		}
		
		.top-heading .back-btn {
		    position: absolute;
		    left: 20px;
		    padding: 10px 20px;
		    background-color: #1DB954;
		    color: #fff;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-weight: bold;
		    transition: background-color 0.3s;
		}
		
		.top-heading .back-btn:hover {
		    background-color: #17a74b;
		}

        table {
            width: 80%;
            margin: 40px auto;
            border-collapse: collapse;
            background: rgba(0, 0, 0, 0.85);
            box-shadow: 0 0 15px rgba(0, 184, 255, 0.3);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #333;
            text-align: center;
            font-size: 15px;
        }

        th {
            background: #00b8ff;
            color: #000;
        }

        tr:nth-child(even) {
            background-color: #1e1e1e;
        }

        tr:hover {
            background-color: #333;
        }

        td button {
            padding: 5px 10px;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-weight: bold;
            margin: 2px;
        }

        .back-btn {
            display: block;
            text-size:50px;
            font-weight:bold;
            width: 100px;
            margin: 20px auto;
            padding: 10px;
            background: #00b8ff;
            color: #000;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background: #0092cc;
        }
    </style>
</head>
<body>
<div class="top-heading">
    <button class="back-btn" onclick="goBack()">Back</button>
    <b>Registered Students</b>
    <button class="logout-btn" onclick="logout()">Logout</button>
</div>
<table>
    <thead>
        <tr>
            <th>S.No</th>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="student" items="${students}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.department}</td>
                <td>${student.email}</td>
                <td>
                    <a href="/students/update/${student.id}">
                        <button style="background-color: #ffa500;">Update</button>
                    </a>
                    <a href="/students/delete/${student.id}" onclick="return confirm('Are you sure you want to delete this student?');">
                        <button style="background-color: #ff4d4d;">Delete</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<a href="/students/register" class="back-btn">Add Another Student</a>

<script>
    function logout() {
        setTimeout(() => {
            window.location.href = "/students/login";
        }, 100);
    }
    
    function goBack() {
    	setTimeout(() => {
            window.location.href = "/students/register";
        }, 100);
    }
</script>
</script>

</body>
</html>
