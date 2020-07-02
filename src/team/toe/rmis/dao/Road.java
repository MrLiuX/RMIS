package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class Road {
    public static void addRoad(Map<String,String> road) throws SQLException//TODO 暂时只添加了关键信息
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
//        String sqlCommand="INSERT INTO 道路完整信息(" +
//                "道路编号,道路走向,起点,终点,设计单位,施工单位,道路等级,设计时速,路幅宽度,道路长度,道路面积,AADT," +
//                "交通量等级,所属乡镇,管理分类,管理单位,养护单位,建造年月,路面厚度,基层类型,基层厚度,车行道数,通行方向,机动车道宽度范围," +
//                "左侧机动车道宽度范围,右侧机动车道宽度范围,车行道面积,有无公交车专用道,侧石类型,侧石长度,平石类型,平石长度,检查井数量," +
//                "雨水口数量,路名牌数量,标志牌数量,树池面积) " +
//                "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,);";
        String sqlCommand="INSERT INTO 道路关键信息(道路编号,道路名称,道路养护等级,路面类型) VALUES(?,?,?,?);";

        pst=connection.prepareStatement(sqlCommand);
        pst.setInt(1,Integer.parseInt(road.get("道路编号")));
        pst.setString(2,road.get("道路名称"));
        pst.setString(3,road.get("道路养护等级"));
        pst.setString(4,road.get("路面类型"));
        pst.executeUpdate();
        pst.close();
        connection.close();
    }

    public static void deleteRoad(int id) throws SQLException //传入道路编号来删除道路
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="DELETE FROM 道路关键信息 WHERE 道路编号=?;";
        pst=connection.prepareStatement(sqlCommand);
        pst.setInt(1,id);
        pst.executeUpdate();
        pst.close();
        connection.close();
    }

    public static void selectRoad(int id) throws SQLException{} //TODO

    public static void alterRoadName(int id,String roadName) throws SQLException {//道路改名
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="UPDATE 道路关键信息 SET 道路名称=? WHERE 道路编号=?;";
        pst=connection.prepareStatement(sqlCommand);
        pst.setString(1,roadName);
        pst.setInt(2,id);
        pst.executeUpdate();
        pst.close();
        connection.close();
    }

    public static boolean isExist(int id)//判断道路是否存在
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        ResultSet result=null;
        String sqlCommand="SELECT 道路编号 FROM 道路关键信息 WHERE 道路编号=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,id);
            pst.executeQuery();
            result=pst.getResultSet();
            pst.close();
            connection.close();
            if(result.next()==false)
            {
                return false;
            }
            else
            {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static String getRoadType(int roadId)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="SELECT 路面类型 FROM 道路关键信息 WHERE 道路编号=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            if(result.next()!=false)
            {
                return result.getString("路面类型");
            }
            else
            {
                System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");//TODO
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "error";
    }
}
