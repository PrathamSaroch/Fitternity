package fitternity.controller;

import fitternity.vmm.RDBMS_TO_JSON;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class test {
    
    @PostMapping("/stu")
    public String next(HttpServletRequest request, HttpServletResponse response,@RequestParam String name, @RequestParam int rollnum, @RequestParam int marks )
    {
        String marks2 = "50";
        String subject ="Maths";
        
        request.setAttribute("name", name);
        request.setAttribute("rollnum", rollnum);
        request.setAttribute("marks2", marks2);
        request.setAttribute("subject", subject);
        
        return "test_2.jsp";
    }
    
    @ResponseBody
    @PostMapping(value = "/ajax", produces = "application/json")
    public String ajax(HttpServletRequest request ,HttpServletResponse response )
    {
        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_properties_detail_table");
        
        return ans;
    }
    
    @GetMapping("/")
    public String index(HttpServletRequest request, HttpServletResponse response)
    {
//        String marks2 = "50";
//        String subject ="Maths";
//        
//        request.setAttribute("name", name);
//        request.setAttribute("rollnum", rollnum);
//        request.setAttribute("marks2", marks2);
//        request.setAttribute("subject", subject);
        
        return "index_1.jsp";
    }
    
}

