import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Calendar;

public class FlightSelectionForm extends JFrame {
    private JPanel MainPanel;
    private JPanel ControlersPane;
    private JScrollPane TablePane;
    private JPanel SelectionPane;
    private JPanel InfoPane;
    private JTextArea CodeInput;
    private JButton SearchButton;
    private JCheckBox ShowFull;
    private JComboBox<String> StartLocation;
    private JComboBox<String> FinishLocation;
    private JButton CloseButton;
    private JTable FlightsTable;
    private JButton BookButton;
    private JButton PassengerListButton;
    private JSpinner StartDayInput;
    private JSpinner StartYearInput;
    private JComboBox<String> StartMonthInput;
    private JCheckBox IgnoreDate;
    private JSpinner FinishDayInput;
    private JSpinner FinishYearInput;
    private JComboBox<String> FinishMonthInput;
    private JLabel Icon;
    private JButton HideInfoPanelButton;
    private JLabel CodeLabel;
    private JLabel StartLabel;
    private JLabel FinishLabel;
    private JLabel DateLabel;
    private JLabel SeatsTakenLabel;
    private JLabel SeatsFreeLabel;
    private JLabel SeatsTotalLabel;
    private JLabel LeaveHourLabel;
    JDBCFlightSelection jdbcFlightSelection = new JDBCFlightSelection();
    private boolean isVis = true;
    public FlightSelectionForm(){
        super("System Rezerwacji");
        this.setContentPane(this.MainPanel);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        int width = 1280; int height = 800; // 720
        this.setSize(width, height);
        this.setLocationRelativeTo(null);

        // Icon source: https://www.iconfinder.com/icons/2530820/airplane_airplane_mode_general_office_plane_transport_travel_icon
        // Icon author link1: https://www.iconfinder.com/korawan_m
        // Icon author link2: BomSymbols https://creativemarket.com/BomSymbols
        ImageIcon icon = new ImageIcon("src/icon.png");
        Icon.setIcon(setImageIconSize(200,200,icon));
        super.setIconImage(icon.getImage());

        //Date selection setup
        Calendar calendar = Calendar.getInstance();
        double day = calendar.get(Calendar.DAY_OF_MONTH);
        int month = calendar.get(Calendar.MONTH);
        double year = calendar.get(Calendar.YEAR);
        SpinnerNumberModel spinnerNumberModelStartDay = new SpinnerNumberModel(day, 1.0, 31.0, 1.0);
        SpinnerNumberModel spinnerNumberModelFinishDay = new SpinnerNumberModel(day, 1.0, 31.0, 1.0);
        StartDayInput.setModel(spinnerNumberModelStartDay);
        FinishDayInput.setModel(spinnerNumberModelFinishDay);
        StartMonthInput.setSelectedIndex(month);
        FinishMonthInput.setSelectedIndex(month+1);
        SpinnerNumberModel spinnerNumberModelStartYear = new SpinnerNumberModel((year), 2020, (year+20), 1.0);
        SpinnerNumberModel spinnerNumberModelFinishYear = new SpinnerNumberModel((year), 2020, (year+20), 1.0);
        StartYearInput.setModel(spinnerNumberModelStartYear);
        FinishYearInput.setModel(spinnerNumberModelFinishYear);
        JSpinner.NumberEditor noMoreCommasStartYear = new JSpinner.NumberEditor(StartYearInput, "#");
        JSpinner.NumberEditor noMoreCommasFinishYear = new JSpinner.NumberEditor(FinishYearInput, "#");
        StartYearInput.setEditor(noMoreCommasStartYear);
        FinishYearInput.setEditor(noMoreCommasFinishYear);

        //Table initial setup

        jdbcFlightSelection.setTable(FlightsTable);
        FlightsTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        FlightsTable.setDefaultEditor(Object.class, null);

        //Jumbo boxes setup
        try {
            jdbcFlightSelection.setLocations(StartLocation, true);
            jdbcFlightSelection.setLocations(FinishLocation, false);
        } catch (Exception e){
            String[] comboboxModel= {""};
            DefaultComboBoxModel<String> startModel = new DefaultComboBoxModel<>(comboboxModel);
            DefaultComboBoxModel<String> finishModel = new DefaultComboBoxModel<>(comboboxModel);
            StartLocation.setModel(startModel);
            FinishLocation.setModel(finishModel);
            System.out.println("Error: " + e);
        }

        SearchButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                executeSearch();
            }
        });
        HideInfoPanelButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                InfoPane.setVisible(!isVis);
                isVis = !isVis;
                if(isVis){
                    HideInfoPanelButton.setText("<");
                } else {
                    HideInfoPanelButton.setText(">");
                }
            }
        });
        FlightsTable.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent e) {
                if(!HideInfoPanelButton.isVisible()) {
                    InfoPane.setVisible(true);
                    HideInfoPanelButton.setVisible(true);
                }
                try {
                    String flightCode = (String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 0);
                    String startLocation = (String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 1);
                    String finishLocation = (String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 2);
                    String datetimeFlight = (String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 3);
                    String dateFlight = datetimeFlight.substring(0, datetimeFlight.length()-5);
                    String timeFlight = datetimeFlight.substring(datetimeFlight.length()-5);
                    int seatsFree = Integer.parseInt((String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 4));
                    int seatsTotal = Integer.parseInt((String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 5));
                    int seatsTaken = seatsTotal - seatsFree;
                    String startCountry = (String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 6);
                    String finishCountry = (String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 7);

                    CodeLabel.setText("Kod: " + flightCode);
                    StartLabel.setText("<html>Miejsce odlotu: <br><p style=\"color:red;\">"+startLocation+", <br>"+startCountry+"</p></html>");
                    FinishLabel.setText("<html>Miejsce docelowe: <br><p style=\"color:red;\">"+finishLocation+",<br>"+finishCountry+"</p></html>");
                    DateLabel.setText("<html><p style = \" width: 150px; color:blue;\">Data odlotu: "+dateFlight+"</p></html>");
                    LeaveHourLabel.setText("Godzina odlotu: " + timeFlight);
                    SeatsTakenLabel.setText("Zajęte miejsca: " + seatsTaken);
                    SeatsFreeLabel.setText("Wolne miejsca: " + seatsFree);
                    SeatsTotalLabel.setText("Liczba miejsca: " + seatsTotal);
                } catch (Exception er) {
                    // This reacts when value in JTable changes, So I guess it triggers when Models are changed
                    // by JDBCFlightSelection.setTable() on SearchButton actionPerformed, and it can't find indices.
                    // It doesn't break the program, so for now it can stay until it causes more bugs.
                    // FIXME: Try to change JDBCFlightSelection.setTable() to remove rows instead of making new DefaultTableModel
                    System.out.println("Error in value change: " + er);
                }
            }
        });
        CloseButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Main.cleanExit();
            }
        });
        IgnoreDate.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                StartDayInput.setEnabled(!IgnoreDate.isSelected());
                StartMonthInput.setEnabled(!IgnoreDate.isSelected());
                StartYearInput.setEnabled(!IgnoreDate.isSelected());

                FinishDayInput.setEnabled(!IgnoreDate.isSelected());
                FinishMonthInput.setEnabled(!IgnoreDate.isSelected());
                FinishYearInput.setEnabled(!IgnoreDate.isSelected());
            }
        });
        PassengerListButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (FlightsTable.getSelectionModel().isSelectionEmpty()){
                    JOptionPane.showMessageDialog (null,
                            "Wybierz wiersz z listy", "Wybierz wierz", JOptionPane.WARNING_MESSAGE);
                    return;
                }

                String codeLabel = CodeLabel.getText();
                PassengerList passengerList = new PassengerList(codeLabel.substring(codeLabel.length()-12));
                passengerList.setVisible(true);
                Main.setVisibility(false);
            }
        });
        BookButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (FlightsTable.getSelectionModel().isSelectionEmpty()){
                    JOptionPane.showMessageDialog (null,
                            "Wybierz wiersz z listy", "Wybierz wierz", JOptionPane.WARNING_MESSAGE);
                    return;
                }

                int seatsAv = Integer.parseInt((String) FlightsTable.getValueAt(FlightsTable.getSelectedRow(), 4));
                if (seatsAv <= 0) {
                    JOptionPane.showMessageDialog (null, "Nie możesz zarezerwować lotu w którym " +
                            "nie ma wolnych miejsc!", "Błąd", JOptionPane.WARNING_MESSAGE);
                    return;
                }
                String codeLabel = CodeLabel.getText();
                BookFlight bookFlight = new BookFlight(codeLabel.substring(codeLabel.length()-12));
                bookFlight.setVisible(true);
                Main.setVisibility(false);
            }
        });
    }

    private ImageIcon setImageIconSize(int width, int height, ImageIcon imageicon){
        Image image = imageicon.getImage();
        Image newImage = image.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        return new ImageIcon(newImage);
    }
    public void executeSearch(){
        FlightsTable.setEnabled(false);
        int startYear = (int) Math.round((double) StartYearInput.getValue());
        int startMonth = StartMonthInput.getSelectedIndex() + 1;
        int startDay = (int)  Math.round((double) StartDayInput.getValue());

        int finishYear = (int)  Math.round((double) FinishYearInput.getValue());
        int finishMonth = FinishMonthInput.getSelectedIndex() + 1;
        int finishDay = (int)  Math.round((double) FinishDayInput.getValue());

        String startLocation = (String) StartLocation.getSelectedItem();
        String finishLocation = (String) FinishLocation.getSelectedItem();

        String startDate = startYear + "-" + startMonth + "-" + startDay;
        String finishDate = finishYear + "-" + finishMonth + "-" + finishDay;
        jdbcFlightSelection.setTable(FlightsTable, IgnoreDate.isSelected(), startDate, finishDate, ShowFull.isSelected(),
                startLocation, finishLocation, CodeInput.getText());
        FlightsTable.setEnabled(true);
    }
}
