//language == processing

class Cloud {
    
    boolean c_static;

    private float c_radius;
    private float c_gFalloff;
    private float c_drag;
    private float c_mass;

    private FloatVector c_acceleration;
    private FloatVector c_position;
    private FloatVector c_velocity;
    private FloatVector c_gravity;

    private color c_color;
    
    //Constructor
    public Cloud(FloatVector t_position, float t_radius, color t_color) {
        this.c_position = t_position;
        this.c_radius = t_radius;
        this.c_drag = .01;
        this.c_mass = 1;
        this.c_color = t_color;
        this.c_acceleration = new FloatVector(0f, 0f);
        this.c_velocity = new FloatVector(random(-1, 1), random(-1, 1));
        this.c_gravity = new FloatVector(0f, 0f);

        this.c_static = false;
    }
    
    private float c_gFalloff(Cloud other) {
        float t_x = this.c_position.dist(other.c_position) - this.c_radius - other.c_radius;
        return t_x;
    }

    public void calculate (Cloud other) {
        
        FloatVector t_relativePos = other.c_position.sub(c_position).mul(c_gFalloff(other));


        //Apply forces
        float t_multiplyer = c_drag * (1/c_mass);
        c_acceleration = t_relativePos.mul((c_mass * 1f));
        c_velocity =    c_velocity.add(c_acceleration).mul(t_multiplyer);
    }



    public void draw () {
        //draw cloud
        fill(c_color);
        ellipse(c_position.x, c_position.y, c_radius, c_radius);
    }
    
    public void move() {
        //move cloud
        c_position = c_position.add(c_velocity);
    }
}