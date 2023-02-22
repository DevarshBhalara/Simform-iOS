import UIKit

var greeting = "Hello, playground"

var myVariable = 60
let myConstent = 34
var myFloat,myFloat2,myFloat3 : Float

var myvar2 = 0


var myString = "Hello " + String(myConstent)

print(myString)

print("My weight is \(myVariable + myVariable)  !!")

let mulLineString = """
Hello, this is "Multiline Line String "
example.
"""

var b = 10

print(mulLineString)


//keyword as Variable
var `let` = "Lettt"
var `if` = "hello"

print(  `if`, `let`)

var int32Test = UInt32.min
var int8Test = UInt32.max

print(int8Test)

let twoThousand: UInt16 = 2000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
print(twoThousandAndOne)

//typealias
typealias cusString = String
var myString1: cusString = "Hello"
print(myString1)


var a : Int?

//tuple
let tupleEx = (1,"One")
let (number,stringgg) = tupleEx
print(tupleEx.0)
print(stringgg)

let httpStatusCode = (statuCode : 200 , description : "ok")
print(httpStatusCode.description)

//if
var a1 =  20, b1 = 30
if a1>b1 {
    print("A is greater")
}else{
    print("B is grater")
}

var temp = 90
if temp <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temp >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

print((a1<b1) ? "B1 is greater" : "A1 is greater")


//loops and array,dictonary
var arr: [Int] = []
var myDict: [String:Int] = [:]


let myArr = [1,2,3,4,5]

for a in myArr{
    print(a)
}

var marks = [50,60,45,66]
var total = 0
for mark in marks{
    total = total + mark
}
print()
print("Arry befoer operation")
for mark in marks{
    print(mark)
}

print(marks.isEmpty)
print(marks.count)
print(marks.first ?? "no first value")
print(marks.last ?? "no last value" )
marks.append(30)
marks.append(contentsOf: [70,80,44])
marks.insert(444, at: 2)
marks.remove(at: 1)
marks.removeLast()
print("Arry after operation")
for mark in marks{
    print(mark)
}

print()

if let i = marks.firstIndex(of: 50){
    marks[i] = 55
}
print("Arry after changing 50 to 55")

for mark in marks{
    print(mark)
}

print()
print("Hello hello  " , "  Hello ", separator: "separator")

print()


print(total)

print()

var myDict2:[Int:String] = [1:"One",2:"Two",3:"Three"]
for (key , value) in myDict2{
    print("Key : \(key) , Value : \(value)" )
}

print()

var myArrDict = [
    "Prime" : [2,3,5,7,11,13] ,
    "Fibonacci" : [1,1,2,3,5,8] ,
    "Square" : [1,4,9,16,25]
]

for (keyArrDict, arrDict) in myArrDict {
    print("Key : \(keyArrDict) " )
    for valArr in arrDict {
        print(valArr)
    }
}

print()
  
var forWhile:Int = 0
while(forWhile <= 9){
    print(forWhile)
    forWhile += 1
}
print()
var rpWhile = 0
repeat{
    print(rpWhile)
    rpWhile += 1
}while(rpWhile<10)

print()

var total1 = 0
for i in 0..<4 {
    total1 += i
    print(total1)
}
print(total1)

print()
//nil or not nil
var myStrNil : String?
print( myStrNil ?? "Nil value" )


var myChar : Character?
switch myChar {
case "x" :
    print("X character is selected")
case "y":
    print("Y character is selected")
case "z":
    print("z Character is selected")
case nil:
    print("Value is nil")
default :
    print("Not any character is matches")
}

var newSwitch = 23
switch newSwitch {
case 0:
    print("Fail")
case 1..<10:
    print("Poor")
case 10..<20:
    print("NOt bad")
case 20..<30:
    print("Good")
case 30..<40:
    print("Verry Good")
default:
    print("Excellent")
}

//2D array
let numbers1 = [[Int]](repeating: [Int](repeating : 2 , count : 4), count: 6)
for arrrrr in numbers1{
    print(arrrrr)
}

print("\n \" Hello this is in \" double quoate ")

//string
var stringMyString:String = "Hello"
stringMyString.append(" appended")
print(stringMyString)

print(stringMyString[stringMyString.startIndex]   )
print(stringMyString[  stringMyString.index(after: stringMyString.startIndex) ]  )
print( stringMyString[stringMyString.index(stringMyString.startIndex , offsetBy: 2)] )

for index in stringMyString.indices{
    print(stringMyString[index])
}

stringMyString.insert("A", at: stringMyString.endIndex)
print(stringMyString)

stringMyString.insert(contentsOf: "Insert ", at: stringMyString.startIndex )
print(stringMyString)
