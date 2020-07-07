package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public class FlatnessInspect {
    public static void inspect(LinkedHashMap<String,String> inspection)
    {
        Date date=new Date();
        SimpleDateFormat spDate=new SimpleDateFormat("yyyy-MM-dd");

        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="INSERT INTO 道路路面平整度检测(检测人员,道路编号,IRI,备注,检测日期) VALUES (?,?,?,?,?);";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,inspection.get("检测人员"));
            pst.setInt(2,Integer.parseInt(inspection.get("道路编号")));
            pst.setDouble(3,Double.parseDouble(inspection.get("IRI")));
            pst.setString(4,inspection.get("备注"));
            pst.setString(5, spDate.format(date));
            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<LinkedHashMap<String,String>> getInspections()
    {
        ArrayList<LinkedHashMap<String,String>> inspections = new ArrayList<>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT * FROM 道路路面平整度检测;";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            while(result.next()){
                LinkedHashMap<String,String> inspection = new LinkedHashMap<>();
                inspection.put("检测日期",result.getString("检测日期"));
                inspection.put("检测人员",result.getString("检测人员"));
                inspection.put("道路编号",result.getString("道路编号"));
                inspection.put("IRI",result.getString("IRI"));
                inspection.put("备注",result.getString("备注"));
                inspections.add(inspection);
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inspections;
    }
}
