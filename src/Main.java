import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {
    /**
     * Initializes and displays the primary stage for the JavaFX application.
     * Loads the FXML layout, sets up the scene, and applies a title.
     *
     * @param stage the primary stage for this application
     * @throws Exception if loading the FXML resource fails
     */
    @Override
    public void start(Stage stage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("/layout.fxml"));
        Scene scene = new Scene(root);
        stage.setTitle("JavaFX + FXML + CSS");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}
