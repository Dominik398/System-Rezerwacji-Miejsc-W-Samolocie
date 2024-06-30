import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCPassengerInfo extends JDBCMain{
    public String getPassengerID(String reservationID) {
        Connection connection = null;
        String result = "";
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            ResultSet resultSet;
            resultSet = statement.executeQuery("SELECT reservations.ClientID from reservations " +
                    "where reservations.ReservationID like '" + reservationID + "'");
            if (resultSet.next()) result = resultSet.getString("ClientID");
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
        return result;
    }
    public void fillPassengerData(String[] passengerData, String clientID){
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            ResultSet resultSet;
            resultSet = statement.executeQuery("select Name, Surname, IDSocial, Age, " +
                    "InsuranceProvider, date_format(InsuranceExpirationDate,'%d-%m-%Y') as InsuranceExpiration, InsuranceCode " +
                    "from clients where ClientID like '"+ clientID +"'");

            if (resultSet.next()) {
                passengerData[0] = resultSet.getString("Name");
                passengerData[1] = resultSet.getString("Surname");
                passengerData[2] = resultSet.getString("IDSocial");
                passengerData[3] = resultSet.getString("Age");
                passengerData[4] = resultSet.getString("InsuranceProvider");
                passengerData[5] = resultSet.getString("InsuranceExpiration");
                passengerData[6] = resultSet.getString("InsuranceCode");

                if(passengerData[4] == null) {
                    passengerData[4] = "";
                    passengerData[5] = "";
                    passengerData[6] = "";
                }
            }
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }
    public void setTable(JTable table, String clientID){
        DefaultTableModel tableModel = new DefaultTableModel();
        tableModel.addColumn("Kod");
        tableModel.addColumn("Start");
        tableModel.addColumn("Cel");
        tableModel.addColumn("Data");

        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();

            ResultSet resultSet;
            resultSet = statement.executeQuery("select distinct flights.Code, flights.StartLocation, " +
                    "flights.FinishLocation, flights.Date from flights " +
                    "INNER JOIN reservations on flights.FlightID = reservations.FlightID " +
                    "where reservations.ClientID like '" + clientID + "';");

            String[] row;
            while(resultSet.next()){
                row = new String[] {
                        resultSet.getString("Code"),
                        resultSet.getString("StartLocation"),
                        resultSet.getString("FinishLocation"),
                        resultSet.getString("Date")
                };
                tableModel.addRow(row);
            }
            table.setModel(tableModel);
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }
}
