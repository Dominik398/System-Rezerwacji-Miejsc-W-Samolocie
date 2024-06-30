import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Calendar;

public class PassengerList extends JFrame{
    private JPanel MainPanel;
    private JButton RemoveButton;
    private JButton MoreInfoButton;
    private JButton GoBackButton;
    private JButton CloseButton;
    private JTable PassengerTable;

    public PassengerList(String Code){
        super("Lista Pasażerów");
        this.setContentPane(this.MainPanel);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        int width = 1280; int height = 800; // 720
        this.setSize(width, height);
        this.setLocationRelativeTo(null);

        // Icon source: https://www.iconfinder.com/icons/2530820/airplane_airplane_mode_general_office_plane_transport_travel_icon
        // Icon author link1: https://www.iconfinder.com/korawan_m
        // Icon author link2: BomSymbols https://creativemarket.com/BomSymbols
        ImageIcon icon = new ImageIcon("src/icon.png");
        super.setIconImage(icon.getImage());

        //Table Setup
        JDBCPassengerList jdbcPassengerList = new JDBCPassengerList();
        jdbcPassengerList.setTable(PassengerTable, Code);
        PassengerTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        PassengerTable.setDefaultEditor(Object.class, null);

        ArrayList<Frame> infoWindows = new ArrayList<Frame>();

        GoBackButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                for (Frame frame : infoWindows){
                    frame.dispose();
                }
                dispose();
                Main.setVisibility(true);
            }
        });
        CloseButton.addActionListener(new ActionListener() {
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
        RemoveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (PassengerTable.getSelectionModel().isSelectionEmpty()) {
                    JOptionPane.showMessageDialog (null, "Wybierz pasażera z listy.");
                    return;
                }

                String reservationID = (String) PassengerTable.getValueAt(PassengerTable.getSelectedRow(), 0);
                Calendar calendar = Calendar.getInstance();

                int day = calendar.get(Calendar.DAY_OF_MONTH);
                int month = calendar.get(Calendar.MONTH) + 1;
                int year = calendar.get(Calendar.YEAR);

                int[] dates = jdbcPassengerList.getDates(reservationID);

                if((year > dates[2]) || ((year == dates[2]) && (month>dates[1])) ||
                        (((year == dates[2]) && (month == dates[1]) && (day > dates[0])))){
                    int dialogResult = JOptionPane.showConfirmDialog (null, "<html><p style = \" color:red \">" +
                            "Ten lot już się odbył,</p>" +
                            " czy chcesz usunąć pasażera mimo to?</html>","Uwaga!", JOptionPane.YES_NO_OPTION);
                    if(dialogResult == JOptionPane.YES_OPTION){
                        jdbcPassengerList.removePassenger(reservationID);
                        ((DefaultTableModel) PassengerTable.getModel()).removeRow(PassengerTable.getSelectedRow());
                    }
                } else {
                    int dialogResult = JOptionPane.showConfirmDialog (null, "To usunie pasażera z listy," +
                            " czy to właśnie chcesz zrobić?","Uwaga!", JOptionPane.YES_NO_OPTION);
                    if(dialogResult == JOptionPane.YES_OPTION){
                        jdbcPassengerList.removePassenger(reservationID);
                        ((DefaultTableModel) PassengerTable.getModel()).removeRow(PassengerTable.getSelectedRow());
                    }
                }
            }
        });
        MoreInfoButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (PassengerTable.getSelectionModel().isSelectionEmpty()) {
                    JOptionPane.showMessageDialog (null, "Wybierz pasażera z listy.");
                    return;
                }
                String reservationID = (String) PassengerTable.getValueAt(PassengerTable.getSelectedRow(), 0);
                PassengerInfo passengerInfo = new PassengerInfo(reservationID);
                passengerInfo.setVisible(true);
                infoWindows.add(passengerInfo);
            }
        });
    }
}
