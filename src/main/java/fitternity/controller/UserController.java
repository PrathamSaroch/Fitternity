package fitternity.controller;

import fitternity.vmm.DBLoader;
import fitternity.vmm.FileUploader;
import fitternity.vmm.RDBMS_TO_JSON;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//@SessionScope
@Controller
@CrossOrigin(origins = "*")
public class UserController {
    
    
    @ResponseBody
    @PostMapping(value = "/userSignup", produces = "text/html")
    public String userSignup(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String ans = "";
        String useremail = request.getParameter("useremail");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String phoneno = request.getParameter("phoneno");

        ResultSet rs = DBLoader.executeQuery("select * from user_table where useremail ='" + useremail + "' ");
        if (rs.next()) {
            ans = "fail";
        } else {

            Part p1 = request.getPart("photo");
            String relpath = "./myuploads";
            String abspath = request.getServletContext().getRealPath(relpath);

            String newname = System.currentTimeMillis() + ".jpg";
            String filename = FileUploader.savefileonserver(p1, abspath, newname);
            String photo1 = "../myuploads/" + filename;

            rs.moveToInsertRow();
            rs.updateString("username", username);
            rs.updateString("useremail", useremail);
            rs.updateString("password", password);
            rs.updateString("address", address);
            rs.updateString("phoneno", phoneno);
            rs.updateString("photo", photo1);
            rs.insertRow();

            ans = "success";

        }
        return ans;
    }
    
    @ResponseBody
    @PostMapping(value = "/allUsers", produces = "application/json")
    public String allUsers(HttpServletRequest request, HttpServletResponse response) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from user_table");
        
        System.out.println(ans);

        return ans;
    }
    
    @ResponseBody
    @PostMapping(value = "/delUsers", produces = "text/html")
    public String delUsers(HttpServletRequest request, HttpServletResponse response,@RequestParam String useremail) throws SQLException {
        
        ResultSet rs = DBLoader.executeQuery("select * from user_table where useremail='" + useremail+"' ");
        String ans = "";
        if (rs.next()) {
            rs.deleteRow();
            
            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
        
    }
    
    @ResponseBody
    @PostMapping(value = "/allCities", produces = "application/json")
    public String allCities(HttpServletRequest request, HttpServletResponse response) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from city_table");

        return ans;
    }
    
    
    @ResponseBody
    @PostMapping(value = "/selectedGyms", produces = "application/json")
    public String selectedGyms(HttpServletRequest request, HttpServletResponse response, @RequestParam String cityname) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_table where city ='"+cityname+"' ");

        return ans;
    }
    
    
    @ResponseBody
    @PostMapping(value = "/userCheckLogin", produces = "text/html")
    public String checkLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam String useremail, @RequestParam String password) throws SQLException, ServletException {
        System.out.println("Adminemail is " + useremail);
        System.out.println("password is " + password);
        ResultSet rs = DBLoader.executeQuery("select * from user_table where useremail='" + useremail + "' and password='" + password + "' ");
        String ans = "";
        if (rs.next()) {
            System.out.println("Hello World");
            session.setAttribute("useremail", useremail);
            System.out.println(useremail);
            ans = "success";
        } else {
            System.out.println("Fail");
            ans = "fail";
        }
        return ans;
    }
    
    
    
    @ResponseBody
    @PostMapping(value = "/userCheckSession", produces = "application/json")
    public String checkSession(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    System.out.println("Hello world");

    // Retrieve user email from the session
    String useremail = (String) session.getAttribute("useremail");

    if (useremail != null) {
        System.out.println("User email in session: " + useremail);
        return "success:" + useremail;
    } else {
        System.out.println("No user email found in session");
        return "fail";
    }
}
    
    

    @ResponseBody
    @PostMapping(value = "/userShowAllGyms", produces = "application/json")
    public String userShowAllGyms(HttpServletRequest request, HttpServletResponse response) {
        String cityname = request.getParameter("cityname");
        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_gyms_table where city='" + cityname + "' and owneremail in (select owneremail from owner_table where status ='Approved' ) ");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/userShowGymGallery", produces = "application/json")
    public String userShowGymGallery(HttpServletRequest request, HttpServletResponse response) {
        String gymid = request.getParameter("gymid");
        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_gyms_table where gymid='" + gymid + "' ");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/userShowGymPhotos", produces = "application/json")
    public String userShowGymPhotos(HttpServletRequest request, HttpServletResponse response) {
        String gymid = request.getParameter("gymid");
        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_gym_photos_table where gymid='" + gymid + "' ");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/userShowPlan", produces = "application/json")
    public String userShowGymPlan(HttpServletRequest request, HttpServletResponse response) {
        String packageid = request.getParameter("packageid");
        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_packages_table where packageid='" + packageid + "' ");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/userOnlinePayment", produces = "text/html")
    public String userOnlinePayment(HttpServletRequest request, HttpServletResponse response, HttpSession session)
    {
        String ans = null;
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String price = request.getParameter("price");
        int packageid = Integer.parseInt(request.getParameter("packageid"));
        String modeofpayment = "Online Payment";
        String useremail = (String) session.getAttribute("useremail");
        String packagename = "";

        int gymid = 0;
        String owneremail = "";
        String address = "";
        try {
            ResultSet rs = DBLoader.executeQuery("select * from owner_packages_table where packageid='" + packageid+ "' ");
            if (rs.next()) {
                gymid = rs.getInt("gymid");
                packagename = rs.getString("packagename");
            }
            ResultSet rs2 = DBLoader.executeQuery("select * from owner_gyms_table where gymid='" + gymid+ "' ");
            if (rs2.next()) {
                owneremail = rs2.getString("owneremail");
                address = rs2.getString("address");
            }

            ResultSet rs3 = DBLoader.executeQuery("select * from payment_table");

            rs3.moveToInsertRow();
            rs3.updateString("owneremail", owneremail);
            rs3.updateString("useremail", useremail);
            rs3.updateInt("packageid", packageid);
            rs3.updateString("price", price);
            rs3.updateString("paymenttype", modeofpayment);
            rs3.updateString("startdate", startdate);
            rs3.updateString("enddate", enddate);
            rs3.updateString("packagename", packagename);
            rs3.updateString("address", address);
            rs3.insertRow();

//            service.sendSimpleEmail(useremail, "this is price--"+price, "Package Booked Successfully");
            ans = "success";
            return ans;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ans;
    }
  
    @ResponseBody
    @PostMapping(value = "/userCashPayment", produces = "text/html")
    public String userCashPayment(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws SQLException {
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String price = request.getParameter("price");
        int packageid = Integer.parseInt(request.getParameter("packageid"));
        String modeofpayment = "Cash on Delivery";
        String useremail = (String) session.getAttribute("useremail");

        int gymid = 0;
        String owneremail = "";
        String address = "";

        ResultSet rs = DBLoader.executeQuery("select gymid from owner_packages_table where packageid=" + packageid);
        if (rs.next()) {
            gymid = rs.getInt("gymid");
        }
        ResultSet rs2 = DBLoader.executeQuery("select * from owner_gyms_table where gymid=" + gymid);
        if (rs2.next()) {
            owneremail = rs2.getString("owneremail");
            address = rs2.getString("address");
        }

        ResultSet rs3 = DBLoader.executeQuery("select * from payment_table");

        rs3.moveToInsertRow();
        rs3.updateString("owneremail", owneremail);
        rs3.updateString("useremail", useremail);
        rs3.updateInt("packageid", packageid);
        rs3.updateString("price", price);
        rs3.updateString("paymenttype", modeofpayment);
        rs3.updateString("startdate", startdate);
        rs3.updateString("enddate", enddate);
        rs3.updateString("address", address);
        rs3.insertRow();
        
        return "success";
    }

    @ResponseBody
    @PostMapping(value = "/userShowAllBookedPackages", produces = "application/json")
    public String userShowAllBookedPackages(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws SQLException {
        String useremail = (String) session.getAttribute("useremail");

        String ans = new RDBMS_TO_JSON().generateJSON("select * from payment_table where useremail='"+useremail+ "' ");
        
        return ans;

    }
    
    @ResponseBody
    @PostMapping(value = "/userChangePassword", produces = "text/html")
    public String userChangePassword(HttpSession session, HttpServletRequest request, 
            HttpServletResponse response, @RequestParam String oldpassword, 
            @RequestParam String newpassword) throws SQLException, ServletException {
        
        String useremail = (String) session.getAttribute("useremail");
        
        ResultSet rs = DBLoader.executeQuery("select * from user_table where useremail='" + useremail + "' and password='" + oldpassword + "' ");
        String ans = "";
        if (rs.next()) {

            rs.updateString("password", newpassword);
            rs.updateRow();
            
            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }
    
    
            
}
