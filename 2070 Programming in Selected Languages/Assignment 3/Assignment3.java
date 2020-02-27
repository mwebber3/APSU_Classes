package assignment3;

import java.util.Scanner;

/**
 * Author: Mikayla 
 * Due Date: February 1, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program reads input and displays output for the total 
 * of a bill's cost, tax, and suggested tip totals
 */
public class Assignment3 {

    public static void main(String[] args) {
        String name;
        double amount, taxTotal;
        final double SALESTAX = 0.07;
        final double LOWPERCENT = 0.15;
        final double MEDPERCENT = 0.18;
        final double HIGHPERCENT = 0.2;
        
        Scanner in = new Scanner(System.in);
        
        System.out.println("Welcome to Mikayla Webber's Restaurant Bill Tool.");
        System.out.print("Enter the bill amount: ");
        amount = in.nextDouble();
        in.nextLine(); // consume newline left-over
        System.out.print("Enter the server's name: ");
        name = in.nextLine();
        System.out.println("");
                
        taxTotal = (amount * SALESTAX);
        final double TOTAL = (amount + taxTotal);
        
        System.out.println("Subtotal:  " + amount);
        System.out.println("Sales Tax: " + taxTotal);
        System.out.println("Total with Tax: " + TOTAL);
        System.out.println("15.0%:   " + (TOTAL * LOWPERCENT));
        System.out.println("18.0%:   " + (TOTAL * MEDPERCENT));
        System.out.println("20.0%:   " + (TOTAL * HIGHPERCENT) + "\n");
        System.out.println("Your server is " + name);
        
        in.close();
    }
    
}
