package fitternity.controller;

import static com.fasterxml.jackson.databind.util.ClassUtil.name;
import fitternity.vmm.DBLoader;
import fitternity.vmm.FileUploader;
import fitternity.vmm.RDBMS_TO_JSON;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdminController {

    @ResponseBody
    @PostMapping(value = "/adminCheckLogin", produces = "text/html")
    public String checkLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam String adminemail, @RequestParam String password) throws SQLException {
        System.out.println("Adminemail is " + adminemail);
        System.out.println("password is " + password);
        ResultSet rs = DBLoader.executeQuery("select * from admin_table where adminemail='" + adminemail + "' and password='" + password + "' ");
        String ans = "";
        if (rs.next()) {
            HttpSession session = request.getSession();
            session.setAttribute("adminemail", adminemail);

            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/adminAddCities", produces = "text/html")
    public String addCities(HttpServletRequest request, HttpServletResponse response, @RequestParam String cityname, @RequestParam String desc) throws SQLException, IOException, ServletException {
        System.out.println("Cityname is " + cityname);
        System.out.println("Description is " + desc);

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from city_table where cityname='" + cityname + "' ");
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
            rs.updateString("cityname", cityname);
            rs.updateString("desc", desc);
            rs.updateString("photo", photo1);
            rs.insertRow();

            ans = "success";
        }
        return ans;
    }
    
    @ResponseBody
    @PostMapping(value = "/adminShowCities", produces = "application/json")
    public String ajax(HttpServletRequest request ,HttpServletResponse response )
    {
        String ans = new RDBMS_TO_JSON().generateJSON("select * from city_table");
        
        return ans;
    }
    
        @ResponseBody
    @PostMapping(value = "/adminDeleteCities", produces = "text/html")
    public String deleteCities(HttpServletRequest request, HttpServletResponse response, @RequestParam String cityname) throws SQLException, IOException, ServletException {
        System.out.println("Cityname is " + cityname);

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from city_table where cityname='" + cityname + "' ");
        if (rs.next()) {
            
            rs.deleteRow();
            
            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }
    
    @ResponseBody
    @PostMapping(value = "/adminGetAllOwners", produces = "application/json")
    public String getOwners(HttpServletRequest request ,HttpServletResponse response )
    {
        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_table");
        
        return ans;
    }
    
    @ResponseBody
    @PostMapping(value = "/adminPendingOwner", produces = "text/html")
    public String pending(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        
        String owneremail = request.getParameter("owneremail");
        
        String status = "Pending";
        
        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_table where owneremail='" + owneremail + "' and status ='Approved' ");
        if (rs.next()) {
            
            rs.updateString("status", status);
            rs.updateRow();
            
            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }
    
    @ResponseBody
    @PostMapping(value = "/adminApproveOwner", produces = "text/html")
    public String approve(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String owneremail = request.getParameter("owneremail");
        
        String status = "Approved";
        
        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_table where owneremail='" + owneremail + "' and status ='Pending' ");
        if (rs.next()) {
            
            rs.updateString("status", status);
            rs.updateRow();
            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }

}
