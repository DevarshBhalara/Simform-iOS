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



while ans < N {
    ans *= 2
    if(ans > N){
        break;
    }else{
        print(ans)
    }
}

/*repeat{
    print(ans)
    ans *= 2
    
}while(ans <= N)*/

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

var checkPrime : Int = 19
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
    
