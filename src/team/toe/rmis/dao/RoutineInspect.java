package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedHashMap;

public class RoutineInspect {
    public static void inspect(LinkedHashMap<String, String> inspection) {
        Connection connection = DbConnect.getConnection();
        PreparedStatement pst = null;
        String sqlCommand = "INSERT INTO 道路设施日常巡查情况记录 (巡查人员,道路编号,损坏类型,损坏位置及损坏情况描述,备注) VALUES(?,?,?,?,?);";
        try {
            pst = connection.prepareStatement(sqlCommand);
            pst.setString(1, inspection.get("巡查人员"));
            pst.setString(2, inspection.get("道路编号"));
            pst.setString(3, inspection.get("损坏类型"));
            pst.setString(4, inspection.get("损坏位置及损坏情况描述"));
            pst.setString(5, inspection.get("备注"));

            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
