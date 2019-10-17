/* CSCI 4100
 * Assignment 7
 * Test code for virtual address space simulation.
 */

 #include <stdio.h>
 #include "va_space.h"

/* checkForSetCorrespondingBit is declared here and defined beneath the main */
 void checkForSetCorrespondingBit(int num);

 int main (int argc, char *argv[])
 {
/* displays that the page has been allocated to the virtual address space */
   printf(PT_ALLOC);
   printf(table[page_num] & (0x0000 | PT_ALLOC));

/* declarations */
  int flag;
  int perm_needed;
  int address[PT_SIZE];

   pt_index page_num;
   pt_index frame_num;
   pt_entry virtual_address;
   pt_entry physical_address;
   pt_bits c0, c1, c2, c4, c8, c16, c32, c64, c128, c256;

/* sets the permissions needed to read/write */
   perm_needed = PT_READ | PT_WRITE;

/* sets the pt_bits to their corresponding bits */
   c0 = 0b00000000;
   c1 = 0b00000001;
   c2 = 0b00000010;
   c4 = 0b00000100;
   c8 = 0b00001000;
   c16 = 0b00010000;
   c32 = 0b00100000;
   c64 = 0b01000000;
   c128 = 0b10000000;
   c256 = 0b11111111;

/* creates page table using the data type page_table */
   page_table table;

/* initializes all of the entries in a page table to zero */
   pt_init(table);
/* displays the contents of the entire page table in hexadecimal notation */
   pt_display(table);

/* maps a page to a frame in a page table with the given permissions */
   pt_map(table, 0, 20, perm_needed);
   pt_map(table, 1, 12, perm_needed);
   pt_map(table, 2, 30, perm_needed);

/* displays the page table entries 0, 1, 2 in hexadecimal notation */
   pt_display_entry(table, 0);
   pt_display_entry(table, 1);
   pt_display_entry(table, 2);

/* displays message, calls checkForSetCorrespondingBit and passes in true/false depending on if the corresponding bit is set */
/* sets the falg to the outcome of checkForSetCorrespondingBit and displays it. */
   puts("Commense the dirty bit testing: ");
   checkForSetCorrespondingBit(pt_dirty(table, 0));
   flag = pt_dirty(table, 0);
   printf("Flag: %01x \n", flag);

/* displays message, sets the corresponding bits, and then displays the single page table entry in hexadecimal notation */
   puts("Set the dirty bit: ");
   pt_set_dirty(table, 0);
   pt_display_entry(table, 0);

/* displays message, sets flag depending on if the corresponding bit is set and displays results */
   puts("Test the dirty bit: ");
   flag = pt_dirty(table, 0);
   printf("Flag: %01x \n", flag);
   checkForSetCorrespondingBit(pt_dirty(table, 0));

/* clears and displays the table along with message */
   puts("Clear the dirty bit: ");
   pt_clear_dirty(table, 0);
   pt_display_entry(table, 0);

/* displays message and calls checkForSetCorrespondingBit while passing in true/false depending on if the corresponding bit is set */
   puts("Test the accessed bit: ");
   checkForSetCorrespondingBit(pt_accessed(table, 1));

/* displays message, sets the corresponding bits, and displays them */
   puts("Set the accessed bit: ");
   pt_set_accessed(table, 1);
   pt_display_entry(table, 1);

/* displays message and calls checkForSetCorrespondingBit while passing in true/false depending on if the corresponding bit is set */
   puts("Test the accessed bit: ");
   checkForSetCorrespondingBit(pt_accessed(table, 1));

/* clears and displays the table along with message */
   puts("Clear the accessed bit: ");
   pt_clear_accessed(table, 1);
   pt_display_entry(table, 1);

/* displays message and calls checkForSetCorrespondingBit while passing in true/false depending on if the corresponding bit is set */
   puts("Test for present bit: ");
   checkForSetCorrespondingBit(pt_present(table, 2));

/* displays message, sets corresponding bits, and displays the single page table entry */
   puts("Set the present bit: ");
   pt_set_present(table, 2);
   pt_display_entry(table, 2);

/* displays message and calls checkForSetCorrespondingBit while passing in true/false depending on if the corresponding bit is set */
   puts("Test the present bit: ");
   checkForSetCorrespondingBit(pt_present(table, 2));

/* clears and displays the table along with message */
   puts("Clear the present bit: ");
   pt_clear_present(table,2);
   pt_display_entry(table,2);

/* displays message, calls checkForSetCorrespondingBit and passes through  */
   puts("Test for allocated bit: ");
   checkForSetCorrespondingBit(pt_allocated(table, 0));

/* sets the virtual_address and physical_address then displays their contents */
   puts("Test translate function: ");
   virtual_address = 0x0021;
   physical_address = pt_translate(table, virtual_address, perm_needed);
   pt_display_address("Virtual Address: ", virtual_address);
   pt_display_address("Physical Address: ", physical_address);

/* displays the table, removes entry 1 from the page table, displays the table again along with message */
   puts("Test unmap function: ");
   pt_display(table, 1);
   pt_unmap(table, 1);
   pt_display(table, 1);

   return 0;
 }

 /* function to determine if the number (corresponding bit) is true, false, or invalid */
void checkForSetCorrespondingBit(int number)
{
  if (number == -1)
  {
    puts("Invalid: Number cannot be negative.");
  }
  else if (number > 0)
  {
    puts("True: Number is greater than zero.");
  }
  else
  {
    puts("False.");
  }
}
