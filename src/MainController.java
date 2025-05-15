import javafx.fxml.FXML;
import javafx.scene.control.Label;

public class MainController {

    @FXML
    private Label label;

    /**
     * Sets the label text to "Button clicked!" when the button is clicked.
     */
    @FXML
    private void handleButtonClick() {
        label.setText("Button clicked!");
    }
}
