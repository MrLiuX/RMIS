package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class Evaluate {
    public static void evaluate(int roadId,int evaluateDate_year,double index,String level,String tableName,String indexName)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="INSERT INTO "+tableName+" (道路编号,评价日期,"+indexName+",评级)"+
                " VALUES (?,?,?,?);";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.setInt(2,evaluateDate_year);
            pst.setDouble(3,index);
            pst.setString(4,level);
            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<LinkedHashMap<String, String>> getEvaluations(int roadId,String tableName,String evaluateType) {
        ArrayList<LinkedHashMap<String,String>> evaluations= new ArrayList<>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT * FROM "+tableName+" WHERE 道路编号=?;";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            while(result.next()){
                LinkedHashMap<String,String> evaluation= new LinkedHashMap<>();
                evaluation.put("道路编号",String.valueOf(result.getInt("道路编号")));
                evaluation.put("评价日期",String.valueOf(result.getInt("评价日期")));
                evaluation.put(evaluateType,result.getString(evaluateType));
                evaluation.put("评级",result.getString("评级"));
                evaluations.add(evaluation);
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return evaluations;
    }

    public static LinkedHashMap<String, String> getEvaluation(int roadId,String tableName,String evaluateType,int date_year)
    {
        LinkedHashMap<String, String> evaluation = new LinkedHashMap<>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT * FROM "+tableName+" WHERE 道路编号=? AND 评价日期=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.setInt(2,date_year);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            if(result.next()){
                evaluation.put("道路编号",String.valueOf(result.getInt("道路编号")));
                evaluation.put("评价日期",String.valueOf(result.getInt("评价日期")));
                evaluation.put(evaluateType,result.getString(evaluateType));
                evaluation.put("评级",result.getString("评级"));
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return evaluation;
    }

    public static double getIRI(int roadId,String date)
    {
        double IRI = 0;
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT IRI FROM 道路路面平整度检测 WHERE 道路编号=? AND 检测日期=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.setString(2,date);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            if(result.next())
            {
                IRI=result.getDouble("IRI");
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return IRI;
    }

    public static LinkedHashMap<String,Double> getRQIAndPCI(int roadId,int date_year)
    {
        LinkedHashMap<String,Double> evaluation = new LinkedHashMap<>();
        evaluation.put("RQI",Double.valueOf(getEvaluation(roadId,"路面行驶质量评价","RQI",date_year).get("RQI")));
        evaluation.put("PCI",Double.valueOf(getEvaluation(roadId,"路面损坏状况评价","PCI",date_year).get("PCI")));
        return evaluation;
    }
}