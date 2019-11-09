package Helpers;

import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserHelper {

    private static String sql = null;
    private static ResultSet res = null;
    private static PreparedStatement ps = null;

    public UserHelper() {
    }

    // Adding new user record
    public static boolean addUser(User user) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "INSERT INTO users (email, role, first_name, last_name, avatar, gender, address, contact, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getRole());
            ps.setString(3, user.getFirstName());
            ps.setString(4, user.getLastName());
            ps.setString(5, user.getAvatar());
            ps.setString(6, user.getGender());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getContact());
            ps.setString(9, user.getPassword());

            int query = ps.executeUpdate();

            if (query == 1) {
                return true;
            } else {
                return false;
            }
        }

        return false;
    }

    // Updating existing user record
    public static boolean updateUser(User user) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "UPDATE users SET role=?, first_name=?, last_name=?, avatar=?, gender=?, address=?, contact=?, password=? WHERE users.id =?";
            ps = con.prepareStatement(sql);

            ps.setString(1, user.getRole());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getAvatar());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getContact());
            ps.setString(8, user.getPassword());
            ps.setInt(9, user.getId());

            int query = ps.executeUpdate();

            if (query == 1) {
                return true;
            } else {
                return false;
            }
        }

        return false;
    }

    // Deleting existing user record
    public static boolean deleteUser(User user) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "DELETE FROM users WHERE id= ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user.getId());

            int query = ps.executeUpdate();

            if (query == 1) {
                return true;
            } else {
                return false;
            }
        }

        return false;
    }

    // Displaying all user records according to the role type
    public static ArrayList<User> displayUsers(User u) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "SELECT id, email, role, first_name, last_name, avatar, gender, address, contact, registered_date FROM users WHERE role = ?";

            ps = con.prepareStatement(sql);
            ps.setString(1, u.getRole());
            res = ps.executeQuery();

            ArrayList<User> UserArrayList = new ArrayList<User>();

            while (res.next()) {

                User user = new User();

                user.setId(res.getInt("id"));
                user.setEmail(res.getString("email"));
                user.setRole(res.getString("role"));
                user.setFirstName(res.getString("first_name"));
                user.setLastName(res.getString("last_name"));
                user.setAvatar(res.getString("avatar"));
                user.setGender(res.getString("gender"));
                user.setAddress(res.getString("address"));
                user.setContact(res.getString("contact"));
                user.setRegisteredOn(res.getDate("registered_date"));

                UserArrayList.add(user);
            }

            return UserArrayList;

        }

        return null;
    }

    // Displaying single user record
    public static ArrayList<User> displayUser(User u) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "SELECT id, email, role, first_name, last_name, avatar, gender, address, contact, registered_date FROM users WHERE email = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getEmail());
            res = ps.executeQuery();

            ArrayList<User> UserArrayList = new ArrayList<User>();

            while (res.next()) {

                User user = new User();

                user.setId(res.getInt("id"));
                user.setEmail(res.getString("email"));
                user.setRole(res.getString("role"));
                user.setFirstName(res.getString("first_name"));
                user.setLastName(res.getString("last_name"));
                user.setAvatar(res.getString("avatar"));
                user.setGender(res.getString("gender"));
                user.setAddress(res.getString("address"));
                user.setContact(res.getString("contact"));
                user.setRegisteredOn(res.getDate("registered_date"));

                UserArrayList.add(user);
            }

            return UserArrayList;
        }

        return null;
    }
}
