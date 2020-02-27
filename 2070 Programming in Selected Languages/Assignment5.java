package mikaylawebberassignment5;

import javax.swing.JOptionPane;

/**
 * Author: Mikayla Webber
 * Due Date: February 1, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: Computes and displays the average of three test scores using 
 * the JOptionPane dialog boxes
 */
public class MikaylaWebberAssignment5 
{
    public static void main(String[] args) 
    {
        String test1, test2, test3;
        double intTest1, intTest2, intTest3, averageScore;
        JOptionPane.showMessageDialog(null, "Welcome to Mikayla Webber's Test "
                + "Score Averaging Software.");
        test1 = JOptionPane.showInputDialog("Enter Test Score 1:");
        test2 = JOptionPane.showInputDialog("Enter Test Score 2:");
        test3 = JOptionPane.showInputDialog("Enter Test Score 3:");
        intTest1 = Double.parseDouble(test1);
        intTest2 = Double.parseDouble(test2);
        intTest3 = Double.parseDouble(test3);
        // below is an if else statement to check for valid test scores 
        if (intTest1 < 0 || intTest1 > 100 || intTest2 < 0 || intTest2 > 100 || 
                intTest3 < 0 || intTest3 > 100) 
        {
            JOptionPane.showMessageDialog(null, "Enter a valid test score.");
        }
        else 
        {
            averageScore = ((intTest1 + intTest2 + intTest3) / 3);
            JOptionPane.showMessageDialog(null, "Your average score is: " 
                    + averageScore);
        }
    }
}
