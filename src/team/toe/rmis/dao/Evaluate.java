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

    public static ArrayList<LinkedHashMap<String, String>> getEvaluation(int roadId,String tableName,String evaluateType) {
        ArrayList<LinkedHashMap<String,String>> evaluations=new ArrayList<LinkedHashMap<String,String>>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="SELECT * FROM "+tableName+" WHERE 道路编号=?;";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setInt(1,roadId);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            while(result.next()){
                LinkedHashMap<String,String> evaluation=new LinkedHashMap<String,String>();
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
}
