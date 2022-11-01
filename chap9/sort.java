public class sort {
    static int[] data1 = { -1, 1, 3, 5, 7, 9, 2, 4, 6, 8, 3, 1 };// 元々のデータ
    static int ndata = data1.length;// データの個数
    static int[] data1r = new int[ndata];// push_heap後
    static int size = 0;
    static int[] sortdata = new int[ndata];

    public static void main(String[] args) {
        System.out.println("Original");
        for (int i = 1; i < ndata; i++) {
            System.out.print(data1[i] + " ");
        }
        System.out.println();

        for (int i = 1; i < ndata; i++) {
            push_heap(data1r, data1[i]);
        }
        System.out.println("push_heap");
        printArray(data1r);
        System.out.println("delete_maximum");
        for (int i = ndata - 1; i >= 1; i--) {
            sortdata[i] = delete_maximum(data1r);
        }
        printArray(sortdata);

    }

    private static void push_heap(int[] data, int x) {
        size++;
        data[size] = x;
        int k = size;
        while (data[k] > data[k / 2] && k > 1) {
            // 親の値が小さければ値を交換
            int i = data[k];
            data[k] = data[k / 2];
            data[k / 2] = i;

            k = k / 2;
        }
    }

    private static void printArray(int[] array) {
        for (int i = 1; i < array.length; i++) {
            System.out.print(array[i] + " ");
        }
        System.out.println();
    }

    private static int delete_maximum(int[] data) {
        int sortdata = data[1];
        data[1] = data[size];// 葉のデータを根に移動
        data[size] = -1;
        size--;
        int k = 1;
        int big = 0;
        while (2 * k <= size) {// 子を持つか判定
            if (2 * k == size) {// 子が1つの場合
                if (data[k] < data[2 * k]) {// 親子の値を比較
                    int i = data[k];// 親が小さい場合は交換
                    data[k] = data[2 * k];
                    data[2 * k] = i;
                    k = 2 * k;
                } else {
                    break;
                }
            } else {// 子が2つの場合
                if (data[2 * k] > data[2 * k + 1]) {
                    big = 2 * k;
                } else {
                    big = 2 * k + 1;
                } // 大きいデータを持つ子を見つける
                if (data[k] < data[big]) {
                    int i = data[k];
                    data[k] = data[big];
                    data[big] = i;
                    k = big;
                } else {
                    break;
                }

            }
        }
        return sortdata;
    }
}