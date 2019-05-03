import Foundation

func getPower(base:Int,power:Int) -> Int {

    var answer=1
    for index in 1...power{

        answer *= base
    }
    return answer
    
}
print(getPower(base:5 , power:3))