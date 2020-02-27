package mikaylawebberassignment14;

public class SpaceShuttle extends SpaceCraft {

    private final int engines;
    
    SpaceShuttle(String name, int seats, int engines) {
        super(name, seats);
        this.engines = engines;
    }

    public String toString() {
        return "Space Shuttle " + getName() + " has " + this.engines 
                + " engines.";
    }
}
