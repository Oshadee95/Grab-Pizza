/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helpers;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

/**
 *

 */
public class DBHelper {

    private static DBHelper sc;
    private static Connection con;
    private static String url = "jdbc:mysql://localhost/";
    private static String dbname = "grab_pizza";
    private static String username = "root";
    private static String password = "";

    private DBHelper() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url + dbname, username, password);
    }

    public static DBHelper getInstance() throws ClassNotFoundException, SQLException {
        if (sc == null) {
            sc = new DBHelper();
            return sc;
        } else {
            return sc;
        }
    }

    public static Connection getConnction() {
        return con;
    }

}
