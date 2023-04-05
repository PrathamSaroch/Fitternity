<%-- 
    Document   : test
    Created on : 27-Mar-2023, 6:15:46 pm
    Author     : Pratham Saroch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script>
            
            function fetchDetails()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();
                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        alert(this.responseText);
                        document.getElementById("showOwners").innerHTML  = this.responseText;
                        
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./ajax", true);
                //3. Send Request
                xhttp.send();
            }
            
        </script>
        
    </head>
    <body>

        <h1>All Details</h1>

        <input type="button" value="Fetch details" onclick="fetchDetails()" >
        
        <div id="showOwners" >
            
        </div>

    </body>
</html>
