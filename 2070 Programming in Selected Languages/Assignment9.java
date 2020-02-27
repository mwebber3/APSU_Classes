package mikaylawebberassignment9;

import java.util.Random;
import java.util.Scanner;

/**
 * Author: Mikayla Webber
 * Due: February, 28th, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This is a program that will play it's own version of 
 * Rock-Paper-Scissors and will loop until the user quits
 */
public class MikaylaWebberAssignment9 {
    
    public static void main(String[] args) {
        String playAgain = "yes";
        Scanner in = new Scanner(System.in);
        Random random = new Random();
        
        greetTheUser();
        displayTheRules();
        
        while("yes".equals(playAgain.toLowerCase())) {
            int computerChoice = getComputerChoice(random);
            displayTheItemChoices();
            int userChoice = getUserChoice(in);
            displayTheComputerChoice(computerChoice);
            displayTheWinner(userChoice, computerChoice);
            playAgain = askToPlayAgain(in);
        }
        displayClosing();
        in.close();
    }
    /**
     * Precondition: None.
     * Postcondition: Outputs message to screen.
     * Description: This method displays a greeting message to the user when 
     * they run the program.
     */
    private static void greetTheUser() {
        System.out.println("Welcome to the game of Bear-Hunter-Ninja.");
    }
    /**
     * Precondition: None.
     * Postcondition: Outputs message to screen.
     * Description: This method displays the rules for the game to the user.
     */
    private static void displayTheRules() {
        System.out.print("Welcome to the game of Bear-Hunter-Ninja.\n"
                + "Bear beats Ninja.\n"
                + "Ninja beats Hunter.\n"
                + "Hunter beats Bear.\n");
    }
    /**
     * Precondition: None.
     * Postcondition: Random number generated from 1 to 3.
     * Description: This method generates a random number from 1 to 3 for the 
     * computerChoice.
     */
    private static int getComputerChoice(Random random) {
        return random.nextInt(3) + 1;
    }
    /**
     * Precondition: None.
     * Postcondition: Outputs message to screen.
     * Description: This method displays the different choices the user can 
     * select from.
     */
    private static void displayTheItemChoices() {
        System.out.print("Let's play! Enter a guess:\n" 
                + "1: Bear\n"
                + "2: Hunter\n" 
                + "3: Ninja\n");
    }
    /**
     * Precondition: None.
     * Postcondition: Stores user input after validating it.
     * Description: This method prompts the user for their choice (1 to 3), 
     * validates it to make sure it is within the range, and then stores it.
     * @param choice is the user's selection 
     */
    private static int getUserChoice(Scanner in) {
        int choice = in.nextInt();
        if (choice < 1 || choice > 3) {
            System.out.println("Please enter a valid choice.");
        }
        return choice;
    }
    /**
     * Precondition: Receives the computerChoice from the method 
     * getComputerChoice().
     * Postcondition: Displays the computerChoice equivalence (1 == bear etc).
     * Description: This method takes the computerChoice and displays the 
     * equivalence in a message outputted to the user.
     */
    private static void displayTheComputerChoice(int computerChoice) {
        if (computerChoice == 1)
            System.out.println("The computer picked bear.");
        else if (computerChoice == 2)
            System.out.println("The computer picked hunter.");
        else
            System.out.println("The computer picked ninja.");
    }
    /**
     * Precondition: userChoice (passed to this method) has to be 1 - 3
     * and computerChoice (passed to this method) has to be 1 - 3.
     * Postcondition: Display to the screen the winner of the game.
     * Description: This method will determine through a switch & if-else if-else 
     * statements whether the computer won, user won, or if there was a draw.
     * @param userChoice is what the user selected in the getUserChoice() method
     * @param computerChoice is a randomly chosen integer (1 to 3) from the 
     * getComputerChoice() method.
     */
    private static void displayTheWinner(int userChoice, int computerChoice) {
        switch (computerChoice) {
            case 1:
                if (userChoice == 1)
                    System.out.println("Draw.");
                else if (userChoice == 2)
                    System.out.println("Computer won.");
                else 
                    System.out.println("You won!");
                break;
            case 2:
                if (userChoice == 1)
                    System.out.println("You won!");
                else if (userChoice == 2)
                    System.out.println("Draw.");
                else 
                    System.out.println("Computer won.");
                break;
            case 3: 
                if (userChoice == 1)
                    System.out.println("Computer won.");
                else if (userChoice == 2)
                    System.out.println("You won!");
                else 
                    System.out.println("Draw.");
                break;
            default: 
                break;
        }
    }
    /**
     * Precondition: None.
     * Postcondition: Returns user's choice to play again (String temp).
     * Description: This method prompts the user and then stores their input
     * and passes that input to the main. 
     * @param temp is the user's string which will be returned to the main, 
     * if yes then the game will go through the loop again.
     */
    private static String askToPlayAgain(Scanner in) {
        System.out.println("Should we play again? [Yes]");
        in.nextLine(); // consume newline left-over
        String temp = in.nextLine();
        return temp;
    }
    /**
     * Precondition: None. 
     * Postcondition: Displays message to screen.
     * Description: This method displays the closing message to the user.
     */
    private static void displayClosing() {
        System.out.println("Thanks for playing!");
    }
}
