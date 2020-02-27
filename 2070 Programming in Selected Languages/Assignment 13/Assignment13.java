package mikaylawebberassignment13;

import java.awt.print.Book;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;
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
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;

/**
 * @author Mikayla Webber
 * Due: April 16th, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program uses JavaFX to solve a create a book library 
 * application that maintains a list of books.
 */
public class MikaylaWebberAssignment13 extends Application {
    
    @Override
    public void start(Stage stage) throws Exception {
        ArrayList bookList = new ArrayList<Book>();
        Scanner in = new Scanner(System.in);
        
        Label titleLabel = new Label("Title: ");
        TextField titleInput = new TextField();
        HBox titleLabelBox = new HBox();
        titleLabelBox.setAlignment(Pos.CENTER);
        titleLabelBox.setPadding(new Insets(20, 0, 20, 25));
        titleLabelBox.getChildren().addAll(titleLabel, titleInput);
        
        Label authorLabel = new Label("Author: ");
        TextField authorInput = new TextField();
        HBox authorLabelBox = new HBox();
        authorLabelBox.setAlignment(Pos.CENTER);
        authorLabelBox.setPadding(new Insets(0, 0, 20, 10));
        authorLabelBox.getChildren().addAll(authorLabel, authorInput);
        
        Label publisherLabel = new Label("Publisher: ");
        TextField publisherInput = new TextField();
        HBox publisherLabelBox = new HBox();
        publisherLabelBox.setAlignment(Pos.CENTER);
        publisherLabelBox.setPadding(new Insets(0, 0, 20, 0));
        publisherLabelBox.getChildren().addAll(publisherLabel, publisherInput);
        
        Label yearPublishedLabel = new Label("Year Published: ");
        TextField yearPublishedInput = new TextField();
        HBox yearPublishedLabelBox = new HBox();
        yearPublishedLabelBox.setAlignment(Pos.CENTER);
        yearPublishedLabelBox.setPadding(new Insets(0, 25, 20, 0));
        yearPublishedLabelBox.getChildren().addAll(yearPublishedLabel, 
                yearPublishedInput);
        
        TextArea resultOutput = new TextArea();
        resultOutput.setEditable(false);
        HBox resultLabelBox = new HBox();
        resultLabelBox.setAlignment(Pos.CENTER_LEFT);
        resultLabelBox.setPadding(new Insets(20, 0, 0, 0));
        resultLabelBox.getChildren().addAll(resultOutput);
        
        Button addBookButton = new Button("Add Book");
        HBox addButtonBox = new HBox();
        addButtonBox.setAlignment(Pos.CENTER);
        addButtonBox.setPadding(new Insets(5));
        addButtonBox.getChildren().addAll(addBookButton);
        
        VBox labelBox = new VBox();
        labelBox.setAlignment(Pos.CENTER);
        labelBox.getChildren().addAll(titleLabelBox, authorLabelBox, 
                publisherLabelBox, yearPublishedLabelBox, addButtonBox, 
                resultLabelBox);
        
        EventHandler<ActionEvent> handler = getBook(bookList, titleInput, 
                authorInput, publisherInput, yearPublishedInput, resultOutput);
        addBookButton.setOnAction(handler);
        
        Scene scene = new Scene(labelBox, 400, 400);
        stage.setTitle("Mikayla Webber's Book Library");
        stage.setScene(scene);
        stage.show();
        in.close();
    }

    private EventHandler<ActionEvent> getBook(ArrayList bookList, TextField 
            titleInput, TextField authorInput, TextField publisherInput, 
            TextField yearPublishedInput, TextArea resultOutput) {
        EventHandler<ActionEvent> handler = event -> {
            try {
                String title = titleInput.getText();
                String author = authorInput.getText();
                String publisher = publisherInput.getText();
                String yearInput = yearPublishedInput.getText();
                int year = Integer.parseInt(yearInput);
                
                Books book = new Books(title, author, publisher, year);
                bookList.add(book);
                StringBuilder sb = new StringBuilder("");
                
                for (Object temp : bookList) {
                    sb.append(temp + "\n");
                }
                resultOutput.setText(sb.toString());
                title = ""; 
                author = "";
                publisher = "";
                yearInput = "";
                yearInput = "";
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "Error! Book not "
                        + "understood.");
            }
        };
        return handler;
    }
    
}
