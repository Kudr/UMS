package net.ukr.vixtibon.servlets.controllers.study_process.discipline;

import net.ukr.vixtibon.base_objects.departments.Department;
import net.ukr.vixtibon.base_objects.study_process.Discipline;
import net.ukr.vixtibon.base_objects.study_process.DisciplineDepartmentDependencyObject;
import net.ukr.vixtibon.dao.departments.DAODepartment;
import net.ukr.vixtibon.dao.stady_process.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class DeleteDisciplinePageController  extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        if(request.getParameterMap().containsKey("step")){
            DAODiscipline daodi = new DAODiscipline();
            if(request.getParameter("step").equals("step1")){
                Discipline discipline = daodi.getEntityById(Integer.parseInt(request.getParameter("disciplineID")));
                DAODisciplineTeacherDependencyObject ddtdo = new DAODisciplineTeacherDependencyObject();
                DAODisciplineDepartmentDependency daoddd = new DAODisciplineDepartmentDependency();
                DAOStudentAttendance daosa = new DAOStudentAttendance();
                DAOStudentProgress daosp = new DAOStudentProgress();

                //request.setAttribute("selected", "yes");

                if(ddtdo.getCountOfDependencyByDisciplineID(discipline.getID())>0){
                    request.setAttribute("possible_to_remove", "no");
                }else{
                    if(daoddd.getCountOfDependencyByDisciplineID(discipline.getID())>0){
                        request.setAttribute("possible_to_remove", "no");
                    }else{
                        if(daosa.getCountByDisciplineID(discipline.getID())>0){
                            request.setAttribute("possible_to_remove", "no");
                        }else{
                            if(daosp.getCountByDisciplineID(discipline.getID())>0){
                                request.setAttribute("possible_to_remove", "no");
                            }else{
                                request.setAttribute("possible_to_remove", "yes");
                            }
                        }
                    }
                }

                daosp.closeConnection();
                daosa.closeConnection();
                ddtdo.closeConnection();
                daoddd.closeConnection();

                request.setAttribute("selected","yes");
                request.setAttribute("discipline", discipline);
                request.getRequestDispatcher("Discipline/Operations/DeleteDisciplinePage.jsp").forward(request, response);
            }else if(request.getParameter("step").equals("step2")){
                boolean result;
                result = daodi.delete(Integer.parseInt(request.getParameter("disciplineID")));
                if(result){
                    request.setAttribute("result", "success");
                    request.setAttribute("menu", "discipline");
                }else{
                    request.setAttribute("menu", "discipline");
                    request.setAttribute("result", "unsuccess");
                }
                daodi.closeConnection();
                request.getRequestDispatcher("/Employee/ActionResultEmployeeMenuPageController").forward(request, response);
            }else if(request.getParameter("step").equals("cancel")){
                request.getRequestDispatcher("/Employee/DisciplinePageController").forward(request, response);
            }else{
                request.setAttribute("menu", "discipline");
                request.setAttribute("error", "incorrectValue");
                request.getRequestDispatcher("/Employee/ActionResultEmployeeMenuPageController").forward(request, response);
            }
        }else{
            DAODepartment daod = new DAODepartment();
            DAODiscipline daodi = new DAODiscipline();
            DAODisciplineDepartmentDependency daoddd = new DAODisciplineDepartmentDependency();

            ArrayList<DisciplineDepartmentDependencyObject> dddos =  daoddd.getAllByDepartmentID((int) session.getAttribute("departmentID"));

            ArrayList<Discipline> disciplinesConnectedWithDepartment = new ArrayList<>();
            ArrayList<Discipline> disciplinesNotConnectedWithDepartment;

            for(DisciplineDepartmentDependencyObject dddo: dddos){
                disciplinesConnectedWithDepartment.add(daodi.getEntityById(dddo.getDisciplineID()));
            }

            disciplinesNotConnectedWithDepartment = daodi.getAll();

            for(DisciplineDepartmentDependencyObject dddo: dddos){
                for(Discipline d: disciplinesNotConnectedWithDepartment){
                    if(dddo.getDisciplineID() == d.getID()){
                        disciplinesNotConnectedWithDepartment.remove(d);
                        break;
                    }
                }
            }

            Department department = daod.getEntityById((int) session.getAttribute("departmentID"));

            daoddd.closeConnection();
            daodi.closeConnection();
            daod.closeConnection();

            request.setAttribute("department", department);
            request.setAttribute("disciplinesConnectedWithDepartment", disciplinesConnectedWithDepartment);
            request.setAttribute(" disciplinesNotConnectedWithDepartment",  disciplinesNotConnectedWithDepartment);
            request.getRequestDispatcher("Discipline/Operations/DeleteDisciplinePage.jsp").forward(request, response);
        }
    }
}
