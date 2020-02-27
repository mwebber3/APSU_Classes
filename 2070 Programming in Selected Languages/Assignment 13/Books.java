package assignment13;

/**
 * @author Mikayla 
 * Due: April 16th, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program uses JavaFX to solve a create a book library 
 * application that maintains a list of books.
 */
public class Books {
    private final String title;
    private final String author;
    private final String publisher;
    private final int year;
    
    /**
     * Precondition: None.
     * Postcondition: The object is created.
     * Description: This method will associate each of the four parameters with 
     * their respective fields.
     * @param title is the title of the book.
     * @param author is the author of the book.
     * @param publisher is the publisher for the book.
     * @param year is the year the book was published.
     */
    public Books(String title, String author, String publisher, int year) {
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.year = year;
    }
    
    /**
     * Precondition: None.
     * Postcondition: None.
     * Description: returns the user's input for the title, author, publisher, 
     * and year of the book.
     * @return a string that includes the title, author, publisher, and year 
     * with spaces separating them.
     */
    public String getDescription() {
        return title + " " + author + " " + publisher + " " + year;
    }
    
    /**
     * Precondition: None.
     * Postcondition: None.
     * Description: returns the user's input for the title, author, publisher, 
     * and year of the book.
     * @return a string that includes the title, author, publisher, and year 
     * with spaces separating them.
     */
    @Override
    public String toString() {
        return this.title + " " + this.author + " " + this.publisher + " " + 
                this.year;
    }
}
