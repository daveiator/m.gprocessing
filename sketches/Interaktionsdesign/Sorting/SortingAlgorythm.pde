abstract class SortingAlgorythm {

    protected int[] primaryIndexes;
    protected int[] secondaryIndexes;
    protected boolean finished;


    public SortingAlgorythm() {
        this.primaryIndexes = new int[0];
        this.secondaryIndexes = new int[0];
        this.finished = false;
    }

    public abstract int[] sortIter(int[] array);

    public void draw() {
        for (int i = 0; i < values.length; i++) {
        stroke(255);
        line(i, height, i, height - values[i]);
        }
    }

    private void swap(int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    public int[] get_primaries() {
        return primaryIndexes;
    }
    public int[] get_secondaries() {
        return secondaryIndexes;
    }

    public boolean is_finished() {
        return finished;
    }
}