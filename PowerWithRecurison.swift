import Foundation

func getPower(base:Int,power:Int) -> Int {

    var answer=1
    if power==0{
        return 1
    }

    else{
       return  base * getPower(base:base , power:power-1)
    }
    
}
print(getPower(base:2 , power:4))