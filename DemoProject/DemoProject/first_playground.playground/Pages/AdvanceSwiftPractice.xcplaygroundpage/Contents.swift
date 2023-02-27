import Foundation

var greeting = "Hello, playground"

func student (name : String) -> String {
    return name
}

print("Hello \(student(name: "Devarsh")) ")

func multiplication (n1:Int , n2:Int) -> Int? {
   
    return n1*n2
}

var mulans = multiplication(n1: 10, n2: 2)
print(mulans ?? 0 )

//return two value
func largSmallArray (array:[Int]) -> (large:Int,small:Int) {
    var l = array[0]
    var s = array[0]
    
    for i in array[1..<array.count] {
        if i > l {
            l = i
        }else if s > i {
            s = i
        }
    }
    
    return (l,s)
}

let ans = largSmallArray(array: [1,10,-3,4,7])
print("Large is \(ans.large) ans Small is \(ans.small)")

//returing optional
func test(no1: Int) -> Int? {
    if no1 == 23 {
        return no1
    }else {
        return nil
    }
    
}

if let _ = test(no1: 2) {
    print("Parameter is not nil")
}else{
    print("returning nil")
}

//variadic param
//pass multiple parameter

func mulParam (numbers:  Int...) -> Int
{
    var sum = 0
    for i in numbers {
        sum += i
    }
    return sum
}

print(mulParam(numbers: 1,2,3,5))
print(mulParam(numbers: 1,2,3,5,78))

//inout
func swap(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var valA = 10
var valB = 20
swap(a: &valA, b: &valB)
print("Value of A \(valA) and B \(valB)")

var num1: Int = 1
var char1: Character = "a"

func addd(n1: Int , n2: Int) -> Int {
    return n1+n2
}

var addtion : (Int,Int) -> Int = addd
print (addtion(30,20))


//function type as Parameter and return type
print()
func sum2(a:Int,b:Int) -> Int {
    return a+b
}
var addtion2 : (Int,Int) -> Int = sum2
print(addtion2(10,20))

func anotherSum(addtio: (Int,Int) -> Int , a: Int , b : Int) {
    print("Result is \(addtio(30,30)+a+b)")
}
anotherSum(addtio: sum2, a: 30, b: 30)


//nested function
func operation (TypeOfOperation symbol : String) -> (Int,Int) -> Int {
    func add(a: Int , b: Int)->Int{
        return a+b
    }
    
    func mul(a: Int , b: Int)->Int{
        return a*b
    }
    
    let op = (symbol == "+") ? add : mul
    return op
        
}

let opar = operation(TypeOfOperation: "+")
let ansssss = opar(4,4)
print(ansssss)

print()
//Closure

let nameClosure = {
    print("My name is Devarsh")
}
nameClosure()

var nameClosure2:(String) -> () = { name in
    print("My name is \(name)")
}
/*let nameClosure2:(String) -> () = {
    print("My name is \($0)")
}*/
nameClosure2("Deavrsh B.")

let addClosure:(Int,Int) -> (Int) = {
    (a:Int,b:Int) in
    return a+b
}
print(addClosure(10,20))


var arr = [0,4,5,-3,2]
let cusSorted :(Int,Int) -> Bool = {
    (s1:Int,s2:Int) -> Bool in
     print("\(s1) < \(s2) = \(s1<s2)")
    return s1 < s2
    
}

print(arr.sorted(by: cusSorted))

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    print("makeInCounter")
    func incrementer() -> Int {
        print("incrementer \(runningTotal)")
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

print()
//Enum
enum Lap: String {
    case dell = "1"
    case hp
    case apple
    case msi
    case asus
}

var needD = Lap.apple

switch needD {
case .apple :
    print("Apple")
    
case .asus :
    print("Asus")
    
case .dell :
    print("Dell")
    
case .hp :
    print("HP")
    
case .msi :
    print("MSI")
    
default :
    print("NO")
}

enum Mobile : CaseIterable {
    case  Redmi
    case iphone
    case google
    case oneplus
}
let mobileCaseCount = Mobile.allCases.count
print("\(mobileCaseCount) total brand available")

for mobile in Mobile.allCases {
    print(mobile)
}

enum LapSpec {
    case dell(String,Int,Int,Int)
    case hp(String,Int,Int,Int)
    case asus(String,Int,Int,Int)
}

var dellSpec = LapSpec.dell("i5", 4, 1000, 4)

switch dellSpec {
case .dell(let pro, let ram, let hdd, let graphic):
    print("Dell Laptop : Processor \(pro) , Ram \(ram) , HDD is \(hdd) , Graphic is \(graphic)")
    
case .hp(let pro, let ram, let hdd, let graphic):
    print("Hp Laptop : Processor \(pro) , Ram \(ram) , HDD is \(hdd) , Graphic is \(graphic)")
    
case .asus(let pro, let ram, let hdd, let graphic):
    print("Asus Laptop : Processor \(pro) , Ram \(ram) , HDD is \(hdd) , Graphic is \(graphic)")
}

//raw value

enum NumDigit : String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
}

print(NumDigit.one.rawValue)

let p = NumDigit(rawValue: "3")
print(p!)

let numberrrr = "6"
if let num = NumDigit(rawValue: numberrrr) {
    switch num {
    case .one:
        print("Oneeee")
    case .two:
        print("Twooooo")
    case .three :
        print("Threeeee")
    case .four:
        print("Fourrrrr")
    }
    
}else{
    print("NO matching itemmmmm")
}

enum Mobile2 : String {
    case  Redmi
    case iphone
    case google
    case oneplus
}
var cName = "Samsung"
if let n = Mobile2(rawValue: cName) {
    switch n {
    case .Redmi :
        print("Yes Available")
    case .google :
        print("Yes Available")
    case .iphone :
        print("Yes Available")
    case .oneplus :
        print("Yes available")
        
    }
}else{
    print("Not available")
}

print()
//Structure and Class

struct Person {
    var fname = "Devarsh"
    var lname = "Bhalara"
}

class PersonClass{
    var nameC = Person()
    var address = "gayatri nagar"
    var city = "Rajkot"
    
    
}

var personName = Person()
var personDetails = PersonClass()
print("Name is \(personName.fname)")
print("Last name is \(personDetails.nameC.lname)")
/*personName.fname = "Devarshhh"
print("Name is \(personName.fname)")*/

var person2Name = Person(fname: "savan" , lname: "rsj")
print(person2Name.fname)



