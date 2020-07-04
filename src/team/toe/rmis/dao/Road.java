package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class Road {
    public static void addRoad(Map<String,String> road) throws SQLException
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand2="INSERT INTO 道路关键信息(道路编号,道路名称,道路养护等级,路面类型) VALUES(?,?,?,?);";
        pst=connection.prepareStatement(sqlCommand2);
        pst.setInt(1,Integer.parseInt(road.get("道路编号")));
        pst.setString(2,road.get("道路名称"));
        pst.setString(3,road.get("道路养护等级"));
        pst.setString(4,road.get("路面类型"));
        pst.executeUpdate();
        pst.close();
        connection.close();

        Connection connection1=DbConnect.getConnection();
        PreparedStatement pst1;
        String sqlCommand="INSERT INTO 道路完整信息(" +
                "道路编号,道路走向,树池面积,起点,终点,设计单位,施工单位,道路等级,设计时速,路幅宽度,道路长度,道路面积,AADT," +
                "交通量等级,所属乡镇,管理分类,管理单位,养护单位,建造年月,路面厚度,基层类型,基层厚度,车行道数,通行方向,机动车道宽度范围," +
                "左侧机动车道宽度范围,右侧机动车道宽度范围,车行道面积,有无公交车专用道,侧石类型,侧石长度,平石类型,平石长度,检查井数量," +
                "雨水口数量,路名牌数量,标志牌数量) " +
                "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
//        String sqlCommand="INSERT INTO 道路完整信息(" +
//                "标志牌数量,道路走向,树池面积,起点,终点,设计单位,施工单位,道路等级,设计时速,路幅宽度,道路长度,道路面积,AADT," +
//                "交通量等级,所属乡镇,管理分类,管理单位,养护单位,建造年月,路面厚度,基层类型,基层厚度,车行道数,通行方向,机动车道宽度范围," +
//                "左侧机动车道宽度范围,右侧机动车道宽度范围,车行道面积,有无公交车专用道,侧石类型,侧石长度,平石类型,平石长度,检查井数量," +
//                "雨水口数量,路名牌数量) " +
//                "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        pst1=connection1.prepareStatement(sqlCommand);
//        pst.setInt(1,Integer.parseInt(road.get("道路编号")));
        pst1.setInt(1,Integer.parseInt(road.get("道路编号")));
        pst1.setString(2,road.get("道路走向"));
        pst1.setString(3,road.get("树池面积"));
        pst1.setString(4,road.get("起点"));
        pst1.setString(5,road.get("终点"));
        pst1.setString(6,road.get("设计单位"));
        pst1.setString(7,road.get("施工单位"));
        pst1.setString(8,road.get("道路等级"));
        pst1.setString(9,road.get("设计时速"));
        pst1.setString(10,road.get("路幅宽度"));
        pst1.setString(11,road.get("道路长度"));
        pst1.setString(12,road.get("道路面积"));
        pst1.setString(13,road.get("AADT"));
        pst1.setString(14,road.get("交通量等级"));
        pst1.setString(15,road.get("所属乡镇"));
        pst1.setString(16,road.get("管理分类"));
        pst1.setString(17,road.get("管理单位"));
        pst1.setString(18,road.get("养护单位"));
        pst1.setString(19,road.get("建造年月"));
        pst1.setString(20,road.get("路面厚度"));
        pst1.setString(21,road.get("基层类型"));
        pst1.setString(22,road.get("基层厚度"));
        pst1.setString(23,road.get("车行道数"));
        pst1.setString(24,road.get("通行方向"));
        pst1.setString(25,road.get("机动车道宽度范围"));
        pst1.setString(26,road.get("左侧机动车道宽度范围"));
        pst1.setString(27,road.get("右侧机动车道宽度范围"));
        pst1.setString(28,road.get("车行道面积"));
        pst1.setString(29,road.get("有无公交车专用道"));
        pst1.setString(30,road.get("侧石类型"));
        pst1.setString(31,road.get("侧石长度"));
        pst1.setString(32,road.get("平石类型"));
        pst1.setString(33,road.get("平石长度"));
        pst1.setString(34,road.get("检查井数量"));
        pst1.setString(35,road.get("雨水口数量"));
        pst1.setString(36,road.get("路名牌数量"));
        pst1.setString(37,road.get("标志牌数量"));
        pst1.executeUpdate();
        pst1.close();
        connection.close();
    }

    public static void deleteRoad(int id) throws SQLException //传入道路编号来删除道路
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="DELETE FROM 道路关键信息 WHERE 道路编号=?;";
        pst=connection.prepareStatement(sqlCommand);
        pst.setInt(1,id);
        pst.executeUpdate();
        pst.close();
        connection.close();
    }

    public static LinkedHashMap<String,String> getRoad(int roadId)
    {
        LinkedHashMap<String,String> road= new LinkedHashMap<>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT * FROM 道路完整信息 WHERE 道路编号=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            while(result.next())
            {
                road.put("道路编号",Integer.toString(roadId));
                road.put("道路走向",result.getString("道路走向"));
                road.put("树池面积",result.getString("树池面积"));
                road.put("起点",result.getString("起点"));
                road.put("终点",result.getString("终点"));
                road.put("设计单位",result.getString("设计单位"));
                road.put("施工单位",result.getString("施工单位"));
                road.put("道路等级",result.getString("道路等级"));
                road.put("设计时速",result.getString("设计时速"));
                road.put("路幅宽度",result.getString("路幅宽度"));
                road.put("道路长度",result.getString("道路长度"));
                road.put("道路面积",result.getString("道路面积"));
                road.put("AADT",result.getString("AADT"));
                road.put("交通量等级",result.getString("交通量等级"));
                road.put("所属乡镇",result.getString("所属乡镇"));
                road.put("管理分类",result.getString("管理分类"));
                road.put("管理单位",result.getString("管理单位"));
                road.put("养护单位",result.getString("养护单位"));
                road.put("建造年月",result.getString("建造年月"));
                road.put("路面厚度",result.getString("路面厚度"));
                road.put("基层类型",result.getString("基层类型"));
                road.put("基层厚度",result.getString("基层厚度"));
                road.put("车行道数",result.getString("车行道数"));
                road.put("通行方向",result.getString("通行方向"));
                road.put("机动车道宽度范围",result.getString("机动车道宽度范围"));
                road.put("左侧机动车道宽度范围",result.getString("左侧机动车道宽度范围"));
                road.put("右侧机动车道宽度范围",result.getString("右侧机动车道宽度范围"));
                road.put("车行道面积",result.getString("车行道面积"));
                road.put("有无公交车专用道",result.getString("有无公交车专用道"));
                road.put("侧石类型",result.getString("侧石类型"));
                road.put("侧石长度",result.getString("侧石长度"));
                road.put("平石类型",result.getString("平石类型"));
                road.put("平石长度",result.getString("平石长度"));
                road.put("检查井数量",result.getString("检查井数量"));
                road.put("雨水口数量",result.getString("雨水口数量"));
                road.put("路名牌数量",result.getString("路名牌数量"));
                road.put("标志牌数量",result.getString("标志牌数量"));
                String sqlCommand2="SELECT * FROM 道路关键信息 WHERE 道路编号=?;";
                pst=connection.prepareStatement(sqlCommand2);
                pst.setInt(1,roadId);
                pst.executeQuery();
                ResultSet result2=pst.getResultSet();
                while(result.next())
                {
                    road.put("道路名称",result2.getString("道路名称"));
                    road.put("道路养护等级",result2.getString("道路养护等级"));
                    road.put("路面类型",result2.getString("路面类型"));
                }
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return road;
    }

    public static ArrayList<LinkedHashMap<String, String>> getRoads()
    {
        ArrayList<LinkedHashMap<String, String>> roads = new ArrayList<>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT * FROM 道路关键信息 LEFT JOIN 道路完整信息 道 on 道路关键信息.道路编号 = 道.道路编号";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            while(result.next()) {
                LinkedHashMap<String, String> road = new LinkedHashMap<>();
                road.put("道路编号", Integer.toString(result.getInt("道路编号")));
                road.put("道路走向", result.getString("道路走向"));
                road.put("树池面积", result.getString("树池面积"));
                road.put("起点", result.getString("起点"));
                road.put("终点", result.getString("终点"));
                road.put("设计单位", result.getString("设计单位"));
                road.put("施工单位", result.getString("施工单位"));
                road.put("道路等级", result.getString("道路等级"));
                road.put("设计时速", result.getString("设计时速"));
                road.put("路幅宽度", result.getString("路幅宽度"));
                road.put("道路长度", result.getString("道路长度"));
                road.put("道路面积", result.getString("道路面积"));
                road.put("AADT", result.getString("AADT"));
                road.put("交通量等级", result.getString("交通量等级"));
                road.put("所属乡镇", result.getString("所属乡镇"));
                road.put("管理分类", result.getString("管理分类"));
                road.put("管理单位", result.getString("管理单位"));
                road.put("养护单位", result.getString("养护单位"));
                road.put("建造年月", result.getString("建造年月"));
                road.put("路面厚度", result.getString("路面厚度"));
                road.put("基层类型", result.getString("基层类型"));
                road.put("基层厚度", result.getString("基层厚度"));
                road.put("车行道数", result.getString("车行道数"));
                road.put("通行方向", result.getString("通行方向"));
                road.put("机动车道宽度范围", result.getString("机动车道宽度范围"));
                road.put("左侧机动车道宽度范围", result.getString("左侧机动车道宽度范围"));
                road.put("右侧机动车道宽度范围", result.getString("右侧机动车道宽度范围"));
                road.put("车行道面积", result.getString("车行道面积"));
                road.put("有无公交车专用道", result.getString("有无公交车专用道"));
                road.put("侧石类型", result.getString("侧石类型"));
                road.put("侧石长度", result.getString("侧石长度"));
                road.put("平石类型", result.getString("平石类型"));
                road.put("平石长度", result.getString("平石长度"));
                road.put("检查井数量", result.getString("检查井数量"));
                road.put("雨水口数量", result.getString("雨水口数量"));
                road.put("路名牌数量", result.getString("路名牌数量"));
                road.put("标志牌数量", result.getString("标志牌数量"));
                road.put("道路名称", result.getString("道路名称"));
                road.put("道路养护等级", result.getString("道路养护等级"));
                road.put("路面类型", result.getString("路面类型"));
                roads.add(road);
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roads;
    }

    public static void alterRoadName(int id,String roadName) throws SQLException {//道路改名
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
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
        PreparedStatement pst;
        ResultSet result;
        String sqlCommand="SELECT 道路编号 FROM 道路关键信息 WHERE 道路编号=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,id);
            pst.executeQuery();
            result=pst.getResultSet();
            pst.close();
            connection.close();
            return result.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static String getRoadType(int roadId)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT 路面类型 FROM 道路关键信息 WHERE 道路编号=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            if (!result.next()) {
                System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");//TODO
            } else {
                return result.getString("路面类型");
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "error";
    }

    public static void main(String[] args) throws SQLException {
        LinkedHashMap<String,String> road=new LinkedHashMap<>();
        road.put("道路编号","999");
        road.put("道路养护等级","A");
        road.put("路面类型","水泥");
        Road.addRoad(road);
    }
}
