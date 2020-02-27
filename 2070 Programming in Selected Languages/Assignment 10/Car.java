package assignment10;

/**
 * @author Mikayla 
 * Due: March 20th, 2018
 * Course: 2070-08 Programming in Selected Languages
 * Description: This program will create a car class that keeps track of how 
 * much gas is in the tank and the odometer; it will also create an application
 * that will utilize the car class to drive the car unit it runs out of gas
 */
public class Car {
    private double distance, fuel, maxDistance, milesPerGallon, odometer;
    
    /**
     * This method, constructor, will assign gas to the field for the fuel and 
     * mpg to the car's milesPerGallon field. The odometer field will always be
     * zero. 
     * Precondition: None.
     * Postcondition: Sets gas to fuel, mpg to milesPerGallon, and odometer to
     * zero.
     * @param gas is the gas in the tank.
     * @param mpg is the miles per gallon for the car.
     */
    public Car(double gas, double mpg) {
        fuel = gas;
        odometer = 0.0;
        milesPerGallon = mpg;
    }
    
    /**
     * This method will return the fuel (amount of gas left in the tank).
     * Precondition: None.
     * Postcondition: Returns the amount of gas left in the tank.
     * @return fuel
     */
    public double getFuel() {
        return fuel; 
    }
    
    /**
     * This method will return the odometer reading.
     * Precondition: None.
     * Postcondition: Returns odometer.
     * @return odometer
     */
    public double getOdometer() {
        return odometer;
    }

    /**
     * This method will attempt to drive the car at this speed for this amount
     * of time as long as there is enough gas in the tank.
     * Precondition: Time and speed must be greater than or equal to zero.
     * Postcondition: Fuel will be subtracted from the tank and the odometer 
     * will be updated based on the distance.
     * @param speed the speed of the car
     * @param time the time traveled
     * @return the distance traveled
     */
    public double drive(double speed, double time) {
        maxDistance = (milesPerGallon * fuel);
        
        if (((speed * time) / milesPerGallon) < fuel ) { 
            for (int i = 0; i < (speed * time); i++) {
                odometer = (odometer + 1); 
            }
            fuel = (fuel - ((speed * time) / milesPerGallon));
            distance = (speed * time);
        }
        else { // ((distance / milesPerGallon) >= fuel) 
            for (int i = 0; i < maxDistance; i++) {
                odometer = (odometer + 1);
            }
            distance = (milesPerGallon * fuel);
            fuel = 0.0;
        }        
        return distance;
    }
}
