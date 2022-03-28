//language == processing

class Cloud {
    
    boolean c_static;

    private float c_radius;
    private float c_gFalloff;
    
    private PVector c_acceleration;
    private PVector c_position;
    private PVector c_velocity;
    private PVector c_gravity;

    private color c_color;
    
    //Constructor
    public Cloud(PVector t_position, float t_radius, color t_color) {
        this.c_position = t_position;
        this.c_radius = t_radius;
        this.c_color = t_color;
        this.c_acceleration = new PVector();
        this.c_velocity = new PVector(random(-1, 1), random(-1, 1));
        this.c_gravity = new PVector();

        this.c_static = false;
    }
    
    private float c_gFalloff(float x) {
        return x;
    }
    
    public void draw () {
        //draw cloud
        fill(c_color);
        ellipse(c_position.x, c_position.y, c_radius, c_radius);
    }
    
    public void move() {
        //move cloud
        c_position = PVector.add(c_position, c_velocity);
    }
}