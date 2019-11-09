package Helpers;

import Models.Booking;
import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DeliveryHelper {

    private static String sql = null;
    private static ResultSet res = null;
    private static PreparedStatement ps = null;

    public static ArrayList<Booking> displayDeliveries(String loggedUser) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "SELECT id, order_details, order_status, order_cost, delivery_time, additional_info, booked_on, booked_by, confirmed_by, delivery_add, delivered_by FROM bookings WHERE delivered_by = ? AND order_status = ?";

            ps = con.prepareStatement(sql);
            ps.setString(1, loggedUser);
            ps.setString(2, "unpaid");

            res = ps.executeQuery();

            ArrayList<Booking> BookingArrayList = new ArrayList<Booking>();

            while (res.next()) {

                Booking booking = new Booking();

                booking.setId(res.getInt("id"));
                booking.setOrder_details(res.getString("order_details"));
                booking.setOrderStatus(res.getString("order_status"));
                booking.setOrderCost(res.getDouble("order_cost"));
                booking.setTime(res.getTime("delivery_time"));
                booking.setAddtionalInfo(res.getString("additional_info"));
                booking.setBookedOn(res.getDate("booked_on").toString());
                booking.setBookedBy(res.getString("booked_by"));
                booking.setConfirmedBy(res.getString("confirmed_by"));
                booking.setDeliveryAddress(res.getString("delivery_add"));
                booking.setDeliveredBy(res.getString("delivered_by"));

                BookingArrayList.add(booking);
            }

            return BookingArrayList;

        }

        return null;
    }
    
    
    public static boolean updateDeliveryStatus(Booking booking) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "UPDATE bookings SET order_status=? WHERE bookings.id=?";
            ps = con.prepareStatement(sql);
            
            ps.setString(1, "paid");
            ps.setInt(2, booking.getId());

            int query = ps.executeUpdate();

            if (query == 1) {
                return true;
            } else {
                return false;
            }
        }

        return false;
    }

}
