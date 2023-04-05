<%-- 
    Document   : test
    Created on : 27-Mar-2023, 6:15:46 pm
    Author     : Pratham Saroch
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script>
            <%
//            String name = request.getParameter("name");
//            String subject = request.getParameter("subject");
//            int rollnum = Integer.parseInt(request.getParameter("rollnum"));
//        int marks = Integer.parseInt(request.getParameter("marks"));
                
        String marks = (String) request.getAttribute("marks2");
        String name = (String) request.getAttribute("name");
        String subject = (String) request.getAttribute("subject");
        int rollnum = Integer.parseInt(request.getAttribute("rollnum").toString());
%>

            var name = "<%=name%>";
            var rollnum = "<%=rollnum%>";
            var marks = "<%=marks%>";
            var subject = "<%=subject%>";

            alert("Subject is " + subject);
            function showDetail()  
            {
                document.getElementById("name").value = name;
                document.getElementById("rollnum").value = rollnum;
                document.getElementById("marks").value = marks;
                document.getElementById("subject").value = subject;
            }
        </script>
    </head>
    <body onload="showDetail()" >

        <h1>This is Redirected Page</h1><br>

        <input type="text" id="name" ><br>
        <input type="text" id="rollnum" ><br>
        <input type="text" id="marks" ><br>
        <input type="text" id="subject" >

    </body>
</html>
