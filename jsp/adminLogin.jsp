<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="../css/adminLogin.css"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap" rel="stylesheet">
</head>
<body>
    <header class="class">
        <!-- Left Box for logo -->
        <div class="left">
            <img src="../images/Logo.jpeg" alt="">
        </div>
    </header>
    <!--Admin Login Form-->
    <div class="loginBox">
        <div class="glass">
            <img src="../images/admin.png" width="100" height="100" class="admin">
            <h2>Admin Login</h2>
            <form method="post">
                <div class="inputBox">
                    <input type="text" name="mailid" placeholder="Enter your Email ID">
                    <span><i class="fa fa-user" aria-hidden="true"></i></i></span>
                </div>
                <div class="inputBox">
                    <input type="password" name="password" placeholder="Enter your Password">
                    <span><i class="fa fa-lock" aria-hidden="true"></i></span>
                </div>
                <input type="submit" name="Submit" value="Login">
            </form>
            <a href="#">Forgot Password</a>
        </div>
    </div>
</body>
</html>

<%
    if(request.getParameter("Submit")!=null)
    {
        String uid,pwd;
        uid = request.getParameter("mailid");
        pwd = request.getParameter("password");
        String query = "Select * from admin where aemailid='"+uid+"' and apassword='"+pwd+"'";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
            if(status){
                response.sendRedirect("../html/motivation.html");
                return;
            }
            else if(uid.isEmpty() || pwd.isEmpty()){
                // if no credentials or any one of the credentials are not filled then this msg is printed
                out.println("<html><span id=error><p>Please enter the details</p></span></html>");
            }
            else
                {
                   //data is wrong hence error message is generated
                   out.println("<html><span id=error><p>Incorrect Email id or password</p></span></html>");
                }
            conn.close();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
%>