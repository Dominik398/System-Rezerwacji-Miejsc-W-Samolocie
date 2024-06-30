import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Calendar;

public class PassengerInfo extends JFrame{
    private JPanel MainPanel;
    private JLabel NameAndSurname;
    private JLabel SocialID;
    private JLabel Age;
    private JLabel InsuranceProvider;
    private JLabel InsuranceExpiration;
    private JLabel InsuranceCode;
    private JButton CloseButton;
    private JLabel InsuranceActive;
    private JTable PassengerFlightsTable;

    public PassengerInfo(String ReservationID){
        super("Informacje");
        this.setContentPane(this.MainPanel);
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        int width = 800; int height = 800; // 720
        this.setSize(width, height);
        this.setLocationRelativeTo(null);

        // Icon source: https://www.iconfinder.com/icons/2530820/airplane_airplane_mode_general_office_plane_transport_travel_icon
        // Icon author link1: https://www.iconfinder.com/korawan_m
        // Icon author link2: BomSymbols https://creativemarket.com/BomSymbols
        ImageIcon icon = new ImageIcon("src/icon.png");
        super.setIconImage(icon.getImage());

        JDBCPassengerInfo jdbcPassengerInfo = new JDBCPassengerInfo();

        String passengerID =  jdbcPassengerInfo.getPassengerID(ReservationID);

        String[] passengerData = {"", "", "", "", "", "", ""};
        jdbcPassengerInfo.fillPassengerData(passengerData, passengerID);

        //insurance check
        boolean hasInsuranceExpired = false;
        boolean hasInsurance = true;
        Calendar calendar = Calendar.getInstance();
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        int month = calendar.get(Calendar.MONTH);
        int year = calendar.get(Calendar.YEAR);
        if (!passengerData[5].isEmpty()) {
            int InsuranceExpirationDay = Integer.parseInt(passengerData[5].substring(0, 2));
            int InsuranceExpirationMonth = Integer.parseInt(passengerData[5].substring(3, 5));
            int InsuranceExpirationYear = Integer.parseInt(passengerData[5].substring(6));

            if((year > InsuranceExpirationYear) ||
               ((year == InsuranceExpirationYear) && ((month-1) > InsuranceExpirationMonth)) ||
               ((year == InsuranceExpirationYear) && ((month-1) == InsuranceExpirationMonth) && (day > InsuranceExpirationDay))){
                hasInsuranceExpired = true;
            }
        } else {
            hasInsurance = false;
        }

        NameAndSurname.setText("Imie i nazwisko: "+passengerData[0]+" "+passengerData[1]);
        SocialID.setText("Pesel: " + passengerData[2]);
        Age.setText("Wiek: " + passengerData[3]);

        if (hasInsurance) {
            if (!hasInsuranceExpired) {
                InsuranceActive.setText("<html><p style = \"color:green;\">Ubezpieczenie aktywne!</p></html>");
            } else {
                InsuranceActive.setText("<html><p style = \"color:red;\">Ubezpieczenie wygasło!</p></html>");
            }
            InsuranceProvider.setText("Ubezpieczyciel: " + passengerData[4]);
            InsuranceExpiration.setText("Wygasa: " + passengerData[5]);
            InsuranceCode.setText("Numer ubezpieczenia: " + passengerData[6]);
        } else {
            InsuranceActive.setText("<html><p style = \"color:gray;\">Brak ubezpieczenia!</p></html>");
            InsuranceProvider.setText("");
            InsuranceExpiration.setText("");
            InsuranceCode.setText("");
        }

        jdbcPassengerInfo.setTable(PassengerFlightsTable, passengerID);
        PassengerFlightsTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        PassengerFlightsTable.setDefaultEditor(Object.class, null);
        CloseButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dispose();
            }
        });
    }
}
