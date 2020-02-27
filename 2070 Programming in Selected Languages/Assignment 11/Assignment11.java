package mikaylawebberassignment11;

import java.util.Scanner;

/**
 * @author Mikayla Webber
 * Due: March 28th, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program will have multiple arrays, insert values into those
 * arrays, and also loop over the values.
 */
public class MikaylaWebberAssignment11 {

    public static void main(String[] args) {
        int i, j, userCount;
        int[] ticketNumbers = new int[5];
        int[] winningNumbers = new int[5];
        Scanner in = new Scanner(System.in);
        
        System.out.println("Welcome to Mikayla Webber's ticket matching software!");
        System.out.println("Enter the five numbers from 1 to 50 of the winning draw.");
        for (i = 0; i < winningNumbers.length; i++) {
            userCount = (i + 1);
            System.out.print("Enter winning draw number " + userCount + ": ");
            winningNumbers[i] = in.nextInt();
        }
        System.out.println("Enter the five numbers from 1 to 50 for a ticket.");
        for (j = 0; j < ticketNumbers.length; j++) {
            userCount = (j + 1);
            System.out.print("Enter ticket number " + userCount + ": ");
            ticketNumbers[j] = in.nextInt();
        }
        checkForDuplicates(winningNumbers, ticketNumbers);
        checkForNegativeIntegers(winningNumbers, ticketNumbers);
        
        if (isPerfectMatch(winningNumbers, ticketNumbers) == true) {
          System.out.println("These tickets are a perfect match.");
        }
        else {
            System.out.println("These tickets aren't a perfect match. They have " 
                    + countMatchingNumbers(winningNumbers, ticketNumbers) 
                    + " number(s) in common.");
        }
        in.close();
    }
    
    /**
     * Precondition: Both arrays must be 5 elements long.
     * Postcondition: None.
     * Description: This method will take two arrays as arguments and will
     * return true if the two arrays are perfect matches and false if otherwise.
     * @param winningNumbers the winning draw ticket numbers from user's entry.
     * @param ticketNumbers the ticket numbers from user's entry.
     * @return true if the two arrays are a perfect match.
     */
    private static boolean isPerfectMatch(int[] winningNumbers, int[] ticketNumbers) {
        //boolean perfectMatch = Arrays.equals(winningNumbers, ticketNumbers);
        //return perfectMatch;
        int i;
        boolean perfectMatch = true;
        for (i = 0; i < winningNumbers.length; i++) {
            if (winningNumbers[i] != ticketNumbers[i])
                perfectMatch = false;
        }
        return perfectMatch;
    }
    
    /**
     * Precondition: Both arrays must be 5 elements long.
     * Postcondition: None.
     * Description: This method will take two arrays as arguments and will 
     * return the number of elements in the first array which also appear in the 
     * second array.
     * @param winningNumbers the winning draw ticket numbers from user's entry.
     * @param ticketNumbers the ticket numbers from user's entry.
     * @return the number of elements that appear in both arrays.
     */
    private static int countMatchingNumbers(int[] winningNumbers, int[] ticketNumbers) {
        int i, j, count = 0;
        for(i = 0; i < winningNumbers.length; i++) {
            for (j = 0; j < ticketNumbers.length; j++) {
                if (winningNumbers[i] == ticketNumbers[j]) {
                    count = (count + 1);
                }
            }
        }
        return count;
    }

    /**
     * Error Checking for days.
     * Precondition: Both arrays must be 5 elements long with unique values.
     * Postcondition: None.
     * Description: This method will check for duplicate numbers in both the 
     * winningNumbers and the ticketNumbers array. It will throw an exception if 
     * there is a duplicate found in either. 
     * @param winningNumbers the winning draw ticket numbers from user's entry.
     * @param ticketNumbers the ticket numbers from user's entry.
     * Random Note to Self: There are three ways to find duplicate elements in 
     * an array: 
     * 1. Brute force method (this one)         Complexity: O(n^2)
     * 2. Using set data structure              Complexity: O(n)
     * 3. Using a hash table data structure     Complexity: O(n)
     */
    private static void checkForDuplicates(int[] winningNumbers, int[] ticketNumbers) {
        int i;
        for (i = 0; i < winningNumbers.length; i++) {
            for (int j = (i + 1); j < winningNumbers.length; j++) {
                if (winningNumbers[i] == (winningNumbers[j])) {
                    throw new IllegalArgumentException("Each winning draw number"
                            + " must be unique.");
                }
            }
        }
        for (i = 0; i < ticketNumbers.length; i++) {
            for (int j = (i + 1); j < ticketNumbers.length; j++) {
                if (ticketNumbers[i] == (ticketNumbers[j])) {
                    throw new IllegalArgumentException("Each ticket number must"
                            + " be unique.");
                }
            }
        }
    }

    /**
     * More Error Checking for days (Separation of duty). 
     * Precondition: Both arrays must be 5 elements long and consist of 
     * non-negative integers.
     * Postcondition: None.
     * Description: This method will check for negative values since a lottery 
     * drawing is never negative.
     * @param winningNumbers the winning draw ticket numbers from user's entry.
     * @param ticketNumbers the ticket numbers from user's entry.
     */
    private static void checkForNegativeIntegers(int[] winningNumbers, int[] ticketNumbers) {
        int i;
        for (i = 0; i < winningNumbers.length; i++) {
            if (winningNumbers[i] < 0) {
                throw new IllegalArgumentException("There cannot be a negative "
                        + "winning draw number."); 
            }
        }
        for (i = 0; i < ticketNumbers.length; i++) {
            if (ticketNumbers[i] < 0) {
                throw new IllegalArgumentException("There cannot be a negative "
                        + "ticket number."); 
            }
        }
    }
    
}
