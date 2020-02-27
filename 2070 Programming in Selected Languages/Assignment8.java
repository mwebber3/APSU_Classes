package mikaylawebberassignment8;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

/**
 * Author: Mikayla Webber 
 * Assignment Due: February 21st, 2018 
 * Course: CSCI 2070-08 Programming in Selected Languages 
 * Description: Open a file for reading and writing by using a while loop
 */
public class MikaylaWebberAssignment8 {

    public static void main(String[] args) throws IOException {
        int count = 0;
        String inputFilename, outputFilename;
        Scanner in = new Scanner(System.in);
        System.out.println("Welcome to Mikayla Webber's Sentence Splitter.");

        System.out.print("Enter a file to read: ");
        inputFilename = in.nextLine();
        File file = new File(inputFilename);
        // Below checks to see if the input file exists
        // If the file doesn't exist then an error message is displayed
        if (!file.exists()) {
            System.out.println("The file " + file + " was not found.");
            System.exit(0);
        }
        Scanner inputFile = new Scanner(file);

        System.out.print("Enter a file to output: ");
        outputFilename = in.nextLine();
        File file2 = new File(outputFilename);
        // Belows checks to see if the output file already exists
        // If the file does exist then an error message is displayed
        if (file2.exists()) {
            System.out.println("The file " + file2 + " already exists.");
            System.exit(1);
        }
        PrintWriter outputFile = new PrintWriter(file2);
        while (inputFile.hasNext()) {
            String word = inputFile.next();
            outputFile.println(word + " " + word.length());
            count = count + 1;
        }
        /**
         * Below was used to test reading and writing from file to file2
         *
         * while(inputFile.hasNext()) { 
         *   String fileContent = inputFile.nextLine(); 
         *   outputFile.println(fileContent); 
         * }
         */
        outputFile.close();
        inputFile.close();
        in.close();
        // Above closes the input file, output file, and scanner.
        System.out.println("Data was written to the file.");
    }
}
