package net.ukr.vixtibon.dao.stady_process;

import net.ukr.vixtibon.base_objects.study_process.Lesson;
import net.ukr.vixtibon.dao.AbstractController;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by alex on 27/02/2017.
 */
public class DAOLesson extends AbstractController<Lesson,Integer> {
    @Override
    public List<Lesson> getAll() {
        return null;
    }

    @Override
    public boolean update(Lesson entity) {
        return false;
    }

    @Override
    public Lesson getEntityById(Integer id) {
        return null;
    }
    public int getCountByDepartmentID(int departmentID){
        int count = 0;
        String Get_getCountByDepartmentID_Statement = "SELECT COUNT(*) FROM timetable WHERE departmentID=" + departmentID + ";";
        PreparedStatement ps = getPrepareStatement(Get_getCountByDepartmentID_Statement);
        ResultSet rs = null;
        try {
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException logOrIgnore) {}
            if (ps != null) try { ps.close(); } catch (SQLException logOrIgnore) {}
        }
        return count;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    public boolean deleteByDepartmentID(Integer departmentID){
        String Delete_Lesson_Statement = "DELETE FROM timetable WHERE departmentID=" + departmentID + ";";
        PreparedStatement ps = getPrepareStatement(Delete_Lesson_Statement);
        try {
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException logOrIgnore) {}
        }
    }

    @Override
    public boolean create(Lesson entity) throws SQLException {
        String Create_Lesson_Statemet = "INSERT INTO timetable (id,dayNumber,lessonNumberInDay,departmentID, groupID) " +
                "VALUES ('" + findFreeID("timetable") + "','" + entity.getDayNumber()  + "','" + entity.getLessonNumberInDay() +
                "','" +entity.getDepartmentID()+ "','" + entity.getGroupID() +"');";
        PreparedStatement ps = getPrepareStatement(Create_Lesson_Statemet);
        try {
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException logOrIgnore) {}
        }
    }
}
