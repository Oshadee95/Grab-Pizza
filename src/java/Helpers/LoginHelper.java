package Helpers;

import Models.Login;
import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginHelper {

    private static String sql = null;
    private static ResultSet res = null;
    private static PreparedStatement ps = null;

    // Default Constructor
    public LoginHelper() {
    }

    public static ArrayList<User> validateUser(Login login) throws ClassNotFoundException, SQLException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "SELECT COUNT(*) AS count FROM users WHERE email=? AND password =?";
            ps = con.prepareStatement(sql);
            ps.setString(1, login.getEmail());
            ps.setString(2, login.getPassword());

            res = ps.executeQuery();

            int rowCount = 0;

            while (res.next()) {
                rowCount = res.getInt(1);
            }

            if (rowCount == 1) {

                User user = new User();

                user.setEmail(login.getEmail());

                return UserHelper.displayUser(user);

            } else {
                return null;
            }

        }

        return null;

    }
}
