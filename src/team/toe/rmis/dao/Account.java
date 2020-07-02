package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;

public class Account {
    public static void addAccount(String account,String password,String name,String level)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="INSERT INTO 系统人员(账号,密码,姓名,账户等级) VALUES(?,?,?,?);";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,account);
            pst.setString(2,password);
            pst.setString(3,name);
            pst.setString(4,level);
            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deletedAccount(String accountOrName)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="DELETE FROM 系统人员 WHERE 账号=? ;";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,accountOrName);
            pst.executeUpdate();

            sqlCommand="DELETE FROM 系统人员 WHERE 姓名=? ;";
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,accountOrName);
            pst.executeUpdate();

            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static LinkedHashMap selectAccountOfName(String name)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        LinkedHashMap<String,String> account = new LinkedHashMap<String,String>();
        String sqlCommand="SELECT * FROM 系统人员 WHERE 姓名=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,name);
            pst.executeQuery();
            ResultSet resultSet=pst.getResultSet();
            while(resultSet.next())
            {
                account.put("账号",resultSet.getString("账号"));
                account.put("密码",resultSet.getString("密码"));
                account.put("姓名",resultSet.getString("姓名"));
                account.put("账户等级",resultSet.getString("账户等级"));
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public static LinkedHashMap selectAccountOfAccount(String _account)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        LinkedHashMap<String,String> account = new LinkedHashMap<String,String>();
        String sqlCommand="SELECT * FROM 系统人员 WHERE 账号=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,_account);
            pst.executeQuery();
            ResultSet resultSet=pst.getResultSet();
            while(resultSet.next())
            {
                account.put("账号",resultSet.getString("账号"));
                account.put("密码",resultSet.getString("密码"));
                account.put("姓名",resultSet.getString("姓名"));
                account.put("账户等级",resultSet.getString("账户等级"));
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public static boolean matching(String account,String password)
    {
        LinkedHashMap<String,String> personnel=selectAccountOfAccount(account);
        if(password==personnel.get("密码"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static boolean isAdmin(String account)
    {
        LinkedHashMap<String,String> personnel=selectAccountOfAccount(account);
        if(personnel.get("账户等级")=="管理员")
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
