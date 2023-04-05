package fitternity.controller;

import fitternity.vmm.DBLoader;
import fitternity.vmm.FileUploader;
import fitternity.vmm.RDBMS_TO_JSON;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
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

@Controller
public class OwnerController {

    @ResponseBody
    @PostMapping(value = "/ownerViewCities", produces = "application/json")
    public String showCities() {
        String ans = new RDBMS_TO_JSON().generateJSON("select * from city_table");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerSignup", produces = "text/html")
    public String ownerSignup(HttpServletRequest request, HttpServletResponse response,
            @RequestParam String ownername, @RequestParam String owneremail, @RequestParam String cityname,
            @RequestParam String phoneno, @RequestParam String franname, @RequestParam String password) throws SQLException, IOException, ServletException {

        String status = "Pending";
        String ans = "";

        ResultSet rs = DBLoader.executeQuery("select * from owner_table where owneremail ='" + owneremail + "' ");
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
            rs.updateString("ownername", ownername);
            rs.updateString("owneremail", owneremail);
            rs.updateString("password", password);
            rs.updateString("city", cityname);
            rs.updateString("phoneno", phoneno);
            rs.updateString("status", status);
            rs.updateString("franchisename", franname);
            rs.updateString("photo", photo1);
            rs.insertRow();

            ans = "success";

        }
        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerCheckLogin", produces = "text/html")
    public String ownerLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam String password) throws SQLException {
        String owneremail = request.getParameter("owneremail");
        System.out.println("Owneremail is " + owneremail);
        System.out.println("password is " + password);
        ResultSet rs = DBLoader.executeQuery("select * from owner_table where owneremail='" + owneremail + "' and password='" + password + "' ");
        String ans = "";
        if (rs.next()) {

            HttpSession session = request.getSession();
            session.setAttribute("owneremail", owneremail);

            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerAddGym", produces = "text/html")
    public String ownerAddGym(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        String gymname = request.getParameter("gymname");
        String address = request.getParameter("address");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String city = request.getParameter("city");

        String pool = request.getParameter("pool");
        String sauna = request.getParameter("sauna");
        String changing_room = request.getParameter("changingroom");
        String lockers = request.getParameter("locker");
        String parking_facility = request.getParameter("parking");
        String ac = request.getParameter("ac");
        String shower = request.getParameter("shower");
        String washroom = request.getParameter("washroom");
        String waterfacility = request.getParameter("water");

        HttpSession session = request.getSession();
        String owneremail = (String) session.getAttribute("owneremail");

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_gyms_table where owneremail='" + owneremail + "' and gymname='" + gymname + "' ");
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
            rs.updateString("owneremail", owneremail);
            rs.updateString("gymname", gymname);
            rs.updateString("city", city);
            rs.updateString("address", address);
            rs.updateString("latitude", latitude);
            rs.updateString("longitute", longitude);
            rs.updateString("pool", pool);
            rs.updateString("sauna", sauna);
            rs.updateString("changing_room", changing_room);
            rs.updateString("lockers", lockers);
            rs.updateString("parking_facility", parking_facility);
            rs.updateString("ac", ac);
            rs.updateString("shower", shower);
            rs.updateString("washroom", washroom);
            rs.updateString("waterfacility", waterfacility);
            rs.updateString("photo", photo1);
            rs.insertRow();

            ans = "success";
        }

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerShowGymes", produces = "application/json")
    public String showGymes(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        String owneremail = (String) session.getAttribute("owneremail");

        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_gyms_table where owneremail='" + owneremail + "' ");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerDeleteGym", produces = "text/html")
    public String deleteCities(HttpServletRequest request, HttpServletResponse response, @RequestParam String gymname) throws SQLException, IOException, ServletException {
        System.out.println("Gymname is " + gymname);

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_gyms_table where gymname='" + gymname + "' ");
        if (rs.next()) {

            rs.deleteRow();

            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerAddGymPhotos", produces = "text/html")
    public String ownerAddGymPhotos(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        int gymid = Integer.parseInt(request.getParameter("gymid"));

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_gym_photos_table ");

        Part p1 = request.getPart("photo");
        String relpath = "./myuploads";
        String abspath = request.getServletContext().getRealPath(relpath);

        String newname = System.currentTimeMillis() + ".jpg";
        String filename = FileUploader.savefileonserver(p1, abspath, newname);
        String photo1 = "../myuploads/" + filename;

        rs.moveToInsertRow();
        rs.updateString("photo", photo1);
        rs.updateInt("gymid", gymid);
        rs.insertRow();
        ans = "success";

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerShowGymPhotos", produces = "application/json")
    public String showGymPhotos(HttpServletRequest request, HttpServletResponse response) {

        int gymid = Integer.parseInt(request.getParameter("gymid"));

        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_gym_photos_table where gymid='" + gymid + "' ");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerDeleteGymPhoto", produces = "text/html")
    public String deleteGymPhoto(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        int photoid = Integer.parseInt(request.getParameter("photoid"));

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_gym_photos_table where photoid ='" + photoid + "' ");
        if (rs.next()) {

            rs.deleteRow();

            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerAddPackage", produces = "text/html")
    public String ownerAddPackage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        String packagename = request.getParameter("packagename");
        int gymid = Integer.parseInt(request.getParameter("gymid"));
        String duration = request.getParameter("duration");
        String desc = request.getParameter("desc");
        String price = request.getParameter("price");
        String offerprice = request.getParameter("offerprice");

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_packages_table");

        Part p1 = request.getPart("photo");
        String relpath = "./myuploads";
        String abspath = request.getServletContext().getRealPath(relpath);

        String newname = System.currentTimeMillis() + ".jpg";
        String filename = FileUploader.savefileonserver(p1, abspath, newname);
        String photo1 = "../myuploads/" + filename;

        rs.moveToInsertRow();
        rs.updateString("packagename", packagename);
        rs.updateString("price", price);
        rs.updateString("offerprice", offerprice);
        rs.updateString("duration", duration);
        rs.updateString("desc", desc);
        rs.updateInt("gymid", gymid);
        rs.updateString("photo", photo1);
        rs.insertRow();

        ans = "success";

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerShowPackages", produces = "application/json")
    public String ownershowPackages(HttpServletRequest request, HttpServletResponse response) {

        int gymid = Integer.parseInt(request.getParameter("gymid"));

        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_packages_table where gymid='" + gymid + "' ");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerDeletePackage", produces = "text/html")
    public String ownerRemovePackage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        int packageid = Integer.parseInt(request.getParameter("packageid"));

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_packages_table where packageid ='" + packageid + "' ");
        if (rs.next()) {

            rs.deleteRow();

            ans = "success";
        } else {
            ans = "fail";
        }
        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerGetInfo", produces = "application/json")
    public String ownerGetInfo(HttpServletRequest request, HttpServletResponse response) {

        int gymid = Integer.parseInt(request.getParameter("gymid"));

        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_gyms_table where gymid='" + gymid + "' ");

        return ans;
    }

    @ResponseBody
    @PostMapping(value = "/ownerEditGym", produces = "text/html")
    public String ownerEditGym(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        String gymname = request.getParameter("gymname");
        String address = request.getParameter("address");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");

        String pool = request.getParameter("pool");
        String sauna = request.getParameter("sauna");
        String changing_room = request.getParameter("changingroom");
        String lockers = request.getParameter("locker");
        String parking_facility = request.getParameter("parking");
        String ac = request.getParameter("ac");
        String shower = request.getParameter("shower");
        String washroom = request.getParameter("washroom");
        String waterfacility = request.getParameter("water");

        HttpSession session = request.getSession();
        String owneremail = (String) session.getAttribute("owneremail");

        String ans = "";
        ResultSet rs = DBLoader.executeQuery("select * from owner_gyms_table where owneremail='" + owneremail + "' and gymname='" + gymname + "' ");

        if (rs.next()) {
            rs.updateString("owneremail", owneremail);
            rs.updateString("gymname", gymname);
            rs.updateString("address", address);
            rs.updateString("latitude", latitude);
            rs.updateString("longitute", longitude);
            rs.updateString("pool", pool);
            rs.updateString("sauna", sauna);
            rs.updateString("changing_room", changing_room);
            rs.updateString("lockers", lockers);
            rs.updateString("parking_facility", parking_facility);
            rs.updateString("ac", ac);
            rs.updateString("shower", shower);
            rs.updateString("washroom", washroom);
            rs.updateString("waterfacility", waterfacility);
            rs.updateRow();
            
            ans = "success";
        }

        return ans;
    }

}
