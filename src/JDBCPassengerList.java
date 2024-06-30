import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCPassengerList extends JDBCMain{
    public void setTable(JTable table, String code) {
        DefaultTableModel tableModel = new DefaultTableModel();
        tableModel.addColumn("ID Rezerwacji");
        tableModel.addColumn("Kod");
        tableModel.addColumn("Nazwisko");
        tableModel.addColumn("Kolumna");
        tableModel.addColumn("Rząd");
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();

            //Queries
            String mainQuery = "SELECT reservations.ReservationID, flights.Code, clients.Surname, reservations.SeatCol, reservations.SeatRow " +
                    "FROM reservations " +
                    "inner join flights on flights.FlightID = reservations.FlightID " +
                    "inner join clients on clients.ClientID = reservations.ClientID " +
                    "where flights.Code like '" + code + "' ORDER BY reservations.ReservationID ASC; ";
            ResultSet resultSet;
            resultSet = statement.executeQuery(mainQuery);
            if (!resultSet.isBeforeFirst()) JOptionPane.showMessageDialog (null,
                    "UWAGA: Ta lista jest pusta.", "Pusta lista", JOptionPane.WARNING_MESSAGE);
            String[] row;
            while(resultSet.next()){
                row = new String[] {
                        resultSet.getString("ReservationID"),
                        resultSet.getString("Code"),
                        resultSet.getString("Surname"),
                        resultSet.getString("SeatCol"),
                        resultSet.getString("SeatRow"),

                };
                tableModel.addRow(row);
            }
            table.setModel(tableModel);
        } catch (ArrayIndexOutOfBoundsException ex){
            System.out.println("Error out of bounds: " + ex);
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }
    public void removePassenger(String reservationID){
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();

            statement.executeUpdate("DELETE FROM reservations WHERE ReservationID='" + reservationID + "'");
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }
    public int[] getDates(String ReservationID){
        Connection connection = null;
        int[] dates = new int[3];
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();

            ResultSet resultSet;
            resultSet = statement.executeQuery("select date_format(flights.date, '%d') as day, " +
                    "date_format(flights.date, '%m') as month, " +
                    "date_format(flights.date, '%Y') as year " +
                    "FROM flights where flights.FlightID = (SELECT reservations.FlightID FROM reservations " +
                    "where reservations.ReservationID = '" + ReservationID + "');");

            if (resultSet.next()){
                dates[0] = resultSet.getInt("day");
                dates[1] = resultSet.getInt("month");
                dates[2] = resultSet.getInt("year");
            }
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
        return dates;
    }
}
