import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor {
    func fib(n: Nat): Nat {
        let x = if (n <= 1) 1 else {
        let y = fib(n -1);
            fib(n -2) + y
        }
    };

    public func fibonacci(x: Nat): async Nat {
        fib(x)
    };

    //TODO quicksort : [var Int] -> ()

    func quicksort(sortArray: [var Int]) {
        var low = 0;
        var high = sortArray.size() -1;
        quickSort (sortArray, low, high);
    };

    func quickSort (sortArray: [var Int], low: Nat, high: Nat) {
        if (low < high ) {
            var index = Partition(sortArray, low, high);
            quickSort (sortArray,low, index-1);
            quickSort (sortArray, index+1, high);
        };
    };

    func Partition(sortArray: [var Int], low: Nat, high: Nat): Nat {
        var leftIndex = low;
        var rightIndex = high;
        var index = sortArray[low];

        while (leftIndex < rightIndex) {
            while (sortArray[rightIndex] >= index and leftIndex < rightIndex) {
                rightIndex -= 1;
            };

            if (leftIndex < rightIndex) {
                sortArray[leftIndex] := sortArray[rightIndex];
                leftIndex += 1;
            };

            while (sortArray[leftIndex] < index and leftIndex < rightIndex) {
                leftIndex += 1;
            };
            if (leftIndex < rightIndex) {
                sortArray[rightIndex] := sortArray[leftIndex];
                rightIndex -= 1;
            };
        };
        
        sortArray[leftIndex] := index;
        return leftIndex;

    };

}