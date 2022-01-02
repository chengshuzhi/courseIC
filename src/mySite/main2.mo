import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Int "mo:base/Int";

actor {

    public func qsort(sortArray: [Int]) : async [Int] {
        var low = 0;
        var high = 0 ;
        var mutableArray: [var Int] = Array.thaw(sortArray);
        if (mutableArray.size() >= 1) {
            high := mutableArray.size() -1;
            quickSort (mutableArray, low, high);
        } else {
            return sortArray;
        };
        return Array.freeze(mutableArray);
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