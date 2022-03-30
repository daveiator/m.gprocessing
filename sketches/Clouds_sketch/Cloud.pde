//language == processing

class Cloud {
    
    boolean c_static;

    private float c_radius;
    private float c_gFalloff;
    private static final float c_drag = 0.01f;
    private float c_mass;

    private FloatVector c_acceleration;
    private FloatVector c_position;
    private FloatVector c_velocity;

    private FloatVector t_relativePos;

    private color c_color;
    
    //Constructor
    public Cloud(FloatVector t_position, float t_radius, color t_color) {
        this.c_position = t_position;
        this.c_radius = t_radius;
        this.c_mass = 1f;
        this.c_color = t_color;
        this.c_acceleration = new FloatVector(0f, 0f);
        this.c_velocity = new FloatVector(random(-1f, 1f), random(-1f, 1f));

        this.t_relativePos = new FloatVector(0f, 0f);

        this.c_static = false;
    }
    
    private float c_gFalloff(Cloud other) {
        float t_x = this.c_position.dist(other.c_position) - this.c_radius - other.c_radius;
        
        t_x = map(t_x,0f,1000f,10f,0f);
        return -t_x * c_drag * 0.0001;
    }

    public void calculate (Cloud other) {
        t_relativePos = t_relativePos.add(other.c_position.sub(c_position));
        t_relativePos = t_relativePos.mul(c_gFalloff(other));
    }

    public void calculateBorder() {
        t_relativePos = t_relativePos.add(new FloatVector(width/2, height/2).sub(c_position)).mul(1);
    }



    public void draw () {
        //draw cloud
        fill(c_color);
        ellipse(c_position.x, c_position.y, c_radius*2, c_radius*2);
    }
    
    public void move() {

        if(!c_static) {

            //Apply forces
            
            float t_multiplyer = (1/c_mass) * .0001f;
            c_acceleration =t_relativePos.mul(t_multiplyer);
            c_velocity = (c_velocity.add(c_acceleration));

            //move cloud
            c_position = c_position.add(c_velocity);

            //constrain
            c_position.x = constrain(c_position.x, c_radius, width-c_radius);
            c_position.y = constrain(c_position.y, c_radius, height-c_radius);
        }
        //reset calculated forces
        t_relativePos = new FloatVector(0f, 0f);

    }
}