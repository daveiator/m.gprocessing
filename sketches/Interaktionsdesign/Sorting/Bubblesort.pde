class Bubblesort extends SortingAlgorythm {

    private int i, j;
    public Bubblesort() {
        super();
        i = 0;
        j = 0;
    }

    public int[] sortIter(int[] values) {
        if(i >= values.length - 1) {
            super.primaryIndexes = new int[0];
            super.secondaryIndexes = new int[0];
            super.finished = true;
            return values;
        }

        if (values [j] > values [j + 1]) {
            super.swap(values, j, j + 1);

            super.primaryIndexes = new int[] {j};
            super.secondaryIndexes = new int[] {j + 1};
        }
        j++;
        if (j == values.length - i - 1) {
            j = 0;
            i++;
        }
        return values;
    }
}