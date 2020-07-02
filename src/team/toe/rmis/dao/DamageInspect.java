package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public class DamageInspect {
    public static void inspect(LinkedHashMap<String,String> inspection, ArrayList<LinkedHashMap<String,String>> damage) throws SQLException
    {
        int id;
        Date date=new Date();
        SimpleDateFormat spDate=new SimpleDateFormat("yyyy-MM-dd");

//        double length=Double.parseDouble(inspection.get("损坏长"));
//        double wide=Double.parseDouble(inspection.get("损坏宽"));
//        double area=length*wide;
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
//        String sqlCommand="INSERT INTO 道路设施路面损害情况(日期,检查人员,道路编号,起止位置,检查总长,检查总宽,损坏类型,损坏长,损坏宽,损坏高,损坏面积,损坏位置及损坏情况描述,备注)" +
//                " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String sqlCommand="INSERT INTO 道路设施路面损害情况(日期,检查人员,道路编号,起止位置,检查总长,检查总宽) VALUES (?,?,?,?,?,?);";
        pst=connection.prepareStatement(sqlCommand);
//            pst.setString(1, spDate.format(date));
//            pst.setString(2,inspection.get("检查人员"));
//            pst.setInt(3,Integer.parseInt(inspection.get("道路编号")));
//            pst.setString(4,inspection.get("起止位置"));
//            pst.setDouble(5,Double.parseDouble(inspection.get("检查总长")));
//            pst.setDouble(6,Double.parseDouble(inspection.get("检查总宽")));
//            pst.setString(7,inspection.get("损坏类型"));
//            pst.setDouble(8,Double.parseDouble(inspection.get("损坏长")));
//            pst.setDouble(9,Double.parseDouble(inspection.get("损坏宽")));
//            pst.setDouble(10,Double.parseDouble(inspection.get("损坏高")));
//            pst.setDouble(11,area);
//            pst.setString(12,inspection.get("损坏位置及损坏情况描述"));
//            pst.setString(13,inspection.get("备注"));
        pst.setString(1, spDate.format(date));
        pst.setString(2,inspection.get("检查人员"));
        pst.setInt(3,Integer.parseInt(inspection.get("道路编号")));
        pst.setString(4,inspection.get("起止位置"));
        pst.setDouble(5,Double.parseDouble(inspection.get("检查总长")));
        pst.setDouble(6,Double.parseDouble(inspection.get("检查总宽")));
        pst.executeUpdate();

        sqlCommand="select 检查编号 FROM 道路设施路面损害情况 WHERE 日期=? AND 道路编号=?";
        pst=connection.prepareStatement(sqlCommand);
        pst.setString(1,spDate.format(date));
        pst.setInt(2,Integer.parseInt(inspection.get("道路编号")));
        pst.executeQuery();
        ResultSet result=pst.getResultSet();
        if(result.next()!=false)
        {
            id=result.getInt("检查编号");
            int i=0;
            while(!damage.isEmpty())
            {
                String sqlCommand1="INSERT INTO 损坏详情 (检查编号,损坏类型,损坏长,损坏宽,损坏高,损坏面积,损坏位置及损坏情况描述) VALUES (?,?,?,?,?,?,?);";
                pst=connection.prepareStatement(sqlCommand1);
                pst.setInt(1,id);
                pst.setString(2,damage.get(i).get("损坏类型"));
                pst.setDouble(3,Double.parseDouble(damage.get(i).get("损坏长")));
                pst.setDouble(4,Double.parseDouble(damage.get(i).get("损坏宽")));
                pst.setDouble(5,Double.parseDouble(damage.get(i).get("损坏高")));
                double area=Double.parseDouble(damage.get(i).get("损坏长"))*Double.parseDouble(damage.get(i).get("损坏宽"));
                pst.setDouble(6,area);
                pst.setString(7,damage.get(i).get("损坏位置及损坏情况描述"));
                pst.executeUpdate();
                i=i+1;
            }
            pst.close();
            connection.close();
        }
        else
        {
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");//TODO
        }
    }
}

