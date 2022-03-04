<%@page import="java.sql.*" %> 
<%@page contentType="text/html"
        pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/adminRegister.css">
        <title>Registration Form</title>
    </head>

    <body>
        <div class="left">
            <img src="../images/Logo.jfif" alt="" />
        </div>
        <!--HTML form to register an admin-->
        <form>
            <div class="form-box">
                <div class="header-text">Register Admin</div>
                <input type="email" name="emailid" placeholder="Enter Email ID" />
                <input type="text" name="name" placeholder="Enter Name" />
                <input type="password" name="password" placeholder="Enter Password" />
                <select name="securityQuesID">
                    <option value="" disabled selected>Choose a security question</option>
                    <option value="What is the name of your college?">
                        What is the name of your college?
                    </option>
                    <option value="What was your first school?">
                        What was your first school?
                    </option>
                    <option value="What is the last name of your father?">
                        What is the last name of your father?
                    </option>
                    <option value="Which city do you live in?">
                        Which city do you live in?
                    </option>
                </select>
                <input type="text" name="securityAns" placeholder="Enter Security Answer" />
                <button type="submit" class="btn" name="register">Register</button>
            </div>
        </form>
    </body>

</html>
<!--Java Code written in JSP page using the scriplet tag-->
<%
    if (request.getParameter("register") != null) {
        String aid, aname, apwd, asq, asa;
        aid = request.getParameter("emailid");
        aname = request.getParameter("name");
        apwd = request.getParameter("password");
        asq = request.getParameter("securityQuesID");
        asa = request.getParameter("securityAns");
        try {
            String queryForCheckDuplicates = "select * from admin where aemailid='" + aid + "'";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub", "root", "aadivyoma");
            Statement st_check = conn.createStatement();
            ResultSet rs_dup = st_check.executeQuery(queryForCheckDuplicates);
            boolean status = rs_dup.next();

            if (status) {
                out.println("<script>alert('Admin is already registered.');</script>");
            } else {
                String queryText = "insert into admin(aemailid,aname,apassword,asecurityques,asecurityans)values('" + aid + "','" + aname + "','" + apwd + "','" + asq + "','" + asa + "')";
                Statement st_insert = conn.createStatement();
                int i = st_insert.executeUpdate(queryText);
                if (i > 0) {
                    out.println("<script>alert('New admin has been registered successfully.');</script>");
                }
            }
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
    }
%>