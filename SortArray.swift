import Foundation

func sortArray(array : [Int])-> [Int] {
   var resultArray:[Int] = array
    for index in 0..<array.count
    {
        for i in 0..<array.count
        {
                if resultArray[index] < resultArray[i]
                {
                        var temp = resultArray[i]
                        resultArray[i] = resultArray[index]
                        resultArray[index] = temp
                }
        }
    }
    return resultArray
}
let array = sortArray(array : [-1 ,10,2])
for item in array{

print(item)
}
 
