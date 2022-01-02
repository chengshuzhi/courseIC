import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Int "mo:base/Int";


func quicksort(sortArray: [var Int]) {
    var low = 0;
    var high = 0 ;
    if (sortArray.size() >= 1) {
        high := sortArray.size() -1;
        quickSort (sortArray, low, high);
    } else {
        return ;
    };
    
};

func quickSort (sortArray: [var Int], low: Nat, high: Nat) {
    if (low < high ) {
        var index_ = Partition(sortArray, low, high);
        //Debug.print(Nat.toText(index_));
        if ( index_ > 0 ) {
            quickSort (sortArray,low, index_ -1);
        };
        
        quickSort (sortArray, index_ + 1, high);
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

var testArray : [Int] = [45,23,18,30,68,2,26];
var tempArray: [var Int] = Array.thaw(testArray);
quicksort(tempArray);
var testArrayAfter : [Int] = Array.freeze(tempArray);
// var tempIter: Iter.Iter<Int> = Iter.fromArray(testArrayAfter); 
// var tempText : Text = Text.fromIter(tempIter);
// Debug.print(tempText);
var temp : Int  = testArrayAfter[0];
Debug.print(Int.toText(temp));

