package mikaylawebberassignment4;

import java.util.Scanner;

/**
 * Author: Mikayla Webber
 * Due Date: February 1, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: When given an amount of change determine the minimum amount of 
 * coins the person has in their pocket 
 */
public class MikaylaWebberAssignment4 
{

    public static void main(String[] args) 
    {
        final int DIME = 10;
        final int PENNY = 1;
        final int NICKEL = 5;
        final int QUARTER = 25;
        int dimeAmount, pennyAmount, nickelAmount, quarterAmount, totalCents;
        Scanner in = new Scanner(System.in);
        
        System.out.println("Welcome to Mikayla Webber's Coin Change Calculator.");
        System.out.print("Enter the amount of change in cents: ");
        totalCents = in.nextInt();
        
        if (totalCents >= 0) // if else to check for positive value
        {
            quarterAmount = totalCents / QUARTER;
            totalCents = totalCents % QUARTER;
            dimeAmount = totalCents / DIME;
            totalCents = totalCents % DIME;
            nickelAmount = totalCents / NICKEL;
            totalCents = totalCents % NICKEL;
            pennyAmount = totalCents / PENNY;
        
            System.out.println("Amount of quarters: " + quarterAmount);
            System.out.println("Amount of dimes: " + dimeAmount);
            System.out.println("Amount of nickels: " + nickelAmount);
            System.out.println("Amount of pennies: " + pennyAmount);
            System.out.println("You have " + quarterAmount + " quarters, " + 
                    dimeAmount + " dimes, " + nickelAmount + " nickels, and " +
                    pennyAmount + " pennies.");            
        }
        else 
        {
            System.out.println("The amount has to be greater than zero.");
        }
        in.close();
    }
    
}
