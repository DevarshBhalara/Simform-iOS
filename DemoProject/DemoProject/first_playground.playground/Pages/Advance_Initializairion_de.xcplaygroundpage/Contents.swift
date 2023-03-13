
import Foundation

//initialization , de-initialization
struct StudentInfoo {
    var studentName : String
    var studentClass : Int?
    var studentNo : Int?
    
    init(){
        studentName = "Devarsh D"
        studentClass = 9
        studentNo = 1
    }
    
    init(name: String, sclass:Int /*-, no:Int*/){
        studentName = name
        studentClass = sclass
        //studentNo = no
    }
    /*/init(name : String , sclass: Int ){
     studentName = name
     studentClass = sclass
     }*/
    init(StudentName studentName : String){
        self.studentName = studentName
    }
}

var myS = StudentInfoo(name: "Devarsh", sclass: 5)
print(myS.studentName)

var myS3 = StudentInfoo()
print(myS3.studentName)

/*var myS2 = StudentInfoo(StudentName: nil)
 print(myS2.studentName)
 */


class A {
    var memA : Int
    
    init(memA : Int){
        print("Class A initializer")
        self.memA = memA
    }
}

class B : A{
    var memB: Int //= 15   /* Now we can write super.init() first */
    init(){
        //super.init(memA: 20)    /* Throw erroe bcoz we are calling A's init before initializing all properties of B **/
        print("Class B initializer")
        memB = 10
        super.init(memA: 20)
    }
    
}

var objB = B()

print()

class Human {
    
    var name : String
    init(name : String){
        self.name = name
    }
    
    
    convenience init(){
        //self.name = "Devarsh"
        self.init(name: "Devarsh")
    }
    
    convenience init(a1 :String){
        //self.name = a1
        self.init(name: a1)
    }
}
var objHuman = Human()
print(objHuman.name)

print()

class HumanBeing {
    var name : String
    init(name : String){
        self.name = name
        print("Init in Super")
    }
    convenience init(){
        print("Conv.. in Super")
        self.init(name: "not set")
    }
}

class Man : HumanBeing {
    var age : Int = 0
    
    override init(name: String) {
        print("Init first in base")
        super.init(name: name)
        print("Init in Base : \(self.name)")
    }
    
    init(name: String , age : Int){
        super.init(name: name)
        self.age = age
    }
    
    
    /*var description = {
     () -> String in
     return "wheel(s)"
     }*/
}

let manObj1 = Man()
//let manObj2 = Man(name: "Robert")
//let manObj3 = Man(name: "John", age: 10)

print(manObj1.name)
//print(manObj2.name)
//print(manObj3.description())

class testDeinit {
    deinit{
        print("Deinit")
    }
}
var dd : testDeinit? = testDeinit()
var d2 = dd
d2 = nil
dd = nil


struct Animal  {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
var objAnimal = Animal(species: "g")
print(objAnimal!.species)


class Student {
    func displayStudent(){
        print("From Suepr class")
    }
}
class StudentBase : Student {
    override func displayStudent() {
        print("From Base class")
    }
}

var studentBase = StudentBase()
studentBase.displayStudent()

print()
//Inheritance

class Vehical {
    var speed: Int = 0
    
    var desc : String {
        return "This is vehical"
    }
    
    func speedPrint(Speed speed:Int) -> String{
        return "speed is \(speed)"
    }
    
    func makeNoise(){
        
    }
}

class Car : Vehical {
    var seat : Int = 4
    var gear : Int = 0
    override var desc: String{
        return "This is car"
    }
    
    override var speed: Int{
        didSet{
            gear = Int(speed / 10) + 1
        }
    }
    
    override func makeNoise() {
        print("wroom ....")
    }
    
}
class Cycle : Car {
    var hasBasket : Bool = false
    
    
    override func makeNoise() {
        print("No noise")
    }
    
}
var objCar = Car()
objCar.speed = 50
print("Car : \(objCar.speedPrint(Speed: objCar.speed)) ")
objCar.makeNoise()
print(objCar.desc)
print(objCar.gear)

print()

var objCycle = Cycle()
objCycle.hasBasket = true
objCycle.seat = 1
objCycle.speed = 20
print("Cycle : \(objCycle.speedPrint(Speed: objCycle.speed)) and seat is \(objCycle.seat)")
objCycle.makeNoise()

//optional chaining

class ElectionPoll {
    var candidate: Pollbooth?
    
}

class Pollbooth {
    var name = "MP"
}
let cand = ElectionPoll()

if let candname = cand.candidate?.name {
    print("Candidate name is \(candname)")
} else {
    print("Candidate name cannot be retreived")
}


class Person {
    var residence: Residence?
}
class Residence{
    var rooms : [Room] = []
    var numberOfRooms : Int {
        return rooms.count
    }
    subscript(index: Int) -> Room {
        get{
            return rooms[index]
        }
        set{
            rooms[index] = newValue
        }
    }
    func printRooms(){
        print("Number of Rooms are \(numberOfRooms)")
    }
    var address : Address?
}


class Room {
    let name: String
    init(name: String) { self.name = name }
}


class Address{
    var buildingName : String?
    var buildingNumber : String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
    
}

let dev = Person()
if let roomCount = dev.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//dev.residence = Residence()
/*if let a = dev.residence?.address?.street {
 print("Street is \(a)")
 }else {
 print("No nil")
 }
 */

let someAddress = Address()
someAddress.buildingNumber = "15"
someAddress.buildingName = "ABC"
dev.residence?.address = someAddress
/** if left hand is there is nil then right hand side expression can't evaluated **/
//print(dev.residence?.address)

if let firstRoomName = dev.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

var house = Residence()
house.rooms.append(Room(name: "Room1"))
house.rooms.append(Room(name: "Room2"))
dev.residence = house

if let a = dev.residence?.numberOfRooms {
    print("Rooms are \(a)")
}else {
    print("Rooms are not available")
}
print()

//exception handling
enum DivideByZerError : Error {
    case divideByZero
}

func divison(num : Int , denomi : Int) throws {
    if denomi == 0 {
        throw DivideByZerError.divideByZero
    }else {
        print("Division of \(num)/\(denomi) is : \(num/denomi)")
    }
}

do{
    try divison(num: 10, denomi: 5)
}catch DivideByZerError.divideByZero {
    print("Can't Divide by zero")
}

//
print()
enum FileError : Error {
    case fileNotFount
    case maxSizeReached
    case readPersmissionOnly
}

struct FileInfo {
    var fileName : String
    var fileSize : Int
    var readOnly : Int
}

class FileAccess {
    var fileInfo = [
        "StudentList" : FileInfo( fileName : "StudentFile" , fileSize : 27  , readOnly : 1),
        "TeacherList" : FileInfo( fileName : "TeacherFile" , fileSize : 10  , readOnly : 0),
        "StudentList2" : FileInfo( fileName : "StudentFile2" , fileSize : 22  , readOnly : 1)
    ]
    
    var maxFileSize = 2
    
    func fileope (fileName name : String) throws {
        //print("In fileope")
        
        
        if fileInfo.contains(where: { return $0.key == name})
        {
            if fileInfo[name]!.fileSize > maxFileSize {
                throw FileError.maxSizeReached
            }else{
                if fileInfo[name]?.readOnly == 0 {
                    throw FileError.readPersmissionOnly
                }else {
                    print("File name is \(fileInfo[name]!.fileName) Size is \(fileInfo[name]!.fileSize) and Allowed to read")
                }
            }
            
        }else {
            throw FileError.fileNotFount
        }
        
        
    }
}
do{
    //print("In Do")
    var file = FileAccess()
    try file.fileope(fileName: "StudentList")
    
    
    
}catch FileError.fileNotFount {
    print("Invalid file")
}catch FileError.maxSizeReached {
    print("Max size reached")
}catch FileError.readPersmissionOnly {
    print("File can't View Due to security")
}
//nested type
class Cricketer {
    var profile = Profile()
    class Profile{
        var run = 10000
        var highScore = 150
        
        func printDetails () {
            print("Runs are \(run) High score are \(highScore)")
        }
    }
}
var objCricket = Cricketer()
objCricket.profile.printDetails()


class Student2 {
    enum StudentType {
        case Topper
        case Average
        case Poor
    }
    
    func remark() -> StudentType {
        return .Topper
    }
}


var obj1 = Student2.StudentType.Average
var obj2 = Student2.StudentType.Topper
print(obj1)
print(obj2)


//type casting
class PlayerCricketType {
    var name : String
    init(name: String) {
        self.name = name
    }
}
class Batsman : PlayerCricketType{
    var batType : String
    init(battype: String , name : String){
        self.batType = battype
        super.init(name: name)
    }
}
class Bowler : PlayerCricketType{
    var bolType : String
    init(boltype: String , name : String){
        self.bolType = boltype
        super.init(name: name)
    }
}

let arr : [PlayerCricketType] = [
    Batsman(battype: "Right hand", name: "MS"),
    Batsman(battype: "Right hand", name: "ST"),
    Bowler(boltype: "Off spin", name: "RA"),
    Bowler(boltype: "Leg spin", name: "RJ"),
    Batsman(battype: "Right hand", name: "ST")
]
var batCount = 0
var bolCount = 0
for item in arr {
    if item is Batsman{
        batCount += 1
    } else if item is Bowler {
        bolCount += 1
    }
    
}
print(batCount)
print(bolCount)

for item in arr {
    if let name =   item as? Batsman{
        print("\(name.batType) \(name.name)")
    } else if let name =   item as? Bowler{
        print("\(name.bolType) \(name.name)")
    }
    
}

print()
//weak unowned
class Person1 {
    var name:String
    var job : Job?
    
    init(name: String){
        print("Init of Person1")
        self.name = name
    }
    
    func printName(){
        print("name is \(name)")
    }
    
    deinit{
        print("Deinit of Person1")
    }
}


class Job {
    var jobDesc: String
    weak var person : Person1?
    
    init(jobDesc : String){
        print("Init of Job")
        self.jobDesc = jobDesc
    }
    deinit{
        print("deinit of Job")
    }
}


if (1 == 1)
{
    var objPerson = Person1(name: "Devarsh")
    var objJob = Job(jobDesc: "Jobbbbb")
    objPerson.job = objJob
    objJob.person = objPerson
    //    print(CFGetRetainCount(objJob))
}

print()
// protocol
protocol SeriesProtocol {
    var name : String { get }
    var seasonCount : Int { get }
    var rating : Float { get }
    var review : String? { get }
    
    init(name: String , seasonCount : Int , rating : Float) //need to write required in Class when we use this init()
    mutating func giveReview(reviewFromUser : String) -> () // need to write mutating keyword when we are using struct, in class don't need mutating
    func displayDetails() -> ()
}

struct SeriesCheck : SeriesProtocol {
    var name: String
    var seasonCount: Int
    var rating: Float
    var review: String?
    var seriesType:SeriesType?
    
    
    init(name: String , seasonCount : Int , rating : Float) {
        self.name = name
        self.seasonCount = seasonCount
        self.rating = rating
    }
    
    mutating func giveReview(reviewFromUser: String) {
        self.review = reviewFromUser
    }
    
    func displayDetails() {
        print("The sereis \(name) has \(seasonCount) season and has rating of \(rating) and Review is : \(review ?? "No review Available")")
    }
}

var objSeries = SeriesCheck(name: "Elite", seasonCount: 6, rating: 8.3)
objSeries.giveReview(reviewFromUser: "Must watch this , you'll learn a lot from this ")
objSeries.displayDetails()
print()

//extension
extension SeriesProtocol {
    func isGood(seasonCount : Int, rating : Float) -> (){
        if seasonCount > 3 && rating >= 8 {
            print("worth to waste time")
        }else {
            print("Don't waste your time")
        }
    }
}


extension SeriesCheck {
    
    init(name: String , seasonCount : Int , rating : Float , type:SeriesCheck.SeriesType) {
        self.name = name
        self.seasonCount = seasonCount
        self.rating = rating
        self.seriesType = type
    }
    
    struct CastName {
        var castName : [String]
        
        init(castName: [String]) {
            self.castName = castName
        }
        func printCasttt() -> () {
            for i in castName {
                print(i)
            }
        }
    }
    enum SeriesType {
        case Thriller
        case Action
        case Horror
        case Scifi
        case Comdy
        case No_Type_Available
        
    }
    
    
    func getSeriesType() -> SeriesType {
        if let a = self.seriesType {
            return a
        }else {
            return SeriesType.No_Type_Available
        }
    }
    
    func test() -> () {
        print("test")
    }

}
var objSeries2 = SeriesCheck(name: "Vampire Diaries", seasonCount: 8, rating: 8.3 , type: SeriesCheck.SeriesType.Thriller)
objSeries2.isGood(seasonCount: objSeries2.seasonCount, rating: objSeries2.rating)
print("Series type : \(objSeries2.getSeriesType())")
objSeries2.giveReview(reviewFromUser: "Must watch this , you'll learn a lot from this ")
objSeries2.displayDetails()


class Series2 {
    var cast : [String]
    var details : SeriesProtocol
    init(cast : [String] , detai : SeriesProtocol){
        self.cast = cast
        self.details = detai
    }
    
    func prinntD() -> () {
        print("\(details.name)  \(details.rating) \(details.seasonCount) ")
        print("Case is ")
        for i in cast {
            print(i)
        }
    }
    
}
var objSeries3 = Series2(cast: ["1","2","3"], detai: SeriesCheck(name: "Elite", seasonCount: 6, rating: 8.3))
objSeries3.prinntD()
var objSeries4 = objSeries3
var objSeries5 = objSeries3


extension SeriesCheck {
    subscript (index: Int) -> Int {
        return index
    }
}

print(objSeries2[0])



print()

protocol SomeProtocol {
    //init()
}



class SomeSuperClass {
    var nameS : String
    init(name : String) {
        nameS = name
        print("Init of super class")
    }
    init(){
        nameS = " "
        print("Empty init")
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    
    required override init() {
        print("Init in sub class")
        
        super.init(name: "test")
    }
    
    override init(name: String) {
        print("Sub class init name param")
        super.init()
    }
}
var objSub2 = SomeSubClass()
var objSubClass = SomeSubClass(name: "hh")

print()




//optional chaining
class Chaining {
    var str: Str? = Str()
    init?(_ flag: Bool) {
        if !flag { return nil }
    }
    struct Str {
        var arr: [Int]? = [1, 2, 3]
    }
}
print(Chaining(false)?.str?.arr?.last ?? 1)
let chain = Chaining(true)
print((Chaining(false) ?? chain)?.str?.arr?.last ?? "hi")


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

//delegate
print()
struct CalculatorVariable {
    var num1:Int
    var num2:Int
    var Operation: Operation
}

enum Operation {
    case Addition
    case Subtraction
    case Multiplication
    case Division
}

protocol CalculatorProtocol {
    func add(calVar: CalculatorVariable) -> Int
    func sub(calVar: CalculatorVariable) -> Int
    func mul(calVar: CalculatorVariable) -> Int
    func div(calVar: CalculatorVariable) -> Int
}
class Calculator{
    var delegate : CalculatorProtocol?
    
    func calculatePerform(calVar: CalculatorVariable) {
        var operation = calVar.Operation
        
        switch operation {
        case .Addition:
            
            guard let a = delegate?.add(calVar: calVar) else {
                return
            }
            print(a)
            
        case .Subtraction :
            guard let a = delegate?.sub(calVar: calVar) else {
                return
            }
            print(a)
        case .Multiplication:
            guard let a = delegate?.mul(calVar: calVar) else {
                return
            }
            print(a)
        case .Division:
            guard let a = delegate?.div(calVar: calVar) else {
                return
            }
            print(a)        }
        
    }
}

class CalcultorPerform : CalculatorProtocol {
    func add(calVar: CalculatorVariable) -> Int {
        return calVar.num1 + calVar.num2
    }
    func sub(calVar: CalculatorVariable) -> Int {
        return calVar.num1 - calVar.num2
    }
    func mul(calVar: CalculatorVariable) -> Int {
        return calVar.num1 * calVar.num2
    }
    func div(calVar: CalculatorVariable) -> Int {
        return calVar.num1 / calVar.num2
    }
}

var objCalPerform = CalcultorPerform()
var objCalculator = Calculator()
objCalculator.delegate = objCalPerform
objCalculator.calculatePerform(calVar: CalculatorVariable(num1: 10, num2: 10, Operation: Operation.Addition))
objCalculator.calculatePerform(calVar: CalculatorVariable(num1: 50 , num2: 10, Operation: Operation.Subtraction))


struct Cookie {
    var size:Int = 5
    var hasChocolateChips:Bool = false
}

protocol BakeryDelegate {
    func cookieWasBaked(_ cookie: Cookie)
    func preferredCookieSize() -> Int
}



class Bakery{
    var delegate:BakeryDelegate?
    
    func makeCookie(){
        var cookie = Cookie()
        cookie.size = delegate?.preferredCookieSize() ?? 6
        cookie.hasChocolateChips = true
        
        delegate?.cookieWasBaked(cookie)
    }
}
class CookieShop: BakeryDelegate{
    func cookieWasBaked(_ cookie: Cookie){
        print("cookie was baked, with size \(cookie.size)")
    }
    
    func preferredCookieSize() -> Int{
        return 12
    }
}

let shop = CookieShop()

let bakery = Bakery()
bakery.delegate = shop

bakery.makeCookie()


enum Marks {

    case gpa(Double, Double, Double)
    case grade(String, String, String)
}


var marks1 = Marks.gpa(3, 2.9, 3.8)
print(marks1)
var marks2 = Marks.grade("A", "B", "C")
print(marks2)

enum Pizza {

  // named associated value
  case small (inches: Int)
  case medium (inches: Int)
  case large (inches: Int)
}

// pass value using provided names
var pizza1 = Pizza.medium(inches: 12)
print(pizza1)

enum Vehicle: String {

  case car = "Four Wheeler"
  case bike = "Two Wheeler"
}
Vehicle.car.rawValue    

var aaa: Set = [
    [1:"One"],
    [2:"Two"]
]
print(type(of: aaa))

enum Testttt {
    case one(name: String)
    case two( String = "Dev", Int = 10)
    case three(name: String = "Dev")
    
}
var nameee2 = Testttt.two()
var nameeee = Testttt.one(name: "Devarsh")
switch nameee2 {
case .one(let name):
    print("\(name)")
case .two(let name,let age):
    print("\(name) \(age)")
case .three(let name):
    print(name)
}

class ExTest {
    private var a: Int = 10
}
extension ExTest {
    func test() {
        print(a)
    }
}
//
//class ST {
//    var a = 10
//}
