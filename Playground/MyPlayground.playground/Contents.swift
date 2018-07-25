//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//print(str)
//
//var `class` = "Kompong Cham"
//
//print(`class`)

//let age = 22
//
//if age < 18 {
//    print("You are too young.")
//}else{
//    print("You are old enough.")
//}


//let numberOfLoginAttempts = 10      // Declare as Constant
//var currentLoginAttempt = 0         // Declare as Variable
//
//currentLoginAttempt = 1
//
//print(currentLoginAttempt)

//var x = 1
//var y = 2
//var z = 3

//var x=1, y=2, z=3
//
//var welcome​​Message:String
//welcomeMessage = "Hello everyone!"
//
//print(welcomeMessage)
//
//var អាយុ​ = 25
//print(អាយុ​)

//var age:Int = 20
//
//age = "Hello"       //  Error (Type-Safe)
//
//print(age)

//var age = 10
//
//age = "hello"       // type inference
//
//print(age)

//
//var age:UInt8 = 100     // Integer Value
//
//age = 255
//
//print(age)
//
//var isAdult = true     // Boolean Value
//
//if isAdult == true {
//    print("You can join")
//}else {
//    print("You can not join")
//}


//var str:String = "Hello World. Hello world"
//
//print(str)
//
//var multiString = """
//    hello everyone.
//How are you?
//                        Thank you!
//"""
//print(multiString)

//var myStr = "Hello \\\"Jonh\""
//print(myStr)

//var mySign = "\u{B5}"
//print(mySign)

//var age = 30
//
//var str = "My age is \(age+1)"
//age
//
//print(str)

//var salary:Int? = 100       // Declare as Optional
//
//salary = 0
//
//print(salary)


//var a = 1 + 3
//print(a)
//
//var b = "Hello" + " World"
//print(b)
//
//var c = 9 % 4
//print(c)

//var a = 10
//
//a += 20             // a = a + 20
//
//print(a)


//var a = 10
//var b = 10
//
//print(a >= b)

//var a = 5
//var b = 3
//
//var result = a < b ? "a is less than b":"a is bigger than b"
//
//print(result)

//var rangeValue = 1...5  // Closed Range Operator
//var haftRangeOperator = 1..<5     // Half-Open Range Operator
//
//for i in haftRangeOperator {
//    print(i)
//}


//var a = ...5            // One sided range
//var b = 5...
//
//a.contains(-5959599595959)
//b.contains(5959599595959)


//var temperatureInFahrenheit = 30
//
//if temperatureInFahrenheit <= 32 {
//    print("It's cold.")
//}


//var result: String = ""
//
//var score = 90

//if score < 50 {
//    result = "F"
//}else if score <= 60 {
//    result = "E"
//}else if score <= 70 {
//    result = "D"
//}else if score <= 80 {
//    result = "C"
//}else if score <= 90 {
//    result = "B"
//}else if score <= 100 {
//    result = "A"
//}else {
//    print("Invalid Score")
//}

//switch score {
//case 0..<50:
//    result = "F"
//case 50...60:
//    result = "E"
//case 60...70:
//    result = "D"
//case 70...80:
//    result = "C"
//case 80...90:
//    result = "B"
//case 90...100:
//    result = "A"
//default:
//    print("Invalid Score")
//}
//
//print("Finally, you got grade \(result)")

//let someCharacter: Character = "a"
//
//switch someCharacter {
//case "a":
//    print("This is letter a.")
//    fallthrough
//case "z":
//    print("This is letter z.")
//default:
//    print("This is no letter match.")
//}



//let month: Int = 13
//
//switch month {
//case 1,3,5,7,8,10,12:
//    print("This month has 31 days")
//case 2:
//    print("This month has 28 or 29 days")
//case 4,6,9,11:
//    print("This month has 30 days")
//default:
//    print("Error. No this month")
//}


// for-in loops with array

//let arrays = ["Apple", "Banana", "Mango", "Grape"]
//
//for arr in arrays {
//    print(arr)
//}


// for-in loop with range of range

//let range = 1...10
//
//for r in range {
//    print(r)
//}

// for-in loop with String

//let str = "Apple"
//
//for ch in str {
//    print(ch)
//}

//let myPrediction = 5
//let range = 1...10
//
//for r in range {
//    if r == myPrediction {
//        print("You win")
//        break
//    }
//}

//var i = 10
////while i < 10 {
////    print(i)
////   // i += 1
////}
//
//repeat {
//    print(i)
//    i += 1
//}while i < 10

//
//for i in 1...5 {
//    if i == 3 {
//        break       // continue
//    }
//    print(i)
//    print(i)
//    print(i)
//}

// Arrays

//var arr = [1, 2, 3, 4, 5]

//print(arr[2])

// Multi Dimensonal Array
//var multiArr = [[1,2,3], [4,5,6]]
//
//print(multiArr[0][2])

// Append Element to array

//arr.append(6)
//print(arr)

//var array = Array<Int>()
//
//print(array)
//array.append(2)
//array.append(5)
//print(array)

// Insert element to array at a specific index

//arr.insert(6, at: 3)
//print(arr)

// Remove Array Elements
//arr.remove(at: 3)
//arr.removeFirst()
//arr.removeLast()
//arr.removeAll()

//print(arr)
//print(arr.count)
//print(arr.isEmpty)

// Sort Arrays

//var arr = [3,4,5,1,6,7,8]

//print(arr)
//arr.sort()
//print(arr)
//arr.sort() { $0 > $1 }
//print(arr)

//var newArr = arr.sorted()

//print(arr)
//print(newArr)

//let filterArr = arr.filter { $0 < 3 || $0 > 7 }
//print(filterArr)
//
//arr.forEach{ print($0) }
//
//for a in arr {
//    print(a)
//}

// ------ Set ----------

//var set = Set<Int>()
//
//print(set)
//
//set.insert(1)
//set.insert(2)
//set.insert(3)
//set.insert(1)
//
//print(set)
//
//var set: Set<Int> = [1,2,4,4,5]
//
//print(set)
//
//for s in set {
//    print(s)
//}

// ---- Dictionary ----

//var dic = Dictionary<Int, String>()    // Declare Dictionary
//var dic1 = [Int: String]()             // Declare Dictionary
//
//var dic2:[Int: String] = [1:"Dara",2:"Heng",3:"Khema"]    // Literal Dictionary
//
//print(dic2[2]!)         // Accessing dictionary value
//
//dic2[4] = "Channa"      // Add key-value to dictionary
//
//print(dic2)
//
//dic2.updateValue("Daro", forKey: 1)
//
//print(dic2)

//dic2.removeValue(forKey: 3)
//
//print(dic2)

// ------ Tuples -------

//var person = ("Dara", 20, true)
//var person = (name:"Dara", age:20, single:true)
//
//print("He is \(person.name). He is \(person.age) years old.")


//var city = "Boston"
//var team = "Red Sox"

//var (city, name) = ("Boston", "Red Sox")
//
//print(city)
//print(name)

//person.name = "Lida"            // Update Tuple value
//
//print(person)

// ------ Class & Structure -------

//struct Resolution {
//    var width = 0
//    var height = 0
//}
//
//class VideoMode {
//    var resolution = Resolution()
//    var frameRate = 0.0
//    var name: String?
//}

//class Employee {
//    var firstName: String
//    var lastName: String
//    var salaryYear: Float
//
//    var salaryWeek: Float {
//        set(newSalaryWeek){
//            salaryYear = newSalaryWeek * 52
//        }
//        get{
//            return salaryYear / 52
//        }
//    }
//
//    init() {
//        firstName = "Heng"
//        lastName = "Dara"
//        salaryYear = 150.0
//        print("Initializer is called...")
//    }
//
//    init(firstName:String, lastName:String, salaryYear:Float) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.salaryYear = salaryYear
//    }
//}
//
////var emp1 = Employee(firstName: "Hong", lastName: "Channa", salaryYear: 200.0)
////print(emp1.firstName)
////print(emp1.salaryYear)
////print(emp1.salaryWeek)
////emp1.salaryWeek = 4
////print(emp1.salaryYear)
////print(emp1.salaryWeek)
//
////class StepCounter {
////    var totalStep: Int = 0 {
////        willSet {
////            print("About to set new value \(newValue)")
////        }
////        didSet {
////            print("Added \(totalStep - oldValue) steps")
////        }
////    }
////}
////
////var sc = StepCounter()
////sc.totalStep = 50
////
////sc.totalStep = 150
//
//class Student {
//    var id:Int
//    var name:String
//    static var school:String = "KSHRD"
//    
//    init() {
//        self.id = 0
//        self.name = ""
//    }
//
//    func getInfo() {
//        print("Student Info [ID:\(id), name:\(name), school:\(Student.school)]")
//    }
//}
//var stu = Student()
//stu.id = 1
//stu.name = "Sun Mengly"
//
////print(Student.school)
//
////print("Student Info [ID:\(stu.id), name:\(stu.name), school:\(Student.school)]")
//stu.getInfo()
//
//var stu1 = Student()
//stu1.id = 2
//stu1.name = "Chan Dara"
//
//stu1.getInfo()

// ------- Inheritance ---------

// Defining base class

//class Vehicle {
//    var currentSpeed = 0
//    var description:String {
//        return "Travelling at \(currentSpeed) km per hours"
//    }
//
//   func makeNoise() {
//
//    }
//}
//
//class Bicycle: Vehicle {
//    var hasBasket = false
//
//    override func makeNoise() {
//        print("Bicycle No sound.")
//    }
//}
//
//var bi = Bicycle()
//bi.currentSpeed = 5
//bi.hasBasket = true
//print(bi.description)
//bi.makeNoise()
//
//class Car:Vehicle {
//    var gear = 1
//    override var description: String {
//        return super.description + " in gear \(gear)"
//    }
//    override func makeNoise() {
//        print("toek toek ...")
//    }
//}
//var car = Car()
//car.currentSpeed = 100
//print(car.description)
//car.makeNoise()


// ------ Function and Closure

//func sayHello(person:String) -> String {
//    return "Hello \(person)"
//}
//
//let str = sayHello(person: "Dara")
//print(str)

//func sayHello(person:String) {
//    print("Hello \(person)")
//}
//
//sayHello(person: "Dara")

//func findMinMax(_ array: [Int], _ a:Int) -> (min:Int, max:Int) {
//    var currentMin = array[0], currentMax = array[0]
//
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        }else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//var arr = [10, 3, 4, 5, 15, 19, 30]
//
//var value = findMinMax(arr, 19)
//print("Minimum Value: \(value.min)")
//print("Maximum Value: \(value.max)")

//func findSumAndAvg (array: [Int]) -> (sum: Int, avg: Int) {
//    var currentSum = 0
//    var currentAvg = 0
//
//    for value in  array[0..<array.count] {
//        currentSum += value
//    }
//        currentAvg = currentSum / array.count
//        return (currentSum, currentAvg)
//}
//
//var arr = [10,20,30,40,50]
//
//var (Sum, Avg) = findSumAndAvg(array: arr)
//print("Sum All Array \(Sum)")
//print("Avg \(Avg)")

//func arithmeticMean(_ values: Int...) -> Int {
//    var total = 0
//
//    for value in values {
//        total += value
//    }
//    return total / values.count
//}
//
//var mean = arithmeticMean(1,2,3,4,5,6)
//print(mean)

//func swapTwoNumbers(firstNum: inout Int, secondNum: inout Int) {
//    let temp = firstNum
//    firstNum = secondNum
//    secondNum = temp
//}
//
//var x = 10, y = 20
//print("Before swap: x:\(x), y:\(y)")
//swapTwoNumbers(firstNum: &x, secondNum: &y)
//print("After swap: x:\(x), y:\(y)")


//func chooseStepFunction(backward: Bool) -> ((Int) -> Int) {
//    func stepForward(_ input:Int) -> Int{
//        return input + 1
//    }
//    func stepBackward(_ input: Int) -> Int {
//        return input - 1
//    }
//    return backward ? stepBackward:stepForward
//}
//
//var chooseStep = chooseStepFunction(backward: true)
//var value = chooseStep(10)
//print(value)


//func countingClosure() -> (() -> Int) {
//    var counter = 0
//
////    func incrementCounter() -> Int {
////        counter += 1
////        return counter
////    }
//    let incrementCounter = { () -> Int in
//        counter += 1
//        return counter
//    }
//    return incrementCounter
//}
//
//var counting = countingClosure()
//var value = counting()
//print(value)

//var sum: (Int, Int) -> Int
//
//sum = { $0 + $1 }
//
//
//var result = sum(10, 20)
//
//print(result)


//func showMessage(completion:(String) -> Void) {
//    let msg = "Hello Everyone"
//    completion(msg)
//}
//
//showMessage { (msg) in
//    print(msg)
//}

// ---------- Protocol ------------

//protocol FullyNamed {
//    var fullName: String { get }
//}
//
//class Employee:FullyNamed {
//
//    var firstName:String
//    var lastName:String
//    var salary:Float
//
//    var fullName: String {
//        return firstName + " " + lastName
//    }
//
//    init() {
//        self.firstName = ""
//        self.lastName = ""
//        self.salary = 0.0
//    }
//}
//
//var emp = Employee()
//emp.firstName = "Seng"
//emp.lastName = "Hong"
//emp.salary = 100.0
//
//print(emp.fullName)

//protocol VehicleSound {
//    mutating func makeNoise()
//}
//
//struct Car:VehicleSound {
//    var carNoise:String = ""
//
//    mutating func makeNoise() {
//        carNoise = "Toek toek...."
//        print(carNoise)
//    }
//}
//
////struct Train:VehicleSound {
////    func makeNoise() {
////        print("Choo choo...")
////    }
////}
//
//var c = Car()
//c.makeNoise()
//var t = Train()
//t.makeNoise()

//protocol ICalculator {
//    func sum(a:Int, b:Int) -> Int
//}
//
//class Calculator: ICalculator {
//    func sum(a: Int, b: Int) -> Int {
//        return a + b
//    }
//}
//
//class Main {
//    var a:Int
//    var b:Int
//    var ic:ICalculator
//
//    init(a:Int, b:Int, ic:ICalculator) {
//        self.a = a
//        self.b = b
//        self.ic = ic
//    }
//
//    func sum() -> Int{
//        return ic.sum(a: a, b: b)
//    }
//}
//
//let m = Main(a: 10, b: 20, ic: Calculator())
//let sum = m.sum()
//print(sum)

//protocol A:AnyObject {      // Class-Only
//    func a()
//}
//
//
//class B:A {
//    func a() {
//
//    }
//}


//extension Double {
//    var km:Double { return self * 1_000.0 }
//    var m:Double { return self }
//    var cm:Double { return self / 100.0 }
//}
//
//var num:Double = 20
//print(num.km)



//class Welcome {
//    var str: String = "Hello everyone"
//}
//
//extension Welcome {
//    func sayHello() {
//        print(str)
//    }
//}
//
//var wel = Welcome()
//wel.sayHello()


//protocol A {
//    func show()
//}
//
//class B{
//    var str = "Hello"
//}
//
//extension B: A {
//    func show() {
//        print(str)
//    }
//}
//
//var b = B()
//b.show()


enum PlayerNumberError: Error {
    case NumberTooHigh(description: String)
    case NumberTooLow(description: String)
    case NumberAlreadyAssigned
    case NumberNotExist
}

typealias BaseballPlayer = (firstName: String, lastName:String, number: Int)

struct BaseballTeam {
    var players: [Int: BaseballPlayer]
    var maxNumber: Int
    var minNumber: Int
    
    mutating func addPlayer(player: BaseballPlayer) throws {
        guard player.number < maxNumber else {
            throw PlayerNumberError.NumberTooHigh(description: "Max number is \(maxNumber)")
        }
        guard player.number > minNumber else {
            throw PlayerNumberError.NumberTooLow(description: "Min number is \(minNumber)")
        }
        guard players[player.number] == nil else {
            throw PlayerNumberError.NumberAlreadyAssigned
        }
        
        players[player.number] = player
    }
    
    func getPlayer(number: Int) throws -> BaseballPlayer {
        if let player = players[number] {
            return player
        }else {
            throw PlayerNumberError.NumberNotExist
        }
    }
}

var myTeam = BaseballTeam(players: [:], maxNumber: 99, minNumber: 1)

var player1 = (firstName: "Heng", lastName:"Dara", number:10)
var player2 = (firstName: "Sun", lastName:"Mengly", number:20)
var player3 = (firstName: "Chann", lastName:"Davy", number:30)

do {
    try myTeam.addPlayer(player: player1)
    try myTeam.addPlayer(player: player2)
    try myTeam.addPlayer(player: player3)
} catch let error{
    print(error)
}


do {
    let player = try myTeam.getPlayer(number: 20)
    print("Player is \(player.firstName) \(player.lastName)")
} catch PlayerNumberError.NumberNotExist {
    print("There is no player who has that number")
}























