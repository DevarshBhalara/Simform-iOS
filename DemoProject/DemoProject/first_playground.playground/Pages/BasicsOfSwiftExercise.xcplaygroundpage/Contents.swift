print("Hello World!\n")

/**
 Variables
 **/
//Create variables of different types and print it

var myInt: Int = 3
var myIntRun : Int = 150
var myFloat: Float = 45.5
var myDouble: Double = 130.2333333333
var myString : String = "Devarsh"
var myBoolean: Bool = true
var myCharacter: Character = "D"

print("This is \(myBoolean) that \(myString) \"\(myCharacter)\" Scored \(myIntRun) Runs in \(myInt) matches with Average of \(myFloat) and Strike rate of \(myDouble) ")


//Create one integer and perform addition with 5 to that and print values

var a:Int = 30
print( "Addition is \(a+5)")

//There is one constant with value of interest rate (15%) create one playground for calculate interest for given amount and duration

let iRate = 15
var amout = 5000
var duration = 2

var interest = (amout * iRate * duration)/100
print("Interest is \(interest) \n")

/**
 Operator
 **/
//Create example for String concate using operators

var myStringFirst : String = "My name is "
var myStringSecond : String = "Devarsh"

print("\(myStringFirst + myStringSecond)")


//Create one example for show usage of operator's addition, multiplication, division for integers and floats

var intA:Int = 20
var intB:Int = 10

print(intA+intB)
print(intA-intB)
print(intA*intB)
print(intA/intB)

var floatA: Float = 10.25
var floatB: Float = 20.44

print(floatA+floatB)
print(floatA-floatB)
print(floatA*floatB)
print(floatA/floatB)

print()


//What is turnery operator and show example of usage?
//Turney operator use three operands

var myIntT : Int = 10
var myIntT2: Int = 20

print((myIntT<myIntT2) ? "Second value is greater \n" : "First value is greater \n")


/**
 Control Flow
 */

//Print the powers of 2 that are less than or equal to N.

var N:Int = 100
var num : Int = 1
var ans : Int = 1



/*while ans < N {
    ans *= 2
    if(ans > N){
        break;
    }else{
        print(ans)
    }
}*/

repeat{
    print(ans)
    ans *= 2
    
}while(ans <= N)

/*for _ in 1...N{
    ans = ans * 2
    if(ans > N){
        break;
    }else{
        
        print(ans)
    }
}*/

//Given an integer N draw a square of N x N asterisks. Look at the examples.
var squareN:Int = 3
for _ in 1...squareN{
    print()
    for _ in 1...squareN{
        print("*" , terminator: "")
    }
}
print()
//Given an integer N draw a triangle of asterisks. The triangle should have N lines, the i-th line should have i asterisks on it.
var triN:Int = 5
print()
for i in 1...triN{
    for _ in 1...i{
        print("*", terminator: "")
    }
    print()
}

print()

//Given an integer N draw a pyramid of asterisks. The pyramid should have N lines. On the i-th line there should be N-i spaces followed by i*2-1 asterisks.

var pyN: Int = 5
for i in 1...pyN{
    for _ in 1...(pyN-i+1){
        print(terminator: " ")
    }
    for _ in 1..<i*2{
        print("*" , terminator: "")
    }
    print()
}
    
print()
//You are given a number. Print "prime" if the number is a prime and "not prime" otherwise. A number is a prime if it has exactly 2 distinct divisors (1 and itself).

var checkPrime : Int = 18
var myN = checkPrime/2
var count = 0
var myDivisiable : String = ""

for i in 2...myN{
    if checkPrime%i == 0 {
        myDivisiable.append("Prime")
        print("\(checkPrime) is not Prime")
        break;
    }
}

if myDivisiable.isEmpty == true {
    print("\(checkPrime) is Prime number only divisible by 1 and \(checkPrime)")
}


/*if count>2{
    print("\(checkPrime) is not Prime")
}else{
    print("\(checkPrime) is Prime number only divisible by 1 and \(checkPrime)")
}*/
    
print()

/**
 String
 */

//Write a Swift program to create a new string made of a copy of the first two characters of a given string. If the given string is shorter than length 2, return whatever there is.


var myStr1: String = "Simform"

if myStr1.count <= 2 {
    print(myStr1)
}else{
    //var index1 = myStr1.index(myStr1.startIndex, offsetBy: 2)
    //var ansString = myStr1[..<index1]
    //print(ansString)
    var newStrr  = String(myStr1.prefix(2))
    print(newStrr)

}

print()


//Write a Swift program to create a new string without the first and last character of a given string. The string length must be at least 2.
//Input: “Simform”
//Output: imfor

myStr1.remove(at: myStr1.startIndex)
myStr1.remove(at: myStr1.index(before: myStr1.endIndex))
print(myStr1)


//Write a Swift program that accept two strings and return their concatenation, except the first char of each string. The given strings length must be at least 1.
//Input: "Swift", "Examples"
//Output: wiftxamples

var str1 = "swift"
var str2 = "examples"

if str1.count == 0 || str2.count == 0 {
    print("String length must be at least 1 of both string")
}else{
    str1.remove(at: str1.startIndex)
    str2.remove(at: str2.index(before: str2.endIndex))

    var str3 = str1 + str2
    print(str3)
}


//Write a Swift program to move the first two characters of a given string to the end. The given string length must be at least 2.
//Input: Swift
//Output: iftSw

var shiftString : String = "Swift"
var indexShiftString = shiftString.index(shiftString.startIndex, offsetBy: 2)
var firstTwoShift = shiftString[..<indexShiftString]
print(indexShiftString)
print(shiftString)

shiftString.remove(at: shiftString.startIndex)
shiftString.remove(at: shiftString.startIndex)

shiftString += firstTwoShift
print(shiftString)

//Write a Swift program to test if a given string starts with "Sw".
//Input: Swift
//Output: true

var checkString: String = "Swift"

if checkString[checkString.startIndex] == "S" {
    if checkString[checkString.index(after: checkString.startIndex)] == "w" {
        print(true)
    }else{
        print(false)
    }
}else{
    print(false)
}


//Write a Swift program to create a new string made of the first and last n chars from a given string. The string length will be at least n.
//Input: “Simform Solutions”, 3
//Output: Simons

var firstLastChar: String = "Simfor Solutions"
var charss = 3

if firstLastChar.count < charss {
    
    print("String size must be at least equal to n")
    
}else{
    
    var indexx = firstLastChar.index( firstLastChar.startIndex , offsetBy: charss)
    var indexx1 = firstLastChar.index(firstLastChar.endIndex, offsetBy: -charss)
    
    var strAnss = firstLastChar [..<indexx] + firstLastChar[indexx1...]
    print(strAnss)

}

//Try all string methods: https://developer.apple.com/documentation/swift/string

let cafe1 = "Cafe\u{301}"
let cafe2 = "Café"
print(cafe1)

let name = "Devarsh Bhalara"
let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
print(name[..<firstSpace])

print(Array(name))
print(name.unicodeScalars.map{$0.value})


var earth:String = "🌍"
print(earth)

print()

//Write a Swift program to check whether the first element and the last element of a given array of integers are equal. The array length must be 1 or more.
//Input: [1,2,3,1]
//Output: true

var myArrr = [1,2,3,1]
if !myArrr.isEmpty {
    print(myArrr.first == myArrr.last)
}else{
    print("Array is empty")
}


//Write a Swift program to create a new array with double the length of a given array of integers and its last element is the same as the given array. The given array will be length 1 or more. By default, a new integer array contains all 0's.
//Input: [1,2,3,4]
//Output: [0,0,0,0,0,0,0,4]

var myArr2 = [1,2,3,4]
var len = myArr2.count * 2

var myArr2_d = Array(repeating: 0, count: len-1)
myArr2_d.append(myArr2.last!)
print(myArr2_d)


//Write a Swift program to create a new array, taking first two elements from a given array of integers. If the length of the given array is less than 2 use the single element of the given array
//Input: [0,1,2,3]
//Output: [0,1]

var myArr3 = [0,1,2,3]

if myArr3.count > 1 {
    var myArr3_ans = myArr3.prefix(2)
    print(myArr3_ans)
}else{
    var myArr3_ans = myArr3.prefix(1)
    print(myArr3_ans)
}

//Write a Swift program to take one array and find out maximum number from that array
//Input: [0,50,100,20,80,150]
//Output: 150

var myArr4 = [0,50,100,20,80,150]
var max_arr = myArr4.max()
print(max_arr!)


//Write a Swift program to take one array and sort it in descending order.
//Input: [0,5,6,2,10]
//Output: [10,6,5,2,0]


var myArr5 = [0,5,6,2,10]
myArr5.sort(by: > )
print(myArr5)

print()

//Print all the numbers from listOfNumbers that are divisible by at least one number from divisors
//Input: var listOfNumbers = [1, 2, 3, 10, 100]
//var divisors = [2, 5]
//Output: 2,10,100

var listOfNumbers = [1, 2, 3, 10, 100]
var divisors = [2, 5]

for i in listOfNumbers {
    for j in divisors {
        if i % j == 0 {
            print(i)
            break
        }
    }
}

//Try all Array methods: new
var students = ["Ben", "Ivy", "Jordell"]
students.append("Devarsh")
students.append(contentsOf: ["John" , "Paul"])
print(students)
students.insert("Walk", at: 2)
print(students)

students.remove(at: 0)
print(students)
students.removeLast()
print(students)

if let  i = students.firstIndex(of: "Walk") {
    students[i] = "Walker"
}
print(students)

/**
 Dictonary
 */

//You are given a dictionary code of type [String:String] which has values for all lowercase letters. The codedictionary represents a way to encode a message. For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz". You are also given a encodedMessage which contains only lowercase letters and spaces. Use the codedictionary to decode the message and print it. Write a Swift program to decode the message and print final output string

var code = [

"a" : "b",

"b" : "c",

"c" : "d",

"d" : "e",

"e" : "f",

"f" : "g",

"g" : "h",

"h" : "i",

"i" : "j",

"j" : "k",

"k" : "l",

"l" : "m",

"m" : "n",

"n" : "o",

"o" : "p",

"p" : "q",

"q" : "r",

"r" : "s",

"s" : "t",

"t" : "u",

"u" : "v",

"v" : "w",

"w" : "x",

"x" : "y",

"y" : "z",

"z" : "a"

]

var encodedMessage = "uijt nfttbhf jt ibse up sfbe"


var decoded_msg = encodedMessage.map({ch in
    code.first(where: { String(ch) ==  $0.value })?.key ?? " "
}).joined()

print(decoded_msg)

//let bbb = code.filter{$0.value == "u"}


//You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called firstNames that contains only the values for “firstName” from each dictionary.
//Output: firstNames = ["Calvin","Garry","Leah","Sonja","Noel"]

var people: [[String:String]] = [

[

"firstName": "Calvin",

"lastName": "Newton"

],

[

"firstName": "Garry",

"lastName": "Mckenzie"

],

[

"firstName": "Leah",

"lastName": "Rivera"

],

[

"firstName": "Sonja",

"lastName": "Moreno"

],

[

"firstName": "Noel",

"lastName": "Bowen"

]

]

var firstnamee : [String] = []

for arrD in people {
    firstnamee.append(arrD["firstName"]!)
}
print(firstnamee)
print()
//You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called fullNames that contains the values for “firstName” and “lastName” from the dictionary separated by a space.

var fullName : [String] = []

for arrD in people {
    fullName.append( arrD["firstName"]! + " " + arrD["lastName"]! )
}
print(fullName)


//You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Find the person with the lowest score and print his full name.
var people2 : [[String:Any]] = [

[

"firstName": "Calvin",

"lastName": "Newton",

"score": 13

],

[

"firstName": "Garry",

"lastName": "Mckenzie",

"score": 12

],

[

"firstName": "Leah",

"lastName": "Rivera",

"score": 10

],

[

"firstName": "Sonja",

"lastName": "Moreno",

"score": 3

],

[

"firstName": "Noel",

"lastName": "Bowen",

"score": 16

]

]
var min : Int = Int.max
/*var index = 0
for (i, arrD) in people2.enumerated()  {
    if min > (arrD["score"] as! Int) {
        index = i
        min = (arrD["score"] as! Int)
    }
}
 print(arrD[index]["firstName"])
 */

var fullname = ""
for arrD in people2 {
    if min > (arrD["score"] as! Int) {
        
        min = (arrD["score"] as! Int)
        fullname = arrD["firstName"] as! String
        fullname.append(arrD["lastName"] as! String)
    }
}


print(fullname)

print()
//You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Print the leaderboard in the following format:

for arrD in people2 {
    print(arrD["firstName"] as! String ,terminator: " ")
    print(arrD["lastName"] as! String ,terminator: " ")
    print(" - ",terminator: " ")
    print(arrD["score"] as! Int)
    
}

//You are given an array of integers. Find out the frequency of each one.The frequency of a number is the number of times it appears in the array.Print the numbers in ascending order followed by their frequency.

var numbers_arr = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var freqDict : [Int:Int] = [:]

for i in numbers_arr {
    if freqDict.keys.contains(i) {
        var ind :Int = freqDict[i]!
        ind = ind + 1
        freqDict[i] = ind
    }else{
        freqDict[i] = 1
    }
}
print(freqDict)

freqDict.sorted(){
    $0.key < $1.key
}.forEach{
    print("\($0) \($1)")
}

/**
 Optionals
 */
//Create an example of demonstrating How to declare optionals in swift?

var exOptional: Int?

//What is force unwrapping in optionals show usage in example.
//print(exOptional!)

//Create one example of show usage of optional binding Create one example using if-let Create one example using guard-let


var exOptionalBinding:Int?

if let i = exOptionalBinding {
    print("Optional has some value \(i)")
}else{
    print("Optional doesn't have any value ")
}


func check(_ num1:Int? = nil){
    guard let num1 = num1 else{
        print("Num1 is nil")
        return
    }
    
   print("Value is \(num1)")
}

check(7)


//Create one example using nil colloison operator

print(exOptionalBinding ?? "No value")


