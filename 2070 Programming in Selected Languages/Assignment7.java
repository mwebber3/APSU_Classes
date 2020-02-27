package mikaylawebberassignment7;

import java.util.Scanner;

/**
 * Author: Mikayla Webber 
 * Due Date: February 13, 2018 
 * Course: 2070-08 Programming in Selected Languages 
 * Description: Part 2 of The Restaurant Bill; display the data using the 
 * printf method
 */
public class MikaylaWebberAssignment7 {

    public static void main(String[] args) {
        String name;
        final double SALESTAX = 0.07;
        final double LOWPERCENT = 0.15;
        final double MEDPERCENT = 0.18;
        final double HIGHPERCENT = 0.2;
        double amount, entree, drink, dessert, taxTotal;

        Scanner in = new Scanner(System.in);

        System.out.println("Welcome to Mikayla Webber's Restaurant Bill Tool. "
                + "Part 2");
        System.out.print("Enter the price of the entree: ");
        entree = in.nextDouble();
        System.out.print("Enter the price of the drink: ");
        drink = in.nextDouble();
        System.out.print("Enter the price of the dessert: ");
        dessert = in.nextDouble();
        in.nextLine(); // consume newline left-over
        System.out.print("Enter the server's name: ");
        name = in.nextLine();

        // below calculates the amount, total for tax, and then the accumulative
        // total for the two
        amount = (entree + drink + dessert);
        taxTotal = (amount * SALESTAX);
        final double TOTAL = (amount + taxTotal);

        // below is the output with printf formatting
        System.out.printf("%1$20s %2$,6.2f%n", "Entree $", entree);
        System.out.printf("%1$20s %2$,6.2f%n", "Drink $", drink);
        System.out.printf("%1$20s %2$,6.2f%n", "Dessert $", dessert);
        System.out.printf("%1$20s %2$,6.2f%n", "Total $", amount);
        System.out.printf("%1$20s %2$,6.2f%n", "Tax $", taxTotal);
        System.out.printf("%1$20s %2$,6.2f%n", "Total w/ Tax $", TOTAL);
        System.out.printf("%1$20s %2$,6.2f%n", "Low Top $",
                (TOTAL * LOWPERCENT));
        System.out.printf("%1$20s %2$,6.2f%n", "Medium Tip $",
                (TOTAL * MEDPERCENT));
        System.out.printf("%1$20s %2$,6.2f%n", "High Tip $", 
                (TOTAL * HIGHPERCENT));
        System.out.printf("%1$20s", "Your server: ");
        System.out.printf(name);
        System.out.println("");
        
        in.close();
    }

}
