package team.toe.rmis.dao;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.sql.Statement;

import java.sql.*;

/*
        Connection connection=DbConnect.getConnection();
        PreparedStatement pst=null;
        String sqlCommand="";
        try
        {
            pst=connection.prepareStatement(sqlCommand);
            //pst.executeQuery();
            //ResultSet result=pst.getResultSet();
            //while(result.next()){}

            pst.executeUpdate();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
*/

/*
        Date date=new Date();
        SimpleDateFormat spDate=new SimpleDateFormat("yyyy");
        System.out.println(spDate.format(date));
*/

//INSERT INTO table_name ( field1, field2,...fieldN ) VALUES(?,?,?);
//DELETE FROM table_name [WHERE Clause]
//SELECT column_name,column_name FROM table_name WHERE Clause

public class DbConnect {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://47.98.248.28:3306/RMIS?useSSL=false&serverTimezone=UTC&characterEncoding=utf-8";
    //这里是MySQL8.0以上的写法

    static final String USER = "mrliux";//USERNSME填写连接用户的用户名
    static final String PASS = "021214";//这里的PASSWORD当然就是填写密码

    Connection conn = null;
    Statement stmt = null;

    public static Connection getConnection()
    {
        Connection connection=null;
        try
        {
            Class.forName(JDBC_DRIVER);//加载驱动
            connection= DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("连接数据库出现问题");
            e.printStackTrace();
        }
        return connection;
    }
}
