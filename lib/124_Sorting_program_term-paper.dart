List<int> countingSort(List<int> array) {
  if (array.isEmpty) return array;

  // Find the maximum element in the array
  int maxValue = array.reduce((currentMax, element) => currentMax > element ? currentMax : element);    
                                                                    //The maximum value also helps for the sorting,
                                                                    //it will be the limit of countArray. not the length of array

  // Create a counting array to store the frequency of each element
  List<int> countArray = List<int>.filled(maxValue + 1, 0);         //by setting the limit of countArray as the maxValue we can say that the array is 1 to MaxValue

  // Populate the countArray with the frequencies of elements       //and then this is where dupes are accounted for
  for (int element in array) {                                      //basically set the element from the input array to the countArray. so if the first encountered
    countArray[element]++;                                          // element is 4, it will set the 4th element in countArray aswell.
  }

  // Reconstruct the sorted array based on the countArray
  List<int> sortedArray = [];
  for (int i = 0; i < countArray.length; i++) {
    int count = countArray[i];
    while (count > 0) {
      sortedArray.add(i);
      count--;
    }
  }

  return sortedArray;
}

void main() {
  List<int> unsortedArray = [4, 2, 5, 1, 3, 4, 2];
  print("Unsorted Array: $unsortedArray");

  List<int> sortedArray = countingSort(unsortedArray);
  print("Sorted Array: $sortedArray");
}
