import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

public class JDBCFlightSelection extends JDBCMain{

    public void setLocations(JComboBox<String> box, boolean isStart){
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();
            String startLocations = "SELECT DISTINCT StartLocation from flights order by StartLocation asc";
            String finishLocations = "SELECT DISTINCT FinishLocation from flights order by FinishLocation asc";
            ResultSet resultSet = (isStart) ? statement.executeQuery(startLocations) : statement.executeQuery(finishLocations);
            ArrayList<String> set = new ArrayList<String>();
            set.add("");
            while (resultSet.next()){
                set.add(resultSet.getString(1));
            }
            String[] comboboxModel = set.toArray(new String[0]);
            DefaultComboBoxModel<String> model = new DefaultComboBoxModel<>(comboboxModel);
            box.setModel(model);
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }
    public void setTable(JTable table){
        setTable(table, true, "", "", false, "", "", "");
    }
    public void setTable(JTable table, boolean isIgnoreDate, String startDate, String FinishDate, boolean isShowFull,
                         String startLocation, String finishLocation, String codeInput) {
        DefaultTableModel tableModel = new DefaultTableModel();
        tableModel.addColumn("Kod");
        tableModel.addColumn("Start");
        tableModel.addColumn("Cel");
        tableModel.addColumn("Data wylotu");
        tableModel.addColumn("Wolne Miejsca");
        tableModel.addColumn("Wszystkie Miejsca");

        //Hidden
        tableModel.addColumn("CountryStart");
        tableModel.addColumn("CountryFinish");
        tableModel.addColumn("DbID");
        Connection connection = null;
        try {
            connection = super.connectToDB();
            Statement statement = connection.createStatement();

            //Queries
            String mainQuery = "select flights.FlightID, Code, StartCountry, StartLocation, FinishLocation, FinishCountry, " +
                    "date_format(Date,'%d-%m-%Y') as date, date_format(Time,'%H:%i') as time, TotalSeats, " +
                    "Count(reservations.FlightID) as SeatsTaken from flights " +
                    "LEFT join reservations on flights.FlightID = reservations.FlightID ";

            mainQuery = mainQuery + " where Code is not null and ";
            if (!isIgnoreDate) mainQuery = mainQuery + " Date >= '" + startDate + "' and Date <= '" + FinishDate + "' and ";
            if (!(startLocation.isEmpty())) mainQuery = mainQuery + " StartLocation like '" + startLocation + "' and ";
            if (!(finishLocation.isEmpty()))  mainQuery = mainQuery + " FinishLocation like '" + finishLocation + "' and ";
            if (!(codeInput.isEmpty())) mainQuery = mainQuery + " Code like '"+ codeInput +"' and ";

            mainQuery = mainQuery + " flights.FlightID is not null GROUP BY flights.FlightID ";
            if (!isShowFull) mainQuery = mainQuery + " HAVING Count(reservations.FlightID) != flights.TotalSeats ";

            ResultSet resultSet;
            resultSet = statement.executeQuery(mainQuery);

            String[] row;
            while(resultSet.next()){
                row = new String[] {
                        resultSet.getString("Code"),
                        resultSet.getString("StartLocation"),
                        resultSet.getString("FinishLocation"),
                        resultSet.getString("date") + " " + resultSet.getString("time"),
                        String.valueOf(resultSet.getInt("TotalSeats") - resultSet.getInt("SeatsTaken")),
                        resultSet.getString("TotalSeats"),
                        resultSet.getString("StartCountry"),
                        resultSet.getString("FinishCountry"),
                        resultSet.getString("FlightID")
                };
                tableModel.addRow(row);
            }
            table.setModel(tableModel);
            TableColumnModel colModel = table.getColumnModel();
            colModel.getColumn(6).setMinWidth(0);
            colModel.getColumn(6).setMaxWidth(0);
            colModel.getColumn(6).setWidth(0);
            colModel.getColumn(7).setMinWidth(0);
            colModel.getColumn(7).setMaxWidth(0);
            colModel.getColumn(7).setWidth(0);
            colModel.getColumn(8).setMinWidth(0);
            colModel.getColumn(8).setMaxWidth(0);
            colModel.getColumn(8).setWidth(0);
        } catch (ArrayIndexOutOfBoundsException ex){
            System.out.println("Error out of bounds: " + ex);
        } catch (Exception e){
            System.out.println("Error: " + e);
        } finally {
            super.closeConnectionToDB(connection);
        }
    }
}
