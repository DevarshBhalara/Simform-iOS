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

enum Mobile : String,CaseIterable{
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

print()
//higher order function
    
var numArry:[Int] = [1,2,3,5]
var numAsString = numArry.map{
    (array) -> String in
    return String(array)
}
print(numAsString)

var filterArray = [1,2,3,4,6,7,7,8]

var onlyEven = filterArray.filter{
    (number) -> Bool in
    return number%2==0
}

var filterArrayString = ["Redmi" , "Iphone" , "Oneplus" , "Realme" ]
var filteredArrayString = filterArrayString.filter{
    (value) -> Bool in
    return value.hasPrefix("R")
}
print("Only Starting with R : \(filteredArrayString)")

print("Even numbers are : \(onlyEven)")


var filteredArray = filterArray.filter{
    (number) -> Bool in
    return number < 5
}
print(filteredArray)

var combineArray = filterArray.reduce("Combined array is  : "){
    (result , i) -> String in
    return result+String(i)
}
print(combineArray)

var filterDict = ["Devarsh" : 90 , "DK" : 60 , "MS" : 99 , "ST" :40]
var res = filterDict.filter{
    (first) -> Bool in
    return first.value > 50
}
print(res)

let numbersss = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let resultss = numbersss.flatMap({ $0.filter({ $0 < 6 }) })
print(resultss)


let numbers111 = ["6","2","hello","A","7"]
let result111 = numbers111.compactMap({ Int($0) })
print(result111)

print()
//class struct enum method

class Student {
    var name : String = "Devarsh"
    var no : Int = 7
    var div : Character = "A"
    
    func displayInfo(){
        print("Name is \(name) , No. is \(no) , Division is \(div)")
    }
    
}

var studentOne = Student()
studentOne.displayInfo()

class Counter{
    var count = 0
    
    func increment(){
        count += 1
        print(count)
    }
    
    func incrementBy (By value: Int){
        count += value
        print(count)
    }
    
    func reset(){
        count = 0
        print(count)
    }
    
}
var firstCounter = Counter()
firstCounter.increment()
firstCounter.incrementBy(By: 10)


var secondCounter = Counter()
secondCounter.increment()
firstCounter.increment()

struct InfoName{
    var name = "Devarsh"
    
    func displayName (name:String) {
        print("Passed value is : \(name) and Property value is : \(self.name)")
    }
    
    mutating func setName(name:String){
        self.name = name
    }
}

var infoName1 = InfoName()
infoName1.setName(name: "New name")
infoName1.displayName(name: "Savan")
print(infoName1.name)

var infoName2 = infoName1
infoName2.name = "Update in infoName2"
print(infoName2.name)
print(infoName1.name)


struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)

/*let fixedPoint = Point(x: 3.0, y: 3.0)
fixedPoint.moveBy(x: 2.0, y: 3.0)*/


enum TriState {
    case high ,low,off
    
    mutating func stateChange(){
        switch self {
        case .high:
            self = .off
        case .low:
            self = .high
        case .off:
            self = .low
        }
    }
}

var triStateOne = TriState.low

triStateOne.stateChange()
print(" Low to : \(triStateOne.self)")

triStateOne.stateChange()
print(" High to : \(triStateOne.self)")


struct LevelTracker{
    static var highestLevelUnlock = 1
    var currentLevel = 1
    
    static func unlock(level: Int){
        if level > highestLevelUnlock {
            highestLevelUnlock = level
        }
    }
    
    static func isUnlock(level : Int)->Bool{
        return level <= highestLevelUnlock
    }
    
    mutating func advance(to level:Int)->Bool{
        if LevelTracker.isUnlock(level: level) {
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level: level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}
var devarshPlayer = Player(name: "Devarsh")
devarshPlayer.complete(level: 1)
print("Highest unlock level is \(LevelTracker.highestLevelUnlock)")

var player2 = Player(name: "Savan")
if player2.tracker.advance(to: 4) {
    print("player is now on level 6")
}else {
    print("level 6 hasn't yet been unlocked")
}


//Properties
class ProEx{
    var name = "Devarsh"
    lazy var age = 10
}

var obj = ProEx()
print(obj.name) //don't created lazyyyy
print(obj.age) //created

struct StudentName {
    var fname:String
    var lname:String
    
    var fullName : String {
        return fname + " " + lname
    }
}

struct StudentModel {
    var student : StudentName
    
    var fullNamee : String {
        get{
            student.fname
        }
        set{
            student.fname = newValue
        }
    }
}

var name1 = StudentName(fname: "Devarsh", lname: "Bhalara")
print(name1.fullName)

var sModel = StudentModel(student: name1)
sModel.fullNamee = "Devarshhh bhalaaraa"
print(sModel.fullNamee)

struct Area {
    var height:Int
    var width:Int
    
    var area : Int {
        get{
            return height*width
        }
        
    }
}

var ansArea = Area(height: 10, width: 10)
print("Area of Rect is : \(ansArea.area)")


struct WillSetDidSetEx{
    var count : Int = 0 {
        willSet(newCount) {
            print("Value \(newCount) is about to set in count")
        }
        didSet {
            print("old value : \(oldValue) new value is \(count)")
        }
    }
}
var countEx = WillSetDidSetEx(count: 10)
countEx.count = 20
countEx.count = 30


@propertyWrapper struct Min {
    var number = 0
    var wrappedValue : Int {
        get{
            return number
        }
        set{
            number =  max(newValue,number)
        }
    }
}

struct Find{
    @Min var valA : Int
    @Min var valB : Int
    
}

var find = Find()

print(find.valA)

find.valA = 20
print(find.valA)

@propertyWrapper struct SmallNumber {
    var maximum : Int
    var number : Int
    
    var wrappedValue: Int{
        get{
            return number
        }
        set{
            number = min(newValue,maximum)
        }
    }
    
    init(){
        maximum = 12
        number = 0
    }
    init (wrappedValue : Int) {
        maximum = 12
        number = min(wrappedValue,maximum)
    }
    init (wrapperValue : Int , maximum : Int){
        self.maximum = maximum
        number = min (wrapperValue,maximum)
    }

}

struct Point2 {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point2()
    var size = Size()
    var center: Point2 {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            
            return Point2(x: centerX, y: centerY)
        }
        set(newCenter) {
            print("\(newCenter.x) \(newCenter.y)")
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point2(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center

square.center = Point2(x: 15.0, y: 15.0)
//print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {
            print("get called")
            return number }
        set {
            print("set called")
            number = min(newValue, 12) }
    }
}
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}
print()
var rectangle = SmallRectangle()
print(rectangle.height)
rectangle.height = 10
print(rectangle.height)


struct BlogTeaser {
    var title: String
    
    private var _body: String = ""
    var body: String {
        set {
            _body = truncate(string: newValue)
        }
        
        get {
            return _body
        }
    }
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
    
    private func truncate(string: String) -> String {
        if string.count > 10 {
            return string.prefix(10) + "..."
        } else {
            return string
        }
    }
}
let teaser = BlogTeaser(
    title: "Hello, SwiftUI",
    body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
print(teaser.body)

//property wrapper example
@propertyWrapper struct BlogTeaser2 {
    
    private var _body: String = ""
    var wrappedValue : String {
        set {
            _body = truncate(string: newValue)
        }
        
        get {
            return _body
        }
    }
    
    
    
    private func truncate(string: String) -> String {
        if string.count > 10 {
            return string.prefix(10) + "..."
        } else {
            return string
        }
    }
}

struct BlogAns {
    var title : String
    @BlogTeaser2 var body2 : String
}
var titleBody = BlogAns(title: "hello")
print(titleBody.body2)
titleBody.body2 = "111111111111111111111"
print(titleBody.body2)

//Subscript

struct TimesTable {
    let multiplier : Int
    subscript (index: Int) -> Int{
        print("\(multiplier) \(index)")
        return multiplier * index
    }
}

let three    = TimesTable(multiplier: 3)
print("six times three is \(three[6])")


class Dayss {
    var dayArr = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"]
    var dayArr2 = ["Sunday2","Monday2","Tuesday2","Wednesday2","Thursday2","Friday2"]
    
    subscript (index:Int) -> String {
        get {
            return dayArr[index]
        }
        set{
            self.dayArr[index] = newValue
        }
    }
}

var dayssObj = Dayss()
print(dayssObj[3])
print()

var complitionHandler: ((Int)->Void)?
func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
       
       var sum: Int = 0
        for value in array {
            sum += value
        }
        print(sum)
        complitionHandler = handler
    }
    
getSumOf(array: [16,756,442,6,23]) { (sum) in
    print(sum)
}

print()
