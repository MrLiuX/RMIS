package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
}
