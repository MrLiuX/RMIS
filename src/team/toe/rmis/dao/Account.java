package team.toe.rmis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class Account {
    public static void addAccount(String account,String password,String name,String level)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
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
        PreparedStatement pst;
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

    public static LinkedHashMap<String,String> selectAccountOfName(String name)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        LinkedHashMap<String,String> account = new LinkedHashMap<>();
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

    public static LinkedHashMap<String,String> selectAccountOfAccount(String _account)
    {
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        LinkedHashMap<String,String> account = new LinkedHashMap<>();
        String sqlCommand="SELECT * FROM 系统人员 WHERE 账号=?";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.setString(1,_account);
            pst.executeQuery();
            ResultSet resultSet=pst.getResultSet();
            if (!resultSet.next()) {
                account.put("账号","账号不存在");
            } else {
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

    public static boolean isExist(String account)
    {
        LinkedHashMap<String,String> person=selectAccountOfAccount(account);
        if(person.get("账号").equals("账号不存在"))
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    public static boolean matching(String account,String password)
    {
        LinkedHashMap<String,String> personnel;
        personnel = selectAccountOfAccount(account);
        return password.equals(personnel.get("密码"));
    }

    public static boolean isAdmin(String account)
    {
        LinkedHashMap<String,String> personnel=selectAccountOfAccount(account);
        return personnel.get("账户等级").equals("管理员");
    }

    public static ArrayList<LinkedHashMap<String,String>> getAllAccount()
    {
        ArrayList<LinkedHashMap<String,String>> accounts= new ArrayList<>();
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst;
        String sqlCommand="SELECT * FROM 系统人员";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            pst.executeQuery();
            ResultSet result=pst.getResultSet();
            while(result.next()){
                LinkedHashMap<String,String> account= new LinkedHashMap<>();
                account.put("账号",result.getString("账号"));
                account.put("密码",result.getString("密码"));
                account.put("姓名",result.getString("姓名"));
                account.put("账户等级",result.getString("账户等级"));
                accounts.add(account);
            }
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }
}
