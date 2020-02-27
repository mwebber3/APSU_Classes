package mikaylawebberassignment14;

public class SpaceStation extends SpaceCraft {

    private final int ports;
    
    public SpaceStation(String name, int seats, int ports) {
        super(name, seats);
        this.ports = ports;
    }
    
    int getPorts() {
        return ports;
    }
     
    public String toString() {
        return "Space Station " + getName() + " has " + getPorts() + " ports.";
    }
    
}
