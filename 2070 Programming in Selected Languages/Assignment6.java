package mikaylawebberassignment6;

import java.util.Scanner;

/**
 * Author: Mikayla Webber 
 * Due Date: February 7, 2018 
 * Course: 2070-08 Programming in Selected Languages 
 * Description: Working with if statements, Strings, comparing to see if two 
 * strings are equal, and comparing multiple strings in order to sort them
 */
public class MikaylaWebberAssignment6 {

    public static void main(String[] args) {
        String name1, name2, name3;
        Scanner in = new Scanner(System.in);

        System.out.println("Welcome to Mikayla Webber's Name Sorter.\n"
                + "All names must be unique.");
        System.out.print("Enter the first name: ");
        name1 = in.nextLine();
        System.out.print("Enter the second name: ");
        name2 = in.nextLine();
        System.out.print("Enter the third name: ");
        name3 = in.nextLine();

        if (name1.equals(name2)) {
            System.out.println("Names one and two are identical.");
        } else if (name1.equals(name3)) {
            System.out.println("Names one and three are identical.");
        } else if (name2.equals(name3)) {
            System.out.println("Names two and three are identical.");
        } else {
            CompareAnddSortMethod(name1, name2, name3);
            // calls the method that compares and sorts the names
        }
        in.close();
    }

    public static void CompareAnddSortMethod(String name1, String name2, String name3) {
        System.out.println("\nHere are the sorted names.");
        if (name1.compareTo(name2) <= 0 && name2.compareTo(name3) <= 0) {
            System.out.println(name1 + "\n" + name2 + "\n" + name3);
        } // name1 name2 name3 
        else if (name1.compareTo(name3) <= 0 && name3.compareTo(name2) <= 0) {
            System.out.println(name1 + "\n" + name3 + "\n" + name2);
        } // name1 name3 name2
        else if (name2.compareTo(name1) <= 0 && name1.compareTo(name3) <= 0) {
            System.out.println(name2 + "\n" + name1 + "\n" + name3);
        } // name2 name1 name3
        else if (name2.compareTo(name3) <= 0 && name3.compareTo(name1) <= 0) {
            System.out.println(name2 + "\n" + name3 + "\n" + name1);
        } // name2 name3 name1
        else if (name3.compareTo(name1) <= 0 && name1.compareTo(name2) <= 0) {
            System.out.println(name3 + "\n" + name1 + "\n" + name2);
        } // name3 name1 name2
        else {
            // if (name3.compareTo(name2) <= 0 && name2.compareTo(name1) <= 0)
            System.out.println(name3 + "\n" + name2 + "\n" + name1);
        }
        // name3 name2 name1
    }
}
