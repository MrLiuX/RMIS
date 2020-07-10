package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class DamageNotice {
    public static void damageNotice(LinkedHashMap<String,String> notice)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="INSERT INTO 设施损害通知单" +
                "(日期,设施名称,损坏部位,损坏原因,处理意见,技术员) VALUES (?,?,?,?,?,?);";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,notice.get("日期"));
            pst.setString(2,notice.get("设施名称"));
            pst.setString(3,notice.get("损坏部位"));
            pst.setString(4,notice.get("损坏原因"));
            pst.setString(5,notice.get("处理意见"));
            pst.setString(6,notice.get("技术员"));
            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<LinkedHashMap<String,String>> getNotice()
    {
        ArrayList<LinkedHashMap<String,String>> notices = new ArrayList<>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT * FROM 设施损害通知单";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            while(result.next()){
                LinkedHashMap<String,String> notice = new LinkedHashMap<>();
                notice.put("日期",result.getString("日期"));
                notice.put("设施名称",result.getString("设施名称"));
                notice.put("损坏部位",result.getString("损坏部位"));
                notice.put("损坏原因",result.getString("损坏原因"));
                notice.put("处理意见",result.getString("处理意见"));
                notice.put("技术员",result.getString("技术员"));
                notices.add(notice);
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notices;
    }
}
