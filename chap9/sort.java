public class sort {
    public static void main(String[] args) {
        int[] data1 = new int[10];// 元々のデータ
        int ndata = data1.length;// データの個数
        int[] data1r = new int[ndata];// 結果
        for (int i = 0; i < data1.length; i++) {
            data1[i] = 9 - i;
            System.out.print(data1[i]);
        }
        System.out.println();

        for (int i = 0; i < ndata; i++) {
            push_heap(data1, ndata, i);
        }
    }

    public static void push_heap(int[] data1, int x, int k) {
        while (data1[k] > data1[k / 2] && k > 1) {
            swap(data1, k);
            k = k / 2;
        }
    }

    private static void swap(int[] data1, int k) {
        if (data[k] < data[k / 2]) {// 親の値が小さければ値を交換
            int i = data[k];
            data[k] = data[k / 2];
            data[k / 2] = i;
        }
    }
}