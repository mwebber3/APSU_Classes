package mikaylawebberassignment12;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

/**
 * @author Mikayla 
 * Due: April 4th, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program uses JavaFX to solve a distance conversion problem. 
 * The user will enter a distance in meters and the radio buttons can be selected
 * to convert the meters to inches, feet, or yards. 
 */
public class Assignment12 extends Application {
    
    @Override
    public void start(Stage stage) throws Exception {
        VBox imageBox = displayImage();

        String[] buttonNames = {"inches", "feet", "yards"};
        ToggleGroup buttonGroup = new ToggleGroup();
        RadioButton[] buttons = new RadioButton[buttonNames.length];
        
        for (int i = 0; i < buttons.length; i++) {
        buttons[i] = new RadioButton(buttonNames[i]);
        buttons[i].setToggleGroup(buttonGroup);
        }
        
        buttons[0].setSelected(true); // pre-selects the first choice
        VBox buttonBox = new VBox(15);
        buttonBox.setPadding(new Insets(0, 10, 20, 20));
        buttonBox.getChildren().addAll(buttons);
        buttonBox.setAlignment(Pos.CENTER_LEFT);
        
        Label distanceLabel = new Label("Distance in meters: ");
        TextField distanceInput = new TextField();
        HBox distanceLabelBox = new HBox();
        distanceLabelBox.setAlignment(Pos.CENTER);
        distanceLabelBox.setPadding(new Insets(10, 0, 10, 0));
        distanceLabelBox.getChildren().addAll(distanceLabel, distanceInput);
        
        Label resultLabel = new Label("Result: ");
        resultLabel.setPadding(new Insets(10, 10, 10, 55));
        TextField resultOutput = new TextField();
        resultOutput.setEditable(false);
        HBox resultLabelBox = new HBox();
        resultLabelBox.setAlignment(Pos.CENTER);
        resultLabelBox.getChildren().addAll(resultLabel, resultOutput);
        
        Button convertButton = new Button("Convert");
        convertButton.setPadding(new Insets(5));
        
        VBox labelBox = new VBox();
        labelBox.setAlignment(Pos.CENTER_RIGHT);
        labelBox.setPadding(new Insets(0, 0, 0, 75));
        labelBox.getChildren().addAll(distanceLabelBox, resultLabelBox,
        convertButton);
        
        HBox everythingBox = new HBox();
        everythingBox.getChildren().addAll(imageBox, buttonBox, labelBox);

        EventHandler<ActionEvent> handler = getButtonSelected(distanceInput, 
                buttons, resultOutput);
        convertButton.setOnAction(handler);
        
        Scene scene = new Scene(everythingBox, 700, 250);
        stage.setScene(scene);
        stage.setTitle("Mikayla Webber's Distance Converter");
        stage.show();
    }

    /**
     * Precondition: Only numerical (floating point) values.
     * Postcondition: Will determine which button was selected, perform the 
     * corresponding operation, and output the results to the user.
     * Description: This method will determine which radio button was selected 
     * by the user and then call the corresponding conversion method and output 
     * the results, which will be based off of the user input for the meters,
     * into the resultOutput field.
     * @param distanceInput the distance, in meters, entered by the user.
     * @param buttons the radio buttons that display the options (inches, feet,
     * yards).
     * @param resultOutput the field where the conversion will be displayed.
     * @return the final value after the conversion.
     */
    private EventHandler<ActionEvent> getButtonSelected(TextField distanceInput,
            RadioButton[] buttons, TextField resultOutput) {
        EventHandler<ActionEvent> handler = event -> {
            try {
                String input = distanceInput.getText();
                double distance = Double.parseDouble(input);
                for (RadioButton rb : buttons) {
                    if (rb.isSelected()) {
                        String buttonSelected = rb.getText();
                        if (buttonSelected == "inches") {
                            double result = convertMetersToInches(distance);
                            resultOutput.setText(String.valueOf(result));
                            return;
                        } else if (buttonSelected == "feet") {
                            double result = convertMetersToFeet(distance);
                            resultOutput.setText(String.valueOf(result));
                            return;
                        } else if (buttonSelected == "yards") {
                            double result = convertMetersToYards(distance);
                            resultOutput.setText(String.valueOf(result));
                            return;
                        }
                    }
                }
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "Error! Number not "
                        + "understood.");
            }
        };
        return handler;
    }

    /**
     * Precondition: None.
     * Postcondition: Displays the image using JavaFX VBox.
     * Description: This method will get the image from the file location 
     * specified then display it, aligned center-left, using JavaFX.
     * @return imageBox (image from location).
     */
    private VBox displayImage() {
        VBox imageBox = new VBox();
        imageBox.setAlignment(Pos.CENTER_LEFT);
        imageBox.getChildren().add(new ImageView("images/tape.png"));
        return imageBox;
    }
    
    /**
     * Precondition: None.
     * Postcondition: Converts the meters entered to inches.
     * Description: This method converts the meters that the user entered to 
     * inches (1 meter == 39.37 inches).
     * @param meters user input for the meters.
     * @return meters multiplied by 39.37 
     */
    private static double convertMetersToInches(double meters) {
        return meters * 39.37; 
    }
    
    /**
     * Precondition: None.
     * Postcondition: Converts the meters entered to feet.
     * Description: This method converts the meters that the user entered to 
     * feet (1 meter == 3.28 feet).
     * @param meters user input for the meters.
     * @return meters multiplied by 3.28
     */
    private static double convertMetersToFeet(double meters) {
        return meters * 3.28; 
    }
    
    /**
     * Precondition: None.
     * Postcondition: Converts the meters entered to yards.
     * Description: This method converts the meters that the user entered to 
     * yards (1 meter == 1.09 yards).
     * @param meters user input for the meters.
     * @return meters multiplied by 1.09
     */
    private static double convertMetersToYards(double meters) {
        return meters * 1.09; 
    }
    
}
