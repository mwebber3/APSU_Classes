package assignment14;

public abstract class SpaceCraft {

    private final int seats;
    private final String name;
    
    public SpaceCraft(String name, int seats) {
        this.name = name;
        this.seats = seats;
    }
    
    public String getName() {
        return name;
    }
    
    public int getSeats() {
        return seats;
    }
    
    @Override
    public String toString() {
        return getName() + " " + getSeats();
    }
}
