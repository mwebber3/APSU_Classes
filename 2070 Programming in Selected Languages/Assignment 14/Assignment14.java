package mikaylawebberassignment14;

import static java.lang.System.exit;
import java.util.ArrayList;
import java.util.Scanner;

/**
 * @author Mikayla Webber
 * Due: April 23rd, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program creates an application to hold various types of 
 * space craft.
 */
public class MikaylaWebberAssignment14 {

    public static void main(String[] args) {
        String name;
        Scanner in = new Scanner(System.in);
        int engines, ports, seats, option = 0;
        
        ArrayList<SpaceCraft> spacecrafts = new ArrayList<>();      
        
        System.out.println("Welcome to Mikayla Webber's Space Craft Organizer.");
        while (option != 6) {
            displayMenu();
            option = in.nextInt();
            
            switch(option) {
                case 1:
                    System.out.println("Enter a new Space Station.");
                    in.nextLine();
                    System.out.print("Enter the name: ");
                    name = in.nextLine();
                    System.out.print("Enter the number of seats: ");
                    seats = in.nextInt();
                    System.out.print("Enter the number of ports: ");
                    ports = in.nextInt();
                    SpaceStation spaceStation = 
                            new SpaceStation(name, seats, ports);
                    break;
                case 2:
                    System.out.println("Enter a new Space Shuttle.");
                    in.nextLine();
                    System.out.print("Enter the name: ");
                    name = in.nextLine();
                    System.out.print("Enter the number of seats: ");
                    seats = in.nextInt();
                    System.out.print("Enter the number of engines: ");
                    engines = in.nextInt();
                    SpaceShuttle spaceShuttle = 
                            new SpaceShuttle(name, seats, engines);
                    break;
                case 3:
                    System.out.println("There are " + "" + " space craft.");
                    break;
                case 4:
                    // display count of number of seats
                    System.out.println("There are " + "" 
                            + " seats across all space craft.");
                    break;
                case 5:
                    System.out.println("All Space Craft.");
                    for (SpaceCraft spacecraft : spacecrafts) {
                        System.out.println(spacecraft);
                    }
                    break;
                case 6:
                    exit(0);
                default:
                    System.out.println("Please enter a valid option (1-6).");
            }
        }
    }

    /**
     * Precondition: 
     * Postcondition: 
     * Description: 
     */
    private static void displayMenu() {
        System.out.print("1. Add a new space station.\n"
                + "2. Add a new space shuttle.\n"
                + "3. Display count of all space craft.\n"
                + "4. Display count of number of seats.\n"
                + "5. Display description of all space craft.\n"
                + "6. Quit.\n"
                + "Enter an option from 1 to 6:");
    }
    
}
