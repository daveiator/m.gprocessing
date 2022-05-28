int[][] scaleArr = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}};
int[][] spielPlan = {
                        {1,1,0,0,2,2},
                        {2,1,0,0,2,2},
                        {2,1,0,0,0,0},
                        {2,1,0,0,0,0},
                        {2,1,1,1,1,1},                       
                    };
color[] colorArr = {#FF0000, #00FF00, #0000FF, #FFFF00};


void setup() {
    size(500, 500);    
}

void draw() {
    translate(width/2, height/2);
    background(#E20008);
    for(int i = 0; i < 4; i++) {
        pushMatrix();
            scale(scaleArr[i][0] * .5f, scaleArr[i][1] * .5f);
            fill(#F2DA91);
            rect(1, 1, width - 2, height - 2);
        popMatrix();
    }

    for(int i = 0; i < spielPlan.length; i++) {
        for(int j = 0; j < spielPlan[i].length; j++) {
            pushMatrix();
                translate(i * (width / spielPlan.length), j * (height / spielPlan[i].length));
                fill(255);
                rect(0, 0, width / spielPlan.length, height / spielPlan[i].length);
            popMatrix();
        }
    }
}