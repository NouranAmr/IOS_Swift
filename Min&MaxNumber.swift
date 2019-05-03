import Foundation

func callMinMax( array : [Int]) -> (min :Int , max:Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0];
    var currentMax = array[0];
    for value in array[1..<array.count]
    {
        if value < currentMin
        {
            currentMin = value
        }
        else if value > currentMax
        {
            currentMax = value
        }
    }
    return (currentMin , currentMax)
}
 if let bounds = callMinMax( array :[1,2,-1,10]){
print(bounds.min)
print(bounds.max)
 }
