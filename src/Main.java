import javax.swing.*;
import java.awt.*;

public class Main {
    public static FlightSelectionForm mainWindow = new FlightSelectionForm();
    public static void main(String[] args) {
        // mainWindow.setResizable(false);

        try {
            JDBCMain jdbcMain = new JDBCMain();
            jdbcMain.testConnection();
        } catch (Exception e){
            JOptionPane.showMessageDialog (null,
                    "Wystąpił błąd bazy danych. \n" +
                            "Upewnij się że wszystko jest poprawnie skonifurowane, \n" +
                            "możesz użyć pliku pomocniczego \"PomocDB.pdf\" który znajduje się w repozytorium\n" +
                            "Oto błąd który wypisuje program: " + e, "Błąd bazy danych!", JOptionPane.WARNING_MESSAGE);
            return;
        }
        setVisibility(true);
    }
    public static void setVisibility(boolean vis){
        mainWindow.executeSearch();
        mainWindow.setVisible(vis);
    }
    public static void cleanExit(){
        Frame[] frames = Frame.getFrames();
        for (Frame frame : frames){
            frame.dispose();
        }
    }
}
