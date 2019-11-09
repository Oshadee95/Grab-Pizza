package Helpers;

import Models.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookingHelper {

    private static String sql = null;
    private static ResultSet res = null;
    private static PreparedStatement ps = null;

    // Adding new booking record
    public static boolean addBooking(Booking booking) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "INSERT INTO bookings (order_details, order_status, order_cost, delivery_time, additional_info, booked_by, delivery_add) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, booking.getOrder_details());
            ps.setString(2, booking.getOrderStatus());
            ps.setDouble(3, booking.getOrderCost());
            ps.setTime(4, booking.getTime());
            ps.setString(5, booking.getAddtionalInfo());
            ps.setString(6, booking.getBookedBy());
            ps.setString(7, booking.getDeliveryAddress());

            int query = ps.executeUpdate();

            if (query == 1) {
                return true;
            } else {
                return false;
            }
        }

        return false;
    }

    // Updating existing booking record
    public static boolean updateBooking(Booking booking) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "UPDATE bookings SET confirmed_by=?, delivered_by=? WHERE bookings.id=?";
            ps = con.prepareStatement(sql);
            
            ps.setString(1, booking.getConfirmedBy());
            ps.setString(2, booking.getDeliveredBy());
            ps.setInt(3, booking.getId());

            int query = ps.executeUpdate();

            if (query == 1) {
                return true;
            } else {
                return false;
            }
        }

        return false;
    }

    // Deleting existing booking record
    public static boolean deleteBooking(Booking booking) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "DELETE FROM bookings WHERE id= ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, booking.getId());

            int query = ps.executeUpdate();

            if (query == 1) {
                return true;
            } else {
                return false;
            }
        }

        return false;
    }

    // Displaying all booking records
    public static ArrayList<Booking> displayBookings() throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "SELECT id, order_details, order_status, order_cost, delivery_time, additional_info, booked_on, booked_by, confirmed_by, delivery_add, delivered_by FROM bookings";

            ps = con.prepareStatement(sql);
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

    // Displaying single User record
    public static ArrayList<Booking> displayBooking(Booking b) throws SQLException, ClassNotFoundException {

        if (DBHelper.getInstance() != null) {

            Connection con = DBHelper.getConnction();

            sql = "SELECT id, order_details, order_status, order_cost, delivery_time, additional_info, booked_on, booked_by, confirmed_by, delivery_add, delivered_by FROM bookings WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, b.getId());
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
}
