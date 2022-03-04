<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <link rel="stylesheet" href="../css/StudentLogin.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap" rel="stylesheet">
</head>
<body>
    <header class="class">
        <!-- Left Box for logo -->
        <div class="left">
            <img src="../images/Logo.jpeg" alt="" style="display:flex">
        </div>
    </header>
    <div class="loginBox">
        <div class="glass">
            <img src="../images/student.png" width="100" height="100" class="admin" style="display:flex">
            <h2>Student Login</h2>
            <form method="get">
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
            <a href="ForgotPassword_Student.jsp">Forgot Password</a>
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
        String query = "Select * from student where semailid='"+uid+"' and spassword='"+pwd+"'";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/bvproject","root","CHARVI");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
            if(status){
                response.sendRedirect("Seminar.jsp");
                return;
            }
           else if(uid.isEmpty() || pwd.isEmpty())
                {
                        //no data has been entered thus the following message is printed   
                        out.println("<html><div id=error><p>Please enter the details</p></div></html>");
                 }
            else
                {
                   //data is wrong hence error message is generated
                   out.println("<html><div id=error><p>Incorrect Email id or password</p></div></html>");
                   //request.setAttribute("errorMessage", "Invalid username or password"); 
                }
            conn.close();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
%>


