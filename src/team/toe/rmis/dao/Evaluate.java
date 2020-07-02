package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Evaluate {
    public static void RQIEvaluate(int roadId,double IRI)
    {
        Date date=new Date();
        SimpleDateFormat spDate=new SimpleDateFormat("yyyy");
        String level;
        double RQI=4.98-0.34*IRI;
        if(RQI<0)
        {
            RQI = 0;
        }
        if(RQI<2.4)
            level="D";
        else if (RQI<3)
            level="C";
        else if(RQI<3.6)
            level="B";
        else
            level="A";
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="INSERT INTO 路面行驶质量评价(道路编号,评价日期,RQI,评级)" +
                " VALUES (?,?,?,?);";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.setInt(2,Integer.parseInt(spDate.format(date)));
            pst.setDouble(3,RQI);
            pst.setString(4,level);
            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void PCIEvaluate(){};

    public static void PQIEvaluate(int roadId)
    {
        Date date=new Date();
        SimpleDateFormat spDate=new SimpleDateFormat("yyyy");

        double RQI=0;
        double PCI=0;
        double PQI;
        String level;
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        try
        {
            String sqlCommand="SELECT RQI FROM 路面行驶质量评价 WHERE 评价日期=?;";
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,Integer.parseInt(spDate.format(date)));
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            if(result.next()!=false)
            {
                RQI=result.getInt("RQI");
            }

            String sqlCommand_="SELECT PCI FROM 路面损坏状况评价 WHERE 评价日期=?;";
            pst=connection.prepareStatement(sqlCommand_);
            pst.setInt(1,Integer.parseInt(spDate.format(date)));
            pst.executeQuery();
            ResultSet result_=pst.getResultSet();
            if(result.next()!=false)
            {
                PCI=result.getInt("PCI");
            }
            PQI=20*RQI*0.6+PCI*0.4;
            if(PQI>100)
            {
                PQI = 100;
            }

            if(RQI<60)
                level="D";
            else if (RQI<70)
                level="C";
            else if(RQI<85)
                level="B";
            else
                level="A";

            String sqlCommand__="INSERT INTO 道路综合评价表(道路编号,评价日期,PQI,评级)" +
                    " VALUES (?,?,?,?);";
            pst=connection.prepareStatement(sqlCommand__);
            pst.setInt(1,roadId);
            pst.setInt(2,Integer.parseInt(spDate.format(date)));
            pst.setDouble(3,PQI);
            pst.setString(4,level);
            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
