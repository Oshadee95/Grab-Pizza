package Helpers;

import Models.Menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MenuHelper {

    private static String sql = null;
    private static ResultSet res = null;
    private static PreparedStatement ps = null;

    // Displaying all menus
    public static ArrayList<Menu> displayMenus() throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "SELECT id, pizza, image, description, ingredients, sm, md, lg FROM menus";

            ps = con.prepareStatement(sql);
            res = ps.executeQuery();

            ArrayList<Menu> MenuArrayList = new ArrayList<Menu>();

            while (res.next()) {

                Menu menu = new Menu();

                menu.setId(res.getInt("id"));
                menu.setName(res.getString("pizza"));
                menu.setImage(res.getString("image"));
                menu.setDescription(res.getString("description"));
                menu.setIngredients(res.getString("ingredients"));
                menu.setSmallSizePrice(res.getDouble("sm"));
                menu.setMediumSizePrice(res.getDouble("md"));
                menu.setLargeSizePrice(res.getDouble("lg"));

                MenuArrayList.add(menu);
            }

            return MenuArrayList;

        }

        return null;
    }

    // Displaying single menu
    public static ArrayList<Menu> displayMenu(Menu m) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "SELECT id, pizza, image, description, ingredients, sm, md, lg FROM menus WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, m.getId());
            res = ps.executeQuery();

            ArrayList<Menu> MenuArrayList = new ArrayList<Menu>();

            while (res.next()) {

                Menu menu = new Menu();

                menu.setId(res.getInt("id"));
                menu.setName(res.getString("pizza"));
                menu.setImage(res.getString("image"));
                menu.setDescription(res.getString("description"));
                menu.setIngredients(res.getString("ingredients"));
                menu.setSmallSizePrice(res.getDouble("sm"));
                menu.setMediumSizePrice(res.getDouble("md"));
                menu.setLargeSizePrice(res.getDouble("lg"));

                MenuArrayList.add(menu);
            }

            return MenuArrayList;
        }

        return null;
    }

}
