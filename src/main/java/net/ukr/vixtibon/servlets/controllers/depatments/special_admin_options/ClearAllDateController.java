package net.ukr.vixtibon.servlets.controllers.depatments.special_admin_options;

import net.ukr.vixtibon.Generator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ClearAllDateController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Generator generator = new Generator();
        boolean result ;
        result = generator.deleteDate();
        if(result){
            request.setAttribute("result", "success");
            request.setAttribute("menu", "admin");
        }else{
            request.setAttribute("menu", "admin");
            request.setAttribute("result", "unsuccess");
        }
        request.getRequestDispatcher("/Admin/ActionResultPageController").forward(request, response);
    }
}
