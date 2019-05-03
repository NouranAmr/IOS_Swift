import Foundation

func swap(number1: inout Int , number2:inout Int){
    var temp = number1
    number1 = number2
    number2 = temp
}

var num1 = 10
var num2 = 6
swap (number1 : &num1 , number2 : &num2)
print(num1)
print(num2)
 
