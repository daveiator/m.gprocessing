//language == processing

class FloatVector {

    private float x;
    private float y;

    public FloatVector(float _x, float _y) {
        this.x = _x;
        this.y = _y;

    }

    public FloatVector mul(FloatVector other) {
        return new FloatVector(this.x * other.x, this.y * other.y);
    }
    public FloatVector mul(float other) {
        return new FloatVector(this.x * other, this.y * other);
    }


    public FloatVector div(FloatVector other) {
        return new FloatVector(this.x / other.x, this.y / other.y);
    }


    public FloatVector add(FloatVector other) {
        return new FloatVector(this.x + other.x, this.y + other.y);
    }


    public FloatVector sub(FloatVector other) {
        return new FloatVector(this.x - other.x, this.y - other.y);
    }


    public float dist(FloatVector other) {
        return (float) Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2));
    }
}