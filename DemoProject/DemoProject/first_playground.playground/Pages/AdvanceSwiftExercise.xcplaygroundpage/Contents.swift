//: [Previous](@previous)

import Foundation

/**1
 You are working on a smart-fridge. The smart-fridge knows how old the eggs and bacon in it are. You know that eggs spoil after 3 weeks (21 days) and bacon after one week (7 days).
 Given baconAge and eggsAge(in days) determine if you can cook bacon and eggs or what ingredients you need to throw out.
 If you can cook bacon and eggs print you can cook bacon and eggs.
 If you need to throw out any ingredients for each one print a line with the text throw out <ingredient> (where <ingredient> is bacon or eggs) in any order.

 Input:
 var baconAge = 3
 var eggsAge = 2
 Output:
 you can cook bacon and eggs   **/

class Breakfast {
    var baconAge = 3
    var eggsAge = 2
    
    func check(){
        if baconAge < 8 && eggsAge < 21 {
            print("you can cook bacon and eggs  ")
        }else if baconAge > 8 || eggsAge > 20 {
            if baconAge > 8 && eggsAge > 20 {
                print("you can't cook bacon and egg")
            }else if baconAge > 8{
                print("you can't cook bacon but can egg")
            }else {
                print("you can't cook egg but bacon can")
            }
        }
    }
}
var objBreakFast = Breakfast()
objBreakFast.check()

/**2
 You are given a year, determine if it’s a leap year. A leap year is a year containing an extra day. It has 366 days instead of the normal 365 days. The extra day is added in February, which has 29 days instead of the normal 28 days. Leap years occur every 4 years. 2012 was a leap year and 2016 will also be a leap year.
 The above rule is valid except that every 100 years special rules apply. Years that are divisible by 100 are not leap years if they are not also divisible by 400. For example 1900 was not a leap year, but 2000 was. Print Leap year! or Not a leap year! depending on the case.

 Input:
 var year = 2000
 Output:
 Leap year!
 **/

func checkLeapYear(year: Int) -> () {
    if year % 400 == 0 && year % 100 == 0 {
        print("Leap year!")
    }
    else if year % 4 == 0 && year % 100 != 0 {
        print("Leap year!")
    }
    else {
        print("Not Leap year")
    }
}

checkLeapYear(year: 2016)


/**3
 You are working on a videogame where the character has a certain number of hitpoints(HP) ranging from 0 to 100.
  100 represents full health
  0 represents dead.
 You want to add regenerating health to the game using the following rules:
 
 HP always regenerates up to numbers of the form X0 (75 -> 80 , 32 -> 40 …)
 When HP is below 20 it regenerates up to 20 (13 -> 20, 5 -> 20, …)
 If the character has 0 HP then he doesn’t regenerate life (he’s dead)
 Given the current hp of the character stored in a variable hp print the hp the player will have after regenerating life.

 Input:
 var hp = 60
 Output:
 60
 **/

func regenarateHP(hp: Int) -> Int{
    if hp > 20 {
        if hp % 10 == 0 {
            return hp
        }
        else {
            return hp - ( hp % 10 ) + 10
        }
        
    }else if hp == 0 {
        return 0
    }else{
        return 20
    }
}
print(regenarateHP(hp: 60))


/**4
 You are given three grades obtained by 3 students in a class stored in variables grade1, grade2, grade3 of typeDouble.
 You are also given your grade in the class stored in a variable yourGrade of type Double.
 Print above average if your grade is greater than the class average or below average” otherwise.
  Note: the average of the class includes your grade.

 Input:
 var grade1 = 7.0
 var grade2 = 9.0
 var grade3 = 5.0
 var yourGrade = 8.0
 Output:
 "above average"
 **/

class Grade{
    var grade1: Double = 7.0
    var grade2: Double = 9.0
    var grade3: Double = 5.0
    var yourGrade: Double = 8.0
    
    func calcAvearge() -> () {
        let avg = (grade1+grade2+grade3+yourGrade)/4
        if yourGrade > avg {
            print("Above Average")
        }else {
            print("Below Average")
        }
    }
}
var objGrade = Grade()
objGrade.calcAvearge()

/**5
 You have the cost of a meal at a restaurant stored in a variable mealCost of type Double.
 You would like to leave a tip of a certain percentage. The percentage is stored in a variable tip of type Int.
 Print the total cost of the meal.

 Input:
 var mealCost:Double = 3.5
 var tip:Int = 20
 Output:
 4.2
 */

var mealCost: Double = 3.5
var tip: Int = 20
var totalCost: (Double,Int) -> Double = {
    (mealCost,tip) -> Double in
    return (mealCost*Double(tip))/100 + mealCost
}
print(totalCost(mealCost,tip))


/**Class**/
/**Create a swift program to demonstrate swift class. Which has two variables inside class body. Access (Set its values and get its value.) these variables by creating one instance of class.**/

class Swift{
    var varOne: Int = 10
    var varTwo: Int = 20
}
var obj1 = Swift()
//print("\(obj1.varOne) \(obj1.varTwo)")
obj1.varOne = 30
obj1.varTwo = 40
print("\(obj1.varOne) \(obj1.varTwo)")


/**Create a swift program to demonstrate usage of swift class for usage of multiple initializers. Create one initializer with two parameters your name and college and another initializer with your name and department. You can be able to access these properties using instance of class.**/

class StudentDetail{
    var name : String = ""
    var collegeName : String = ""
    var departmantName : String = ""
    init(name: String , collegeName: String){
        self.name = name
        self.collegeName = collegeName
    }
    init(name: String , departmantName: String){
        self.name = name
        self.departmantName = departmantName
    }
}
var objStudent = StudentDetail(name: "Devarsh" , collegeName: "Marwadi")
var objStudent2 = StudentDetail(name: objStudent.name, departmantName: "CE")

print("\(objStudent.name)")
print("\(objStudent.collegeName)")
print("\(objStudent2.departmantName)")


/**Create a swift class without initializers and access (write, read) its properties using instance of class.**/

class WithoutInit{
    var oneVar : Int = 0
    var twoVar : Int = 0
}
var objWithoutInit = WithoutInit()
objWithoutInit.oneVar = 20
objWithoutInit.twoVar = 30
print("\(objWithoutInit.oneVar) \(objWithoutInit.twoVar)")


/**Create a swift class which is having code to return square of given number and access this code using class instance.**/

class Square {
    var number: Int
    init(number: Int){
        self.number = number
    }
    func findSquare() -> Int {
        return self.number * self.number
    }
}
var objSquare = Square(number: 8)
print(objSquare.findSquare())

/**Create a swift class example to show use of swift inheritance. Your base class has some property access this property. In two different child classes and show its usage using the instances of both child classes.
*/

class Vechical {
    var vProperty = "Vehical"
}
class Car : Vechical {
    var carProperty = "Car"
}
class Truck : Vechical {
    var trukProperty = "truck"
}

var objCar = Car()
print("This \(objCar.vProperty) is \(objCar.carProperty)")

var objTruck = Truck()
print("This \(objTruck.vProperty) is \(objTruck.trukProperty)")

/**Create a swift class example to show use of swift base class which have some implementation inside any method. Now demonstrate usage of overriding that method implementation.**/

class Cricket {
    
    var name = "Devarsh"
    
    func printDetail() {
        print("\(self.name) is Cricketer")
    }
    
}
class Batsmam : Cricket{
    
    override func printDetail() {
        print("\(self.name) is Batsmam")
    }
}

var objBatsman = Batsmam()
objBatsman.printDetail()

/**Create a swift class with an initializer in a manner that you can create this class using initializing value. And one function which takes int input and returns the power of class instance.
 example:  let instance = Example(value: 5)
     let result = instance.doPower(power: 3)
 then it should return 5's 3 power (125)
 */

class FindPower{
    var value: Int
    init(value: Int){
        self.value = value
    }
    func doPower(power: Int) -> Int {
        return Int(pow( Double(self.value) ,Double(power)))
    }
}
var objFindPower = FindPower(value: 5)
var res = objFindPower.doPower(power: 3)
print(res)

/**Create a swift class example which has a parent class for vehicles, and child classes for two different vehicles e.g. (bike & car). You need to use common properties and method in the parent class and inside child class, there will be some different property which is not common.
*/
class Vechical2 {

    var name: String
    var color: String
    var seatCapacity: Int
    var model: String
    var year: Int
    var speed: Int = 0
    var engine: String
  
    init(name: String, seatCapacity: Int ,color: String, model: String, year: Int, engine: String ){
        self.name = name
        self.seatCapacity = seatCapacity
        self.color = color
        self.model = model
        self.year = year
        self.engine = engine
    }
    
    func speedPrint(Speed speed:Int) -> String{
        return "speed is \(speed)"
    }
    
    func printDetails(){
        print("Name is \(name)")
        print("SeatCapacity is \(seatCapacity)")
        print("Color is \(color)")
        print("Model is \(model)")
        print("Year is \(year)")
        print("Engine capacity \(engine)")
        print("Seatcapacity is \(seatCapacity)")
    }
}

class Car2 : Vechical2 {

    var tires: Int = 4
    var isPowerStearing: Bool
    var isAutoGear: Bool
    var fuelType:String
    var bootSpace: String
    
    init(bootSpace: String, isPowerStearing: Bool, isAutoGear: Bool , fuelType: String ,name: String, seatCapacity: Int ,color: String, model: String, year: Int , engine: String ){
        self.bootSpace = bootSpace
        self.isPowerStearing = isPowerStearing
        self.isAutoGear = isAutoGear
        self.fuelType = fuelType
        super.init(name: name,seatCapacity: seatCapacity, color: color, model: model, year: year , engine: engine)
    }
    
    override func printDetails() {
        super.printDetails()
        print("PowerStearing is \( isPowerStearing ? "Yes" : "No" )")
        print("Autogear is \( isAutoGear ? "Yes" : "No" )")
        print("fuel type is \(fuelType)")
        print("bootspace is \(bootSpace)")
    }
    
}
class Bike : Vechical2 {
    var gearCount: Int
    var bikeTires: Int = 2
    
    init(gearCount: Int, name: String, seatCapacity: Int ,color: String, model: String, year: Int , engine: String ){
        self.gearCount = gearCount
        super.init(name: name, seatCapacity: seatCapacity, color: color, model: model, year: year, engine: engine)
    }
    
    override func printDetails() {
        super.printDetails()
        print("there are \(gearCount) gear in this")
    }
}

var objCar2 = Car2(bootSpace: "10kg", isPowerStearing: true, isAutoGear: false, fuelType: "Pertrol", name: "Civis", seatCapacity: 5, color: "White", model: "2023-23", year: 2023, engine: "2000CC")
objCar2.printDetails()

print()

var objBike = Bike(gearCount: 4, name: "Glamour", seatCapacity: 2, color: "Red black", model: "2016", year: 2016, engine: "125CC")
objBike.printDetails()

print()

/**Create a person swift class with person name initializer and create one function to greet that person.
 Example: let person1 = Person(name: Joe)
   Person1.greet() // This should print “Hello Joe”
*/

class Person{
    var name: String
    
    init(Name name: String){
        self.name = name
    }
    
    func greeting(){
        print("Hello \(name)")
    }
}
var objPerson = Person(Name: "Devarsh")
objPerson.greeting()

print()
/**Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
 let example1 = Example()
 Example1.a = “Hello”
 let example2 = example1
 example2.a = “Hi”
 print(example1.a)
 print(example2.a)
 // Consider ‘a’ as string property of example class.
 --> Check these two print outputs and try to find out the reason for that output.
*/


class Example{
    var a: String
    
    init(a: String){
        self.a = a
    }
    
    init(){
        self.a = "Hello"
    }
    
}
let example1 = Example()
example1.a = "Hello"
let example2 = example1
example2.a = "Hii"
print(example1.a)
print(example2.a)

print(  )
/**Strucure
 Create one structure of type Work, which have some properties like work location, work hours and one string array of project names. And create a function inside structure which returns all project names for the person.

 **/

struct Work{
    
    var workLocation: String
    var workHours: Int
    var projectName: [String]
    
    func printDetails(){
        print("Work Location \(workLocation)")
        print("Work hours \(workHours)")
        print("Project are : ")
        projectName.forEach{
            print($0)
        }
    }
    
}

var aaa = Work(workLocation: "Ahmedabad", workHours: 8, projectName: ["healt app" , "Chat application"])
aaa.printDetails()

print()
/**Create a structure example which demonstrates use of initializer in structures.**/

struct Student2{
    
    var name: String
    var collegeName: String
    var department: String
    
    init(Name name: String, CollegeName collegeName: String, Department department: String){
        self.name = name
        self.collegeName = collegeName
        self.department = department
    }
    
}

var objStudent3 = Student2(Name: "Devarsh", CollegeName: "Marwadi", Department: "CE")
print(objStudent3.name)

print()
/**
 Create a structure program which can be initialized with parameters and it also should be able to initialized without parameters.
 */

struct Demo{
    
    var name: String
    var hobby: [String]
    
    init(name: String,hobby: [String]){
        self.name = name
        self.hobby = hobby
    }
    
    init(){
        self.name = "Devarsh"
        self.hobby = ["Cricket" , "music"]
    }
    
}
var objDemo = Demo()
print(objDemo.name)
print(objDemo.hobby)

var objDemo2 = Demo(name: "Devarsh", hobby: ["Cricket" , "music" , "watching series"])
print(objDemo2.name)
print(objDemo2.hobby)

print()

/**
 Create one structure which have initializer which takes array of int as input returns  two arrays one of all even numbers and another is all odd numbers
 Input: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12]
 Output: even numbers are: [6, 8, 10, 8, 12]
 Odd numbers are: [1, 3, 5, 9, 7]
 
 */

struct OddEven {
    var number: [Int]
    
    init(numberArray: [Int]){
        self.number = numberArray
    }
    
    func findOddEven() -> (odd: [Int] , even: [Int]) {
        var oddArray: [Int] = []
        var evenArray: [Int] = []
        
        for i in number{
            if i % 2 == 0 {
                evenArray.append(i)
            }else{
                oddArray.append(i)
            }
        }
        return (oddArray,evenArray)
    }
}

var objOddEven = OddEven(numberArray: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12])
let resultOddEven = objOddEven.findOddEven()
print("even numbers are \(resultOddEven.even)")
print("odd numbers are \(resultOddEven.odd)")
print()

/**
 create one swift structure program for person that contains basic details like name, age, gender. Then create one array of person with all details. Print all details of that array.
 // Consider two persons array for Joe and Harry. But in your code Its size can be vary.
 Output be like: Name: Joe, Gender: Male, Age: 27
       Name: Harry, Gender: Male, Age: 21
*/

struct Person2{
    var name: String
    var age: Int
    var gender: String
    
}
var personOne = Person2(name: "Joe", age: 27, gender: "Male")
var personTwo = Person2(name: "Harry", age: 21, gender: "Male")

var objArr: [Person2] = [ personOne , personTwo ]
objArr.forEach{
    (eachPerson) in
    print("Name : \(eachPerson.name), Gender : \(eachPerson.gender), Age : \(eachPerson.age)")
}

print()

/**Perform same example given in class question no 10 and check output using structure. Try to find difference between these two outputs and try to figure out the reason for that output.
 
 class 10 :
 
 Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
 let example1 = Example()
 Example1.a = “Hello”
 let example2 = example1
 example2.a = “Hi”
 print(example1.a)
 print(example2.a)
 // Consider ‘a’ as string property of example class.
 --> Check these two print outputs and try to find out the reason for that output.

 **/

struct Example2{
    
    var a: String
    
    init(a: String){
        self.a = a
    }
    
    init(){
        self.a = "Hello"
    }
    
    
    
}
//let example2Obj = Example2() need to change let to var
var example2Obj = Example2()
example2Obj.a = "Hello"
//let example2Obj2 = example2Obj
var example2Obj2 = example2Obj
example2Obj2.a = "Hii"
print(example2Obj.a)
print(example2Obj2.a)


//Class need init() always manualy
//struct don't support inheritance automatically
//struct don't require complasry init

class StudentClass {
   var name: String
   var grade: Int
   init(name: String, grade: Int) {
      self.name = name
      self.grade = grade
   }
}
let student1 = StudentClass(name: "Devarsh bhalara", grade: 9)
let student2 = student1
student2.name = "savan"
print("student1 name: \(student1.name)")
print("student2 name: \(student2.name)")

struct StudentStruct {
   var name: String
   var grade: Int
}
let student3 = StudentStruct(name: "Devarsh Bhalara", grade: 8)
var student4 = student3
student4.name = "Savan"
print("student3 name: \(student3.name)")
print("student4 name: \(student4.name)")

print()
/**
 
 •Write swift program using enumerations to check week day from given number. Consider Monday as 1 and Sunday as 7. We can be able to get day name as string in short form (sun, mon,...) and same full name (Sunday, Monday...) by given number of the day.
Example. It should return Monday or mon if I pass parameter 1 for get day name.
*/

enum Weekday: Int {
    
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
}
    
func check(day: Weekday) {
    switch day {
    case .monday :
        print("monday or mon")
    case .tuesday :
        print("tuesday or tue")
    case .wednesday :
        print("wednesday or wed")
    case .thursday :
        print("Thursday or thu")
    case .friday :
        print("Friday or fri")
    case .saturday :
        print("saturday or sat")
    case .sunday :
        print("sunday or sun")
    }
}
   

check(day: Weekday(rawValue: 2)!)

print()

enum numberOfDayInMonth: Int{
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
    
    func getDay() {
        switch self {
        case .January :
            print("31")
        case .February :
            print("28")
        case .March :
            print("31")
        case .April :
            print("30")
        case .May :
            print("31")
        case .June :
            print("30")
        case .July :
            print("31")
        case .August :
            print("31")
        case .September:
            print("30")
        case .October:
            print("31")
        case .November:
            print("30")
        case .December:
            print("31")
        }
    }
}
//print(numberOfDayInMonth.August.rawValue)
numberOfDayInMonth.December.getDay()

/**Write a swift program using enumerations to demonstrate Int enums.**/

enum Weekday2: Int {
    
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
}
    
print(Weekday2.monday.rawValue)

/**write a swift program to demonstrate string type enum.**/
enum DemoEnum: String {
    case one = "One"
    case two = "Two"
    case three = "Three"
    case four = "Four"
    case five = "Five"
}

print(DemoEnum.three.rawValue)

/** Write a swift program for enum with raw value**/
enum DemoRaw: String{
    case one
    case two
    case three
    case four
    case five
}

print(DemoRaw.three.rawValue)
/**Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory).**/

enum TestCaseIterable: String, CaseIterable {
    case horror
    case thriller
    case scifi
    case comedy
    case action
}
for i in TestCaseIterable.allCases {
    print(i)
}

//TestCaseIterable.allCases.forEach{
//    print($0.rawValue)
//}
/**Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values)**/

enum Series{
    case Elite(String,Int,String,String,Float)
    case Farzi(String,Int,String,String,Float)
    case TheBoys(String,Int,String,String)
}
var series = Series.Elite("Elite", 6, "2018", "Netflix", 7.3)

switch series {
case .Elite(let name, let seasonCount, let year, let platform, let rating):
    print("Name of series is \(name) it hase \(seasonCount) seasons relesed in \(year) on \(platform) and rating is \(rating)")
case .Farzi(let name, let seasonCount, let year, let platform, let rating):
    print("Name of series is \(name) it hase \(seasonCount) seasons relesed in \(year) on \(platform) and rating is \(rating)")
case .TheBoys(let name, let seasonCount, let year, let platform):
    print("Name of series is \(name) it hase \(seasonCount) seasons relesed in \(year) on \(platform)")
}


//enum Series2{
//    case Elite(String,Int,String,String,Float)
//    case Farzi(String,Int,String,String,Float)
//    case TheBoys(String,Int,String,String)
//}
//var series2 = Series.Elite("Elite", 6, "2018", "Netflix", 7.3)
//
//switch series {
//case .Elite(let name, let seasonCount, let year, let platform, let rating):
//    print("Name of series is \(name) it hase \(seasonCount) seasons relesed in \(year) on \(platform) and rating is \(rating)")
//case .Farzi(let name, let seasonCount, let year, let platform, let rating):
//    print("Name of series is \(name) it hase \(seasonCount) seasons relesed in \(year) on \(platform) and rating is \(rating)")
//case .TheBoys(let name, let seasonCount, let year, let platform):
//    print("Name of series is \(name) it hase \(seasonCount) seasons relesed in \(year) on \(platform)")
//}
/**Create an enum with its rawValues of type String and show usage of case to print value of case.**/

enum DemoEnum2: String {
    case one = "One"
    case two = "Two"
    case three = "Three"
    case four = "Four"
    case five = "Five"
}

print(DemoEnum.three.rawValue)
print()
/**Properties , methods , subscript
 Create an example using swift to demonstrate use of get only properties. Create a class with a property which value cannot be set outside of class
 **/

class Sum {
    var valueA: Int
    var valueB: Int
    var ans: Int {
        return valueB + valueA
    }
    
    init(valueA: Int,valueB: Int){
        self.valueA = valueA
        self.valueB = valueB
    }
}
var sumObj = Sum(valueA: 10, valueB: 20)
print(sumObj.ans)
//sumObj.ans = 10 error

/**Create a swift program to demonstrate usage of computed properties using getter and setter.**/

class DemoGetSet {
    var fname: String
    var lname: String
    var fullName : String {
        get{
            return fname + " " + lname
        }
        set{
            let full = newValue.components(separatedBy: " ")
            fname = full[0]
            lname = full[1]
        }
    }
    
    init(fname: String, lname: String){
        self.fname = fname
        self.lname = lname
    }
}
var demoGetSetObj = DemoGetSet(fname: "Devarsh", lname: "Bhalara")
print(demoGetSetObj.fullName)
demoGetSetObj.fullName = "Savan Rajyguru"
print(demoGetSetObj.fullName)

/**Create a swift program to show usage of stored properties**/

struct DemoStored{
    var name: String = "Devarsh"
    var grade: Float = 9.0

}
var objDemoStored = DemoStored()
print(objDemoStored.name)
objDemoStored.name = "Changed"
print(objDemoStored.name)

/**Create a swift program which has private properties which cannot directly be accessed. Means we cannot directly read or write it**/

class DemoPrivateProperty{
    private var privateVar: Int = 10
}
var objDemoPrivateProperty = DemoPrivateProperty()
//objDemoPrivateProperty.privateVar


/**Create one swift class which have two properties name and id, the class must have one initializer to set that properties. And create one array of that class types**/
class DemoNameId{
    var name: String
    var id: Int
    
    init(name: String,id: Int){
        self.name = name
        self.id = id
    }
}
var objDemoNameId = DemoNameId(name: "Devarsh", id: 10)
var objDemoNameId2 = DemoNameId(name: "Savan", id: 9)
var ArrObjDemoNameId: [DemoNameId] = [ objDemoNameId , objDemoNameId2 ]
ArrObjDemoNameId.forEach{
    (demo) in
    print("\(demo.name) \(demo.id)")
}

/** Create one example of usage of willSet and didSet. **/

class WillDidSet{
    var count: Int = 0{
        willSet{
            print("\(newValue) value will be set")
        }
        didSet{
            print("\(oldValue) is the old value new value is \(count)")
        }
    }
}
var objWillDidSet = WillDidSet()
objWillDidSet.count = 10
objWillDidSet.count = 20


/**Create one lazy stored property in a class and show usage of it**/

class Studentname {
    var firstName: String
    var lastName: String
    
    lazy var fullName: String = firstName + " " + lastName
    
    init(fname: String,lname: String){
        firstName = fname
        lastName = lname
    }
}

var objStudentName = Studentname(fname: "Devarsh", lname: "Bhalara")
print(objStudentName.fullName)

print()

/**Create one class as Base type Person which has common properties like name, occupation, etc. Create two child classes from the person which are Student, Employee and this two-child classes must have base properties and some other properties also. Example, student have college, but Employee have company. And demonstrate the usage of inheritance. **/

class Person3 {
    var firstName: String
    var lastName: String
    var ocupation: String
    var hobby: [String]
    
    init(firstName: String, lastName: String, occupation: String,hobby: [String]){
        self.firstName = firstName
        self.lastName = lastName
        self.ocupation = occupation
        self.hobby = hobby
    }
    
    func printDetails(){
        print("First name : \(firstName)")
        print("Last Name : \(lastName)")
        print("Ocupation : \(ocupation)")
        print("Hobbies : \(hobby)")
    }
}
class StudentChild  : Person3 {
    var schoolName: String
    var collegeName: String
    var spi: Float
    
    init(firstName: String, lastName: String, occupation: String, hobby: [String],schoolName: String, collegeName: String, spi: Float) {
        self.schoolName = schoolName
        self.collegeName = collegeName
        self.spi = spi
        super.init(firstName: firstName, lastName: lastName, occupation: occupation, hobby: hobby)
    }
    
    override func printDetails() {
        super.printDetails()
        print("School name : \(schoolName)")
        print("College name : \(collegeName)")
        print("Spi : \(spi)")
    }
}
class Employee : Person3 {
    var companyName: String
    var salary: Int
    var position: String
    
    init(firstName: String, lastName: String, occupation: String, hobby: [String],companyName: String , salary: Int, position: String) {
        self.companyName = companyName
        self.salary = salary
        self.position = position
        super.init(firstName: firstName, lastName: lastName, occupation: occupation, hobby: hobby)
    }
    
    override func printDetails() {
        super.printDetails()
        print("Company name : \(companyName)")
        print("Salary : \(salary)")
        print("Position : \(position)")
    }
}
var objStudentt = StudentChild(firstName: "Devarsh", lastName: "Bhalara", occupation: "Student", hobby: ["Cricket","music"], schoolName: "Sarvodaya", collegeName: "Marwadi", spi: 9.2)
objStudentt.printDetails()

var objEmployee = Employee(firstName: "Devarsh", lastName: "Bhalara", occupation: "Software Developer", hobby: ["Cricket","music"], companyName: "Simform", salary: 33333, position: "jr native mobile")
objEmployee.printDetails()

print()
/**Create one structure to show usage of mutating function in swift. **/

struct StudentName2{

    var studentName: String
    
    mutating func setName(name: String) -> () {
        self.studentName = name
    }
    func getName() -> String {
        return self.studentName
    }
}

var studentNameObj = StudentName2(studentName: "Devarsh")
print(studentNameObj.getName())
studentNameObj.setName(name: "DevarshBhalara")
print(studentNameObj.getName())


/**    •    10)  Create one class inheritance demo to show usage of method overriding.
 Abvoe Person , Student , employee example shows usage of inheritance
*/


/**    •    11)  Create one swift class to show usage of type methods.
*/

class DemoTypeMethod {
    
    class func findMin(valueA: Int, valueB: Int) -> Int {
        if valueA < valueB {
            return valueA
        }else{
            return valueB
        }
    }
}
var min = DemoTypeMethod.findMin(valueA: 10, valueB: 20)
print("Min is \(min)")

/**  •    12)  Create one swift class which is having class method and static method. Then in one child class try to override that methods and check the output/ error. (you will learn difference between class and static)
*/
class DemoClassStatic {
    class func superClassMethod(){
        print("class Method in superclass")
    }
    
    static func superStaticMethod(){
        print("static method in superclass")
    }
}
class SubDemoClassStatic : DemoClassStatic{
    override class func superClassMethod() {
        print("class method form subclass")
    }

    ///can't override static method
}


/**    •    13)  Create one example of subscript using array. Create one array of weekdays and one subscript func which takes int as argument and returns day of week.
*/



class DemoSubscript  {
    

    var arrayWeekdays = ["Sunday","Monday","tuesday","Wednesday" , "Thursday" , "Friday","Saturday"]

    func isValidNumber(index: Int)  -> Bool {
        if index >= 1 && index <= 7 {
            return true
        }else{
            return false
        }
    }
    
    subscript(index: Int) -> String {
        get{
            assert(isValidNumber(index: index),"Out of range")
            return arrayWeekdays[index-1]
        }
    }

    
}
var objDemoSubscript = DemoSubscript()
print(objDemoSubscript[1])


//
//
//struct Demooo {
//
//    var a,b,c,d: Int
//    init(a:Int,b:Int,c:Int){
//        self.a = a
//        self.b = b
//        self.c = c
//    }
//}
//
////var aaaaaa = Demooo(a: 1, b: 2, c: 5, d: 10)
//var a1 = Demooo(a: 1, b: 1, c: 3)



/**    •    14)  Create a swift program to show usage of subscript in string. I pass int argument and it returns the character at given position.
*/

extension String {
   subscript(_ characterIndex: Int) -> Character {
      return self[index(startIndex, offsetBy: characterIndex)]
   }
}
let string = "Devarsh"
let characterIndex = 10
if characterIndex >= string.count {
    print("out of range ")
}else{
    let nthCharacter = string[characterIndex]
    print("Character at \(characterIndex) is \(nthCharacter)")
}



/**    •    15)  Create one swift subscript program which takes range as input and returns the string between the ranges.
*/
//class Range {
//    var str: String = "Hello"
//
//
//
//    subscript(range: Int , erange: Int) -> String {
//
//
//        return str[range..<erange]
//    }
//
//
//}

extension String {
    func index(from: Int) -> Index {
           return self.index(startIndex, offsetBy: from)
       }
    
    func substring(r: Range<Int>) -> String {
            let startIndex = index(from: r.lowerBound)
            let endIndex = index(from: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
}

class Rangee {
    var str: String = "Hello"
    
    subscript(i: Int, j: Int) -> String {
        
        
        let first = str.index(str.startIndex, offsetBy: i)
        let end = str.index(str.startIndex, offsetBy: j)
//        print(str[first])
        
        return String(str[first...end])
       
    }
}
var rr = Rangee()

print(rr[1,4])

/**
 •    16)  I have one integer array and create one function which takes range as input and returns all elements between the range.

 */
func findBetweenArray (arr: [Int] ,range: Range<Int> ) -> [Int] {
    
    let start = arr.index(arr.startIndex, offsetBy: range.lowerBound)
    let end = arr.index(arr.startIndex, offsetBy: range.upperBound)
    return Array(arr[start...end])
}

var findArr: [Int] = [1,2,3,5,6,7]
var newArr = findBetweenArray(arr: findArr, range: 2..<5)

/**
 •    17)  I have one key value pair array. Create one function using subscript which takes key as input and returns it’s value.

 */
class KeyVal {
    var arr  = [
        [1 : "One"],
        [2 : "Two"],
        [3 : "Three"]
    ]
    subscript(index : Int) -> String {
        let allKey3 = arr.compactMap{ $0[index] }.joined()
        return String(allKey3)
    }
}
var objKey = KeyVal()
print(objKey[1])


/**    •    18)  Create one array of type Person and create one subscript function which takes person name as input and returns person info like name, age, birthdate etc.
*/

class Personn {
    var name: String?
    var age: Int?
    var date: String?

    var arrP : [Personn]?


//    var arrPerson: Person

    init(name: String,age: Int,date: String){
        self.name = name
        self.age = age
        self.date = date
    }
    init(arrP: [Personn]){
        self.arrP = arrP
    }

    subscript(name: String) -> Void {

        for i in arrP! {
            if name == i.name {
                print(i.name ?? "No name available")
                print(i.date ?? "No date available")
                print(i.age ?? 0)
            }
           
        }
        
//        if let i = arrP!.firstIndex(where: {
//            print($0)
//
//            return $0.name == name })  {
//            print(i)
//
//        }
//        print(name)

//        return(age ?? 0,date ?? "")
    }

}

var obj11 = Personn(name: "abc", age: 10, date: "30-7")
var obj22 = Personn(name: "def", age: 19, date: "31-7")
var arrPerson: [Personn] = [obj11,obj22]
var objArr2 = Personn(arrP: arrPerson)
objArr2[obj11.name ?? ""]


/**
 •    19)  Create one base class of type Song and create subclasses of music types (Hip-Hop, classical) and show usage of inheritance. // Here Music class have property singer, composer

 */

class Song {
    var singer: String
    var composer: String
    
    init(singer: String , composer: String){
        self.singer = singer
        self.composer = composer
    }
    
    func display() {
        print("\(singer) \(composer)")
    }
}
class HipHop : Song {
    var song: Song
    
    init(song: Song){
        self.song = song
        super.init(singer: song.singer , composer: song.composer)
    }
    override func display() {
        super.display()
        print("Categoer is Hiphop")
    }
}
class Classical : Song {
    
    var song: Song
    
    init(song: Song){
        self.song = song
        super.init(singer: song.singer , composer: song.composer)
    }
    
    override func display() {
        super.display()
        print("Category is Classical")
    }
}
var objSong = Song(singer: "ABC", composer: "XYz")
var objHiphop = HipHop(song: objSong)
objHiphop.display()
//

/**Exception handling **/
/**    •     Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and if password is empty, throw “Empty password” exception.
*/
enum PasswordValidation : Error {
    case PasswordTooShort
    case PasswordEmpty
}

class GetPassword {
    var password: String
    
    init(password: String) throws {
        if password.isEmpty {
            throw PasswordValidation.PasswordEmpty
        }else if password.count < 8 {
            throw PasswordValidation.PasswordTooShort
        }
        self.password = password
    }
    
}

do{
    var objGetPassword = try GetPassword(password: "")
    print(objGetPassword.password)

}catch PasswordValidation.PasswordEmpty {
    print("Password is empty")
}catch PasswordValidation.PasswordTooShort {
    print("Enter maximum 8 character")
}


/**    •     Create a program for shopping cart. If desired quantity for an item is not available, throw exception.
*/

enum ShoppingCartError : Error {
    case ItemNotAvailable
}
class ShoppingCart {
    var itemDict = [
        "Chocolate" : 10 ,
        "Chees" : 4,
        "Amul milk" : 11
    ]
    
    var userItem: String
    var userQty: Int
    
    init(item: String, qty: Int){
        userItem = item
        userQty = qty
    }
    
    func checkAvailability() throws -> String {
        
        guard var getQty = itemDict[userItem] else { return "Enter valid item" }
        if getQty < userQty {
            throw ShoppingCartError.ItemNotAvailable
        }
        return "Item is available"
    }
}
var objShopping = ShoppingCart(item: "Chocolate", qty: 11)
do {
    try print(objShopping.checkAvailability())
}
catch ShoppingCartError.ItemNotAvailable {
    print("item not availble currently")
}

/**Extensions
 •    Create following string manipulation functions using string extensions:
 •    Add a character in a string at 5th position
 •    Replace one character with other in a string
 •    Remove white spaces from string
 •    Get number of words in a string
*/
extension String {
    mutating func addCharFifth(char: Character)  {
        var index = index(startIndex, offsetBy: 5)
        insert(char, at: index)
    }
}
var myStr = "Devarsh"
myStr.addCharFifth(char: "E")
print(myStr)


extension String {
    mutating func replaceOneWithaAnother (towhom: Character , with: Character) -> String {
        var newStr: String = ""
        for i in 0...self.count-1 {
            if self[i] == towhom {
                newStr.append(with)
            }else{
                newStr.append(self[i])
            }
        }
        return newStr
//        var str = self.replacingOccurrences(of: String(towhom), with: String(with))
//        return str
    }
}
var myStr2 = "Devarsh"
var newStr = myStr2.replaceOneWithaAnother(towhom: "e", with: "A")
print(newStr)


extension String {
    mutating func removeWhiteSpace() -> String {
        var newStr: String = ""
        for i in 0...self.count-1 {
            if self[i] != " " {
                newStr.append(self[i])
            }
        }
        return newStr
    }
    
}

var myStr3 = "Hello test H"
var removedSpace = myStr3.removeWhiteSpace()
print(removedSpace)


extension String {
    func getNoOfWords() -> Int {
//        self.trim
        var newStr = self.trimmingCharacters(in: .whitespaces)
        print(newStr)
        var count = 1
        for i in 0...newStr.count-1{
            if self[i] == " " {
                count += 1
            }
        }
        return count
    }
}
var myStr4 = " I am devarsh "
print(myStr4.getNoOfWords())
