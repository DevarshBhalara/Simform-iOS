print("Hello World!\n")

//Variables
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

//Operator
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

print((myIntT<myIntT2) ? "Second value is greater" : "First value is greater")


