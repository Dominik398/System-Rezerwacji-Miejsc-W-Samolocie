import javax.swing.*;
import java.sql.Array;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

public class JDBCBookFlight extends JDBCMain{
    public void setSelectBoxes(String Code, JComboBox<String> box) {
        Connection connection = null;
        int seats = Integer.parseInt(Code.substring(Code.length()-2));

        boolean[][] seatsTable = new boolean[seats/10][10];

        for (int i = 0; i < (seats/10); i++){
            for (int j = 0; j < 10; j++){
                seatsTable[i][j] = true;
            }
        }

        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            ResultSet resultSet;
            resultSet = statement.executeQuery("SELECT flights.Code, reservations.SeatCol, reservations.SeatRow " +
                    "FROM flights INNER JOIN reservations on flights.FlightID = reservations.FlightID " +
                    "where flights.Code like '" + Code + "'");
            while (resultSet.next()){
                seatsTable[resultSet.getInt("SeatCol")][resultSet.getInt("SeatRow")] = false;
            }

            ArrayList<String> modelList = new ArrayList<String>();
            for (int i = 0; i < (seats/10); i++){
                for (int j = 0; j < 10; j++){
                    if (seatsTable[i][j]) modelList.add(String.valueOf(i) + ", " + String.valueOf(j));
                }
            }
            DefaultComboBoxModel<String> model = new DefaultComboBoxModel<String>(modelList.toArray(new String[0]));
            box.setModel(model);
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }
    public boolean doesSocialIDExist(String SocialID){
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            ResultSet resultSet;
            resultSet = statement.executeQuery("SELECT clients.IDSocial from clients " +
                    "where clients.IDSocial like '" + SocialID + "'");
            if (resultSet.isBeforeFirst()) return true;
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
        return false;
    }
    public boolean doesDataMatch(String SocialID, String name, String surname, String age, String insuranceProvider,
                                     String date, String insuranceCode){
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            String query = "";

            if (!insuranceCode.isEmpty()){
                query = "SELECT clients.IDSocial from clients " +
                        "where clients.IDSocial like '" + SocialID + "' " +
                        "and clients.Name like '" + name + "' " +
                        "and clients.Surname like '" + surname + "' " +
                        "and clients.Age like '" + age + "' " +
                        "and clients.InsuranceProvider like '" + insuranceProvider + "'" +
                        "and clients.InsuranceExpirationDate like '" + date + "' " +
                        "and clients.InsuranceCode like '"  + insuranceCode +  "'";
            } else {
                query = "SELECT clients.IDSocial from clients " +
                        "where clients.IDSocial like '" + SocialID + "' " +
                        "and clients.Name like '" + name + "' " +
                        "and clients.Surname like '" + surname + "' " +
                        "and clients.Age like '" + age + "' " +
                        "and clients.InsuranceProvider is null " +
                        "and clients.InsuranceExpirationDate is null " +
                        "and clients.InsuranceCode is null";
            }
            ResultSet resultSet;
            resultSet = statement.executeQuery(query);
            if (resultSet.isBeforeFirst()) {
                return true;
            }
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
        return false;
    }
    public void bookFlight(String SocialID, String Code, String col, String row){
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO reservations(ReservationID, FlightID, ClientID, SeatCol, SeatRow) " +
                    "VALUES (NULL, " +
                    "       (SELECT flights.FlightID from flights where flights.Code like '" + Code + "'), " +
                    "       (SELECT clients.ClientID from clients where clients.IDSocial like '" + SocialID + "'), " +
                    "       '" + col + "', " +
                    "       '" + row + "')");
        } catch (Exception e) {
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }

    public void addPasengerToDB(String SocialID, String name, String surname, String age, String insuranceProvider,
                                String date, String insuranceCode){
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            String query = "";
            if (insuranceProvider.isEmpty()) {
                query = "INSERT INTO clients " +
                        "(ClientID, IDSocial, Name, Surname, Age, InsuranceProvider, InsuranceExpirationDate, InsuranceCode) VALUES " +
                        "(NULL, " +
                        "'" + SocialID + "', " +
                        "'" + name + "', " +
                        "'" + surname + "', " +
                        "'" + age + "', " +
                        "NULL, " +
                        "NULL, " +
                        "NULL)";
            } else {
                query = "INSERT INTO clients " +
                        "(ClientID, IDSocial, Name, Surname, Age, InsuranceProvider, InsuranceExpirationDate, InsuranceCode) VALUES " +
                        "(NULL, " +
                        "'" + SocialID + "', " +
                        "'" + name + "', " +
                        "'" + surname + "', " +
                        "'" + age + "', " +
                        "'" + insuranceProvider + "', " +
                        "'" + date + "', " +
                        "'" + insuranceCode + "')";
            }
            statement.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }
    public double getPrice(String Code){
        double price = 0;
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            ResultSet resultSet;
            resultSet = statement.executeQuery("SELECT flights.Price FROM flights where flights.Code like '"+ Code +"'");
            if (resultSet.next()){
                price = resultSet.getDouble("Price");
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
        return price;
    }
    public boolean checkIfFlightHappened(String Code){
        boolean happened = true;
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            ResultSet resultSet;
            Calendar calendar = Calendar.getInstance();
            int day = calendar.get(Calendar.DAY_OF_MONTH);
            int month = calendar.get(Calendar.MONTH) + 1;
            int year = calendar.get(Calendar.YEAR);
            int hour = calendar.get(Calendar.HOUR_OF_DAY);
            int minute = calendar.get(Calendar.MINUTE);

            resultSet = statement.executeQuery("SELECT * FROM flights " +
                    "where Code like '" + Code + "' " +
                    "and Date >= '"+year+"-"+month+"-"+day+"' " +
                    "and Time > '"+hour+":"+minute+"'");
            if (resultSet.isBeforeFirst()){
                happened = false;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
            return false;
        } finally {
            super.closeConnectionToDB(connection);
        }
        return happened;
    }

}
