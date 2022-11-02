class sort {
    public static void main(String[] args) {
        int[] data = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 0, 1, 2 };
        buble(data);
        for (int d : data) {
            System.out.println(d);// 出力
        }
    }

    private static void buble(int[] data) {
        int max_index = 0;
        int max = 0;
        for (int i = data.length - 1; i > 0; i--) {
            max = data[0];
            max_index = -0;
            for (int j = 1; j <= i; j++) {
                if (data[j] >= max) {
                    max = data[j];
                    max_index = j;
                }
            }
            int m = data[max_index];
            data[max_index] = data[i];
            data[i] = m;
        }
    }
}