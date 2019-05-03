import Foundation

func getFactorial(number:Int) -> Int {

    var answer=1
    for index in 1...number{

        answer *= index
    }
    return answer
    
}
print(getFactorial(number:4))