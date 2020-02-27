package mikaylawebberassignment2;

import java.util.Scanner;

/**
 * Author: Mikayla Webber
 * Due Date: February 1, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program does a square feet to apsu conversion
 */
public class MikaylaWebberAssignment2 {

    public static void main(String[] args) {   
        
        int apsu = 51310;
        int width, length, apsuArea, sqftArea;
        
        Scanner in = new Scanner(System.in);

        System.out.println("Welcome to Mikayla Webber's Land Size Calculator.");
        System.out.println("4 apsu = 51310 square feet.\n"
                + "1 apsu = " + (4 / apsu) + " square feet.");
        
        System.out.print("Enter the length of a plot in feet: ");
        length = in.nextInt();
        
        System.out.print("Enter the width of a plot in feet: ");
        width = in.nextInt();
        sqftArea = (length * width);
        
        System.out.println("Area in Square Feet: " + sqftArea);
        apsuArea = (sqftArea / apsu);
        System.out.println("Area in Apsus: " + apsuArea);
        
        in.close();
    }
}