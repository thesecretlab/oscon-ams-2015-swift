//: Playground - noun: a place where people can play

import UIKit

var str : String? = "Hello, playground"

if let theString = str {
    
    // this will only run when str has a value
    
    theString.capitalizedString
    
}

var primes : [Float] = [2,3,5,7,11,13]

var translation : [String:AnyObject] = [
    "hello":1,
    "goodbye":"au revior"
]

var setOfPeople : Set<String> = ["Mike","Sally","Jane","Sally"]

for (key,value) in translation {
    print(key)
}

var conference = (name:"oscon", location:"amsterdam")
conference.name

func foo() {
    
    let str : String? = nil
    
    guard let theString = str else {
        // deal str == nil
        return
    }
    
}

var i = 5

switch i {
case 0:
    print("i is 0")
case 1..<5:
    print("i is between 1 and 5 exclusive")
default:
    break
}

//func addNumber(number1:Int, toNumber number2:Int) -> Int {
//    return number1 + number2
//}
//
//addNumber(1, toNumber: 2)

var addNumber = { ( item1 number1 : Int, item2 number2 : Int ) -> Int in
    return number1+number2
}

addNumber(item1: 1, item2:2)

func applyOperationToNumber(number: Int, operation: (Int)->Int) -> Int {
    return operation(number)
}

applyOperationToNumber(5) { (number) -> Int in
    return number+2
}

private class Car : NSObject {
    
    var paintColor : UIColor? {
        willSet {
            self.paintColor = UIColor.greenColor()
        }
        didSet {
            
        }
    }
    
    lazy var databaseConnection : String = {
        return "foo"
    }()
    
    var speed : Float {
        get {
            return 2.0
        }
        set {
            print("Setting value to \(newValue)")
        }
    }
    
    override init() {
        super.init()
        // do setup here
    }
    
    convenience init(color:UIColor) {
        self.init()
        self.paintColor = color
    }
    
    deinit {
        
    }
    
    class func areCarsFun() -> Bool {
        return true
    }
    
}


Car.areCarsFun()


extension String {
    func soundTheAlarm() {
        print("WOOOOOO")
    }
}

"foo".soundTheAlarm()


struct Box {
    var width : Float = 1.0
    var depth : Float = 2.0
    var height : Float = 1.0
    
    
}

var box1 = Box(width: 1, depth: 2, height: 3)
var box2 = box1
box2.width = 5


box1.width
box2.width

var data = "foo".dataUsingEncoding(NSUTF8StringEncoding)

func getAnImage() -> UIImage {
    UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
    defer {
        UIGraphicsEndImageContext()
    }
    
    return UIGraphicsGetImageFromCurrentImageContext()
}

protocol Driving {
    func drive()
}

extension Driving {
    func drive() {
        print("I'm driving!")
    }
}

class Motorcycle : Driving {
    
}

extension Car : Driving {
    
}

var drivingThing : Driving = Car()
drivingThing.drive()

class Tree<T : Equatable> {
    
    var data : T?
    
    var children : [Tree<T>] = []
    
    func addChildNode(value:T) -> Tree<T> {
        let newNode = Tree()
        newNode.data = value
        children.append(newNode)
        return newNode
    }
    
    func searchForValue(value: T) -> Tree<T>? {
        
        if data == value {
            return self
        }
        
        for child in children {
            let result = child.searchForValue(value)
            if result != nil {
                return result
            }
        }
        
        return nil
    }
    
}

let intTree = Tree<Int>()
intTree.addChildNode(1)
intTree.addChildNode(2)
intTree.addChildNode(3).addChildNode(2)

intTree.searchForValue(4)

enum CompassPoint {
    case North
    case South
    case East
    case West
}

var direction : CompassPoint

direction = .North

enum Planet : Int {
    case Mercury = 1, Venus, Earth,Mars,Jupiter,Saturn, Uranus, Neptune
}

enum Beverage {
    case Tea(milk: Bool, sugar:Bool)
    case Coffee(milk: Bool, sugar:Bool)
    case Soda(name: String)
}

var myDrink = Beverage.Tea(milk: false, sugar: false)

var mySoda = Beverage.Soda(name: "Coca-Cola")

switch myDrink {
    
case .Tea(let milk,_):
    print("It's tea, milk = \(milk)")
case .Soda("Coca-Cola"):
    print("It's soda, specifically coca-cola")
default:
    print("It's something else!")
    
}

infix operator ** { associativity left precedence 160 }

func + (left:String, right:CustomStringConvertible) -> String {
    return left + right.description
}

"foo"+1

"foo"+Car()

var myNumber = UInt64.max

myNumber = myNumber &+ 1


func ** (left:Double, right:Double) -> Double {
    return pow(left, right)
}

4 ** 3

prefix operator +++ {}

prefix func +++(inout int : Int) -> Int {
    return int+2
}
var j = 4

+++j

let sorted = primes.sort({$1 < $0})
print(sorted)

let filtered = primes.filter({$0 > 10})
print(filtered)

let reduced = primes.reduce("", combine: {(initial :String, next:Float) in
    return initial + next.description
})

let mapped = primes.map({$0 * 3})

let formatter = NSNumberFormatter()

formatter.numberStyle = .CurrencyStyle
formatter.currencySymbol = "😻"
formatter.stringFromNumber(103.67)

formatter.roundingIncrement = 0.5
formatter.stringFromNumber(103.67)
formatter.roundingIncrement = 0.0

let energyFormatter = NSEnergyFormatter()

energyFormatter.stringFromValue(50.6, unit: .Kilocalorie)

let massFormatter = NSMassFormatter()

massFormatter.stringFromKilograms(67.4)

let dateFormatter = NSDateFormatter()
dateFormatter.dateStyle = .FullStyle
dateFormatter.timeStyle = .MediumStyle
dateFormatter.timeZone = NSTimeZone(name: "Europe/London")
dateFormatter.stringFromDate(NSDate())

dateFormatter.dateFormat = "yyyy-MM-dd"
let theDate = dateFormatter.dateFromString("2015-10-28")

let components = NSCalendar.currentCalendar().components([.Year,.Month,.Day], fromDate: theDate!)

components.year
components.month
components.day

let theString = "Hello the world"
theString.uppercaseString
theString.lowercaseString
theString.capitalizedString

theString.hasPrefix("Hello")
theString.rangeOfString("thE", options: .CaseInsensitiveSearch, range: nil, locale: nil)

theString.containsString("the")

struct Foo {
    var int : Int
    
    mutating func changeMyValue(newInt: Int) -> Void {
        self.int = newInt
    }
}

var f = Foo(int: 2)

f.changeMyValue(3)






















