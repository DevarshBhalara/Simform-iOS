
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
