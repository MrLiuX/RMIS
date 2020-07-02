package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public class RoutineInspect {
    public static void inspect(LinkedHashMap<String, String> inspection) {
        Date date=new Date();
        SimpleDateFormat spDate=new SimpleDateFormat("yyyy-MM-dd");

        Connection connection = DbConnect.getConnection();
        PreparedStatement pst = null;
        String sqlCommand = "INSERT INTO 道路设施日常巡查情况记录 (巡查人员,道路编号,损坏类型,损坏位置及损坏情况描述,备注,巡查日期) VALUES(?,?,?,?,?,?);";
        try {
            pst = connection.prepareStatement(sqlCommand);
            pst.setString(1, inspection.get("巡查人员"));
            pst.setString(2, inspection.get("道路编号"));
            pst.setString(3, inspection.get("损坏类型"));
            pst.setString(4, inspection.get("损坏位置及损坏情况描述"));
            pst.setString(5, inspection.get("备注"));
            pst.setString(6, spDate.format(date));

            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<LinkedHashMap<String,String>> getAllRecord()
    {
        ArrayList<LinkedHashMap<String,String>> inspection=new ArrayList<LinkedHashMap<String,String>>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="SELECT * FROM 道路设施日常巡查情况记录";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            while(result.next())
            {
                LinkedHashMap<String,String> inspection_=new LinkedHashMap<String,String>();
                inspection_.put("巡查日期",result.getString("巡查日期"));
                inspection_.put("道路编号",result.getString("道路编号"));
                inspection_.put("巡查人员",result.getString("巡查人员"));
                inspection_.put("损坏类型",result.getString("损坏类型"));
                inspection_.put("损坏位置及损坏情况描述",result.getString("损坏位置及损坏情况描述"));
                inspection_.put("备注",result.getString("备注"));
                inspection.add(inspection_);
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inspection;
    }

//    public static void main(String[] args) {
//
//        LinkedHashMap<String,String> inspection=new LinkedHashMap<String,String>();
//        inspection.put("巡查人员","刘旭");
//        inspection.put("道路编号","1234");
//        inspection.put("损坏类型","线裂");
//        RoutineInspect.inspect(inspection);
//    }
}
