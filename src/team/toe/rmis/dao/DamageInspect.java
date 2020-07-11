package team.toe.rmis.dao;

import team.toe.rmis.service.PQIEvaluate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public class DamageInspect {
    public static int deduct(String roadType,String damageType,double damageRatio)
    {
        switch(roadType)
        {
            case "沥青":
            {
                if(damageRatio<0.01)
                    damageRatio=0;
                else if (damageRatio<0.1)
                    damageRatio=0.01;
                else if(damageRatio<1)
                    damageRatio=0.1;
                else if(damageRatio<10)
                    damageRatio=1;
                else if(damageRatio<50)
                    damageRatio=10;
                else if (damageRatio<100)
                    damageRatio=50;
                else
                    damageRatio=100;
                break;
            }
            case "水泥":
            {
                switch (damageType)
                {
                    case "板角断裂":
                    case "边角裂缝":
                    case "边角剥落":
                    {
                        if(damageRatio<0.5)
                            damageRatio=0;
                        else if (damageRatio<1)
                            damageRatio=0.5;
                        else if(damageRatio<3)
                            damageRatio=1;
                        else if(damageRatio<5)
                            damageRatio=3;
                        else if(damageRatio<7)
                            damageRatio=5;
                        else if(damageRatio<100)
                            damageRatio=7;
                        else
                            damageRatio=100;
                        break;
                    }

                    case "交叉裂缝和破碎板":
                    {
                        if(damageRatio<1)
                            damageRatio=0;
                        else if (damageRatio<5)
                            damageRatio=1;
                        else if(damageRatio<10)
                            damageRatio=5;
                        else if(damageRatio<30)
                            damageRatio=10;
                        else if(damageRatio<50)
                            damageRatio=30;
                        else if(damageRatio<100)
                            damageRatio=50;
                        else
                            damageRatio=100;
                        break;
                    }

                    case "接缝料损坏":
                    {
                        if(damageRatio<0.1)
                            damageRatio=0;
                        else if (damageRatio<1)
                            damageRatio=0.1;
                        else if(damageRatio<5)
                            damageRatio=1;
                        else if(damageRatio<10)
                            damageRatio=5;
                        else if(damageRatio<20)
                            damageRatio=10;
                        else if(damageRatio<100)
                            damageRatio=20;
                        else
                            damageRatio=100;
                        break;
                    }

                    case "坑洞":
                    {
                        if(damageRatio<0.02)
                            damageRatio=0;
                        else if (damageRatio<0.1)
                            damageRatio=0.02;
                        else if(damageRatio<0.2)
                            damageRatio=0.1;
                        else if(damageRatio<0.6)
                            damageRatio=0.2;
                        else if(damageRatio<1)
                            damageRatio=0.6;
                        else if(damageRatio<100)
                            damageRatio=1;
                        else
                            damageRatio=100;
                        break;
                    }

                    case "表面裂纹":
                    {
                        if(damageRatio<0.5)
                            damageRatio=0;
                        else if (damageRatio<1)
                            damageRatio=0.5;
                        else if(damageRatio<5)
                            damageRatio=1;
                        else if(damageRatio<10)
                            damageRatio=5;
                        else if(damageRatio<50)
                            damageRatio=10;
                        else if(damageRatio<100)
                            damageRatio=50;
                        else
                            damageRatio=100;
                        break;
                    }
                }
                break;
            }
        }
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT 扣分 FROM 损坏单项扣分表 " +
                "WHERE 路面类型=? AND 损坏类型=? AND 损坏密度=?;";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,roadType);
            pst.setString(2,damageType);
            pst.setDouble(3,damageRatio);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            if(result.next())
            {
                return result.getInt("扣分");
            }
            else
            {
                System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");//TODO
            }

            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void damageDeduct(int inspectId)
    {
        int roadId=0;
        double inspectArea=0;

        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT 检查总长,检查总宽,道路编号 FROM 道路设施路面损害情况 WHERE 检查编号=?;";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,inspectId);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            if(result.next())
            {
                inspectArea=result.getDouble("检查总长")*result.getDouble("检查总宽");
                roadId=result.getInt("道路编号");
            }
            else
            {
                System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");//TODO
            }

            String sqlCommand2="SELECT 损坏类型,损坏面积 FROM 损坏详情 WHERE 检查编号=?;";
            pst=connection.prepareStatement(sqlCommand2);
            pst.setInt(1,inspectId);
            pst.executeQuery();
            result=pst.getResultSet();
            while(result.next())
            {
                String damageType=result.getString("损坏类型");
                double damageArea=result.getDouble("损坏面积");

                String sqlCommand_="INSERT INTO 损坏扣分表(路面类型,损坏类型,损坏面积,损坏密度,单项扣分值,检查编号) VALUES (?,?,?,?,?,?);";
                PreparedStatement pst_=connection.prepareStatement(sqlCommand_);
                if(roadId==0)
                {
                    System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");//TODO
                }
                pst_.setString(1,Road.getRoadType(roadId));
                pst_.setString(2,damageType);
                pst_.setDouble(3,damageArea);
                if(inspectArea==0)
                    System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");//TODO
                double damageRatio=damageArea/inspectArea;
                pst_.setDouble(4,damageRatio);
                pst_.setInt(5,deduct(Road.getRoadType(roadId),damageType,damageRatio));
                pst_.setInt(6,inspectId);
                pst_.executeUpdate();
                pst_.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PQIEvaluate evaluate=new PQIEvaluate();
        evaluate.evaluate(roadId);
    }

    public static double calculateArea(
            String roadType,String damageType,double length,double wide,double high)
    {
        switch (roadType)
        {
            case "沥青":
            {
                switch (damageType)
                {
                    case "线裂":
                    {
                        if(length>=1&&wide>=0.003)
                            return length*0.2;
                        else
                            return 0;
                    }

                    case "网裂":

                    case "翻浆":

                    case "坑槽":

                    case "唧浆":

                    case "泛油": {
                        return length*wide;
                    }

                    case "龟裂":
                    {
                        if(length*wide<=1)
                            return 0;
                        else
                            return length*wide;
                    }

                    case "拥包":

                    case "车辙": {
                        if(high>=0.015)
                            return length*wide;
                        else
                            return 0;
                    }

                    case "沉陷":
                    {
                        if(high>=0.01)
                            return length*wide;
                        else
                            return 0;
                    }

                    case "剥落":
                    {
                        if(wide*length<=0.1)
                            return 0;
                        else
                            return length*wide;
                    }

                    case "啃边":
                    {
                        if(high<=0.005)
                            return 0;
                        else
                            return length*wide;
                    }

                    case "路框差":
                    {
                        if(high<=0.015)
                            return 0;
                        else
                            return 1;
                    }
                }
                System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");//TODO
                break;
            }
            case "水泥":
            {
                switch (damageType)
                {
                    case "线裂":
                    {
                        if(length>=1&&wide>=0.002)
                            return length*0.2;
                        else
                            return 0;
                    }

                    case "板角断裂":
                    case "拱胀":
                    case "表面裂纹":
                    case "层状剥落":
                    case "边角剥落":
                    case "交叉裂缝和破碎板":
                    case "边角裂缝": {
                        return length*wide;
                    }

                    case "接缝料损坏":
                    {
                        if(high>=0.005)
                            return length*1;
                        else
                            return 0;
                    }

                    case "坑洞":
                    {
                        if(length>=0.025&&high>=0.012)
                            return length*wide;
                        else
                            return 0;
                    }

                    case "错台":
                    {
                        if(high>=0.015)
                            return length*1;
                        else
                            return 0;
                    }

                    case "唧浆":
                    {
                        return length*1;
                    }

                    case "路框差":
                    {
                        if(high>=0.015)
                            return 1;
                        else
                            return 0;
                    }

                    case "沉陷":
                    {
                        if(high>=0.01)
                            return length*wide;
                        else
                            return 0;
                    }
                }
                break;
            }
        }
        return 0;
    }

    public static void inspect(LinkedHashMap<String,String> inspection,
                               ArrayList<LinkedHashMap<String,String>> damage)
                                    throws SQLException
    {
        int id;
        int roadId;
        Date date=new Date();
        SimpleDateFormat spDate=new SimpleDateFormat("yyyy-MM-dd");

        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="INSERT INTO 道路设施路面损害情况(日期,检查人员,道路编号,起止位置,检查总长,检查总宽)" +
                " VALUES (?,?,?,?,?,?);";
        pst=connection.prepareStatement(sqlCommand);
        pst.setString(1, spDate.format(date));
        pst.setString(2,inspection.get("检查人员"));
        pst.setInt(3,Integer.parseInt(inspection.get("道路编号")));
        roadId=Integer.parseInt(inspection.get("道路编号"));
        pst.setString(4,inspection.get("起止位置"));
        pst.setDouble(5,Double.parseDouble(inspection.get("检查总长")));
        pst.setDouble(6,Double.parseDouble(inspection.get("检查总宽")));
        pst.executeUpdate();

        sqlCommand="select 检查编号 FROM 道路设施路面损害情况 WHERE 日期=? AND 道路编号=?;";
        pst=connection.prepareStatement(sqlCommand);
        pst.setString(1,spDate.format(date));
        pst.setInt(2,Integer.parseInt(inspection.get("道路编号")));
        pst.executeQuery();
        ResultSet result=pst.getResultSet();
        if(result.next())
        {
            id=result.getInt("检查编号");
            for (LinkedHashMap<String, String> stringStringLinkedHashMap : damage) {
                double damageLength = Double.parseDouble(stringStringLinkedHashMap.get("损坏长"));
                double damageWide = Double.parseDouble(stringStringLinkedHashMap.get("损坏宽"));
                double damageHigh = Double.parseDouble(stringStringLinkedHashMap.get("损坏高"));
                String sqlCommand1 = "INSERT INTO 损坏详情 (" +
                        "检查编号,损坏类型,损坏长,损坏宽,损坏高,损坏面积,损坏位置及损坏情况描述)" +
                        " VALUES (?,?,?,?,?,?,?);";
                pst = connection.prepareStatement(sqlCommand1);
                pst.setInt(1, id);
                pst.setString(2, stringStringLinkedHashMap.get("损坏类型"));
                pst.setDouble(3, damageLength);
                pst.setDouble(4, damageWide);
                pst.setDouble(5, damageHigh);
                pst.setDouble(6, calculateArea(Road.getRoadType(roadId), stringStringLinkedHashMap.get("损坏类型"),
                        damageLength, damageWide, damageHigh));
                pst.setString(7, stringStringLinkedHashMap.get("损坏位置及损坏情况描述"));
                pst.executeUpdate();
            }
            pst.close();
            connection.close();
            damageDeduct(id);
        }
    }

//    public static void main(String[] args) throws SQLException {
//        LinkedHashMap<String,String> inspection = new LinkedHashMap<>();
//        ArrayList<LinkedHashMap<String,String>> damages = new ArrayList<>();
//        LinkedHashMap<String,String> damage = new LinkedHashMap<>();
////        inspection.put("检查编号","123456");
//        inspection.put("日期","2020-12-14");
//        inspection.put("检查人员","刘旭");
//        inspection.put("道路编号","615487");
//        inspection.put("检查总长","20");
//        inspection.put("检查总宽","6");
//
//        damage.put("损坏类型","坑洞");
//        damage.put("损坏长","13");
//        damage.put("损坏宽","1.6");
//        damage.put("损坏高","0.1");
//        damages.add(damage);
//        inspect(inspection,damages);
//    }
}

