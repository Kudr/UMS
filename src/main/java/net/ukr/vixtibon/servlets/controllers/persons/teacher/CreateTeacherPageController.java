package net.ukr.vixtibon.servlets.controllers.persons.teacher;

import net.ukr.vixtibon.base_objects.departments.Department;
import net.ukr.vixtibon.base_objects.persons.Teacher;
import net.ukr.vixtibon.dao.departments.DAODepartment;
import net.ukr.vixtibon.dao.persons.DAOTeacher;
import net.ukr.vixtibon.dao.stady_process.DAODiscipline;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by alex on 04/02/2017.
 */
public class CreateTeacherPageController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        if(request.getParameterMap().containsKey("fillForm")){
            if(request.getParameter("fillForm").equals("yes")){
                DAOTeacher daot = new DAOTeacher();
                DAODiscipline daodi = new DAODiscipline();
                Teacher teacher = new Teacher();
                boolean result = false;
                int disciplineCount = daodi.getCountOfDisciplinesByDepartmentID((int) session.getAttribute("departmentID"));
                teacher.setName(request.getParameter("name"));
                teacher.setlastName(request.getParameter("lastName"));
                teacher.setfathersName(request.getParameter("fathersName"));
                teacher.setPersonalID(request.getParameter("personalID"));
                teacher.setSex(request.getParameter("sex"));
                SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
                String dateInString = ""+request.getParameter("bday")+"-"+request.getParameter("bmonth")+"-"+request.getParameter("byear")+" 10:20:56";
                Date date = new Date();
                try {
                    date = sdf.parse(dateInString);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                teacher.setDateOfBorn(date);
                teacher.setEmail(request.getParameter("email"));
                teacher.setPhoneNumber(request.getParameter("phoneNumber"));
                teacher.setAddress(request.getParameter("address"));
                teacher.setPasport(request.getParameter("pasport"));
                teacher.setOffice(request.getParameter("office"));
                teacher.setLevel(request.getParameter("level"));
                teacher.setLogin(request.getParameter("login"));
                teacher.setDepartmentID(Integer.parseInt(request.getParameter("departmentID")));
                String[] disciplines = request.getParameterValues("discipline");

                for(String disciplineID: disciplines){
                    teacher.getDisciplines().add(daodi.getEntityById(Integer.parseInt(disciplineID)));
                }

                try {
                    result = daot.create(teacher);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if(result){
                    request.setAttribute("result", "success");
                    request.setAttribute("menu", "teacher");
                }else{
                    request.setAttribute("menu", "teacher");
                    request.setAttribute("result", "unsuccess");
                }
                daodi.closeConnection();
                daot.closeConnection();
                request.getRequestDispatcher("ActionResultEmployeeMenuPageController").forward(request, response);
            }else if(request.getParameter("fillForm").equals("cancel")){
                request.getRequestDispatcher("TeacherPageController").forward(request, response);
            }else{
                //error page
            }
        }else{
            DAODepartment daod = new DAODepartment();
            DAODiscipline daodi = new DAODiscipline();
            Department department = daod.getEntityById((int) session.getAttribute("departmentID"));
            department.setDisciplines(daodi.getAllByDepartmentID(department.getID()));
            daod.closeConnection();
            request.setAttribute("department", department);
            request.getRequestDispatcher("Employee/Teacher/Operations/CreateTeacherPage.jsp").forward(request, response);
        }
    }
}