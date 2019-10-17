#!/bin/bash
#4100 Operating Systems 
#Due September 27, 2017
#
touch contacts.dat
# creates file contacts.dat or if it exists edits it 
echo "Select one of the following options:"
echo "-------------------------------------"
echo "1. Add a contact"
echo "2. Remove a contact"
echo "3. Find a contact"
echo "4. List all contacts"
echo "5. Exit the program"
# menu for the user to select from
read -p "Enter a choice (1-5): " choice
echo
#
case "$choice" in
     1)
          read -p "Enter a name: " name
          read -p "Enter an email address: " email
          if grep -q "$name" contacts.dat; then
               echo "There is already an entry for $name."
          else
               echo "$name, $email" >> contacts.dat
          fi
          ;;
          # adds a name and email based on user input to the contacts.dat file
          # if the name exists it will display a message stating so
     2)
          read -p "Enter a name: " name
          if grep -q "$name" contacts.dat; then
               grep -v "$name" contacts.dat > deletedNames.dat
          else
               echo "$name does not exist in the file."
          fi
          mv deletedNames.dat contacts.dat
          ;;
          # removes a contact based on user input and moves it to a deletedNames.dat file
          # if the name is not found it displays message to the command line
          #changes the deletedNames.dat file to contacts.dat to reflect contact removal
     3)
          read -p "Enter a name: " name
          if grep -q "$name" contacts.dat; then
               grep "$name" contacts.dat
          else
               echo "The $name was not found."
          fi
          ;;
          # finds a contact based on user input and then displays the contact
          # if the contact is not found it displays a message to the command line
     4)
          sort -k 2 contacts.dat 
          ;;
          # sorts the contacts.dat file based on the name
          # outputs the results to the command line 
     5)
          echo "Thank you for using this program!"
          exit 1
          ;;
          # displays goodbye message
          # breaks
     *)
          echo "Please enter a valid choice (1-5)."
          ;;
          # if the user does not select 1-5 it displays message to command line
esac
