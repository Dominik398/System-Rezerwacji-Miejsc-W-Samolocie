import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Objects;

public class BookFlight extends JFrame{
    private JPanel MainPanel;
    private JLabel InformationLabel;
    private JButton ExitButton;
    private JButton BackButton;
    private JTextField SocialIDInput;
    private JTextField NameInput;
    private JTextField SurnameInput;
    private JTextField AgeInput;
    private JTextField InsuranceProviderInput;
    private JTextField InsuranceDateInput;
    private JTextField InsuranceCodeInput;
    private JButton SendButton;
    private JButton CleanButton;
    private JComboBox<String> ColRowSelection;

    public BookFlight(String Code) {
        super("Rezerwacja");
        this.setContentPane(this.MainPanel);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        int width = 800;
        int height = 800; // 720
        this.setSize(width, height);
        this.setLocationRelativeTo(null);

        // Icon source: https://www.iconfinder.com/icons/2530820/airplane_airplane_mode_general_office_plane_transport_travel_icon
        // Icon author link1: https://www.iconfinder.com/korawan_m
        // Icon author link2: BomSymbols https://creativemarket.com/BomSymbols
        ImageIcon icon = new ImageIcon("src/icon.png");
        super.setIconImage(icon.getImage());

        JDBCBookFlight jdbcBookFlight = new JDBCBookFlight();
        String flightCode = Code;

        //set selectBox
        jdbcBookFlight.setSelectBoxes(Code, ColRowSelection);

        CleanButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                SocialIDInput.setText("");
                NameInput.setText("");
                SurnameInput.setText("");
                AgeInput.setText("");
                InsuranceProviderInput.setText("");
                InsuranceDateInput.setText("");
                InsuranceCodeInput.setText("");
            }
        });
        SendButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String socialID = SocialIDInput.getText();
                String name = NameInput.getText();
                String surname = SurnameInput.getText();
                int age;
                try {
                    age = Integer.parseInt(AgeInput.getText());
                } catch (Exception ex){
                    System.out.println("Error: " + ex);
                    InformationLabel.setText("Wiek nie jest liczbą");
                    return;
                }
                String insuranceProvider = InsuranceProviderInput.getText();
                String insuranceDate = InsuranceDateInput.getText();
                String insuranceCode = InsuranceCodeInput.getText();
                String col = ((String) Objects.requireNonNull(ColRowSelection.getSelectedItem())).substring(0,1);
                String row = ((String) Objects.requireNonNull(ColRowSelection.getSelectedItem())).substring(3);

                //Validation
                if (socialID.contains("[a-zA-Z]+") || socialID.length() != 10) {
                    InformationLabel.setText("Pesel musi być 10 cyfrowy");
                    return;
                }
                if (name.isEmpty()) {
                    InformationLabel.setText("Imie jest puste");
                    return;
                }
                if (surname.isEmpty()) {
                    InformationLabel.setText("Nazwisko jest puste");
                    return;
                }
                if (!((insuranceProvider.isEmpty() && insuranceDate.isEmpty() && insuranceCode.isEmpty()) ||
                    (!insuranceProvider.isEmpty() && !insuranceDate.isEmpty() && !insuranceCode.isEmpty()))){
                    InformationLabel.setText("Wypełnij wszystkie pola dotyczące ubezpieczenia lub zostaw je puste");
                    return;
                }
                if (!insuranceProvider.isEmpty() && !isDateValid(insuranceDate)){
                    InformationLabel.setText("Data jest nie poprawna, format daty to yyyy-MM-dd, np. 2024-02-19");
                    return;
                }
                if (socialID.substring(0, 1).equals("0")){
                    InformationLabel.setText("Pesel nie może się zaczynać od 0");
                    return;
                }
                if(age < 1){
                    InformationLabel.setText("Wiek jest mniejszy od 1");
                    return;
                }
                if(jdbcBookFlight.checkIfFlightHappened(Code)){
                    int dialogResult = JOptionPane.showConfirmDialog (null, "Ten lot już się odbył, " +
                                    "czy na pewno chcesz dodać pasażera?",
                            "Powiadomienie", JOptionPane.YES_NO_OPTION);
                    if(dialogResult == JOptionPane.NO_OPTION){
                        InformationLabel.setText("Anulowano");
                        return;
                    }
                }

                try {
                    Thread.sleep(1000); // prevents 2 pop-ups one after another
                } catch (InterruptedException ex) {
                    System.out.println("================sleep interruption caused this=================== BookFlight.java line ~120");
                    throw new RuntimeException(ex);
                }

                if (jdbcBookFlight.doesSocialIDExist(socialID)){
                    if (jdbcBookFlight.doesDataMatch(socialID, name, surname, String.valueOf(age), insuranceProvider, insuranceDate, insuranceCode)){
                        int dialogResult = JOptionPane.showConfirmDialog (null, "Uwzględniając wiek pasażera, " +
                                "kwota do zapłaty to: " + calculatePrice(Code, age, jdbcBookFlight) + "zł \nCzy kontynuować?",
                                "Zapłata", JOptionPane.YES_NO_OPTION);
                        if(dialogResult == JOptionPane.YES_OPTION){
                            jdbcBookFlight.bookFlight(socialID, flightCode, col, row);
                            InformationLabel.setText("Dodano pasażera który był już w bazie danych");
                            // reset combobox
                            jdbcBookFlight.setSelectBoxes(Code, ColRowSelection);
                            return;
                        } else {
                            InformationLabel.setText("Cena nie została zaakceptowana");
                            return;
                        }
                    }
                    InformationLabel.setText("Ten pesel już istnieje w bazie danych, podane dane nie są z nim zgodne. " +
                            "Upewnij się że dane są poprawne lub wprowadź inny pesel");
                    return;
                }
                int dialogResult = JOptionPane.showConfirmDialog (null, "Uwzględniając wiek pasażera, " +
                        " kwota do zapłaty to: " + calculatePrice(Code, age, jdbcBookFlight) + "zł \nCzy kontynuować?",
                        "Zapłata", JOptionPane.YES_NO_OPTION);
                if(dialogResult == JOptionPane.YES_OPTION){
                    // TODO: Might delete if it causes crushes
                    jdbcBookFlight.addPasengerToDB(socialID, name, surname, String.valueOf(age), insuranceProvider, insuranceDate, insuranceCode);
                    try {
                        Thread.sleep(500); // sleep 0.5s to let DB catch up
                    } catch (InterruptedException ex) {
                        System.out.println("================sleep interruption caused this=================== BookFlight.java line ~145");
                        throw new RuntimeException(ex);
                    }
                    jdbcBookFlight.bookFlight(socialID, flightCode, col, row);
                    InformationLabel.setText("Dodano nowego pasażera");
                    // reset combobox
                    jdbcBookFlight.setSelectBoxes(Code, ColRowSelection);
                } else {
                    InformationLabel.setText("Cena nie została zaakceptowana");
                }
            }
        });
        ExitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int dialogResult = JOptionPane.showConfirmDialog (null, "To zamknie " +
                        "program, czy to właśnie chcesz zrobić?","Uwaga!", JOptionPane.YES_NO_OPTION);
                if(dialogResult == JOptionPane.YES_OPTION){
                    dispose();
                    Main.cleanExit();
                }
            }
        });
        BackButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dispose();
                Main.setVisibility(true);
            }
        });
    }
    public static boolean isDateValid(String date) {
        String DATE_FORMAT = "yyyy-MM-dd";
        try {
            DateFormat df = new SimpleDateFormat(DATE_FORMAT);
            df.setLenient(false);
            df.parse(date);
            return true;
        } catch (ParseException e) {
            return false;
        }
    }
    public double calculatePrice(String Code, int age, JDBCBookFlight jdbcBookFlight){
        double price = jdbcBookFlight.getPrice(Code);
        if(age >= 65){
            price = price * 0.7;
        }
        if (age < 18){
            price = price * 0.8;
        }
        price = (Math.round(price * 100.00)) /100.00;
        return price;
    }
}
