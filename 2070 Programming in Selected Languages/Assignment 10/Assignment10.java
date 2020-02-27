package mikaylawebberassignment10;

import java.util.Scanner;

/**
 * @author Mikayla Webber
 * Due: March 20th, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program will create a car class that keeps track of how 
 * much gas is in the tank and the odometer; it will also create an application
 * that will utilize the car class to drive the car unit it runs out of gas
 */
public class MikaylaWebberAssignment10 {

    public static void main(String[] args) {
        double gas, speed, time;
        Scanner in = new Scanner(System.in);
        
        System.out.println("Welcome to Mikayla Webber's Car Simulator.");
        System.out.print("Enter the number of gallons of gas in the tank: ");
        gas = in.nextDouble();
        System.out.print("Enter the car's miles per gallon: ");
        final double mpg = in.nextDouble();
        System.out.println("We've created a car with " + gas + 
                " gallons of gas in the tank and gets " + mpg + " MPG.");
        System.out.println("We will loop while there is gas in the tank.");
        
        Car car = new Car(gas, mpg); // creates a car object
        
        while (car.getFuel() > 0.0) {
            System.out.print("Enter the speed (in miles per hour) at which you "
                    + "will drive the car: ");
            speed = in.nextDouble();
            System.out.print("Enter the time (in hours) that you drove the car: ");
            time = in.nextDouble();

            System.out.print("The car drove a distance of ");
            System.out.printf("%.1f", (car.drive(speed, time)));
            System.out.println(" miles.");
            
            System.out.print("The car odometer is at ");
            System.out.printf("%.1f", car.getOdometer());
            System.out.println(" miles.");
       
            System.out.print("There is ");
            System.out.printf("%.1f", car.getFuel());
            System.out.println(" gallons of gas left in the tank.");
        }
        in.close();
    }
    
}