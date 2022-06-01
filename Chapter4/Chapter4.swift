/* 4. Objects and Classes */
/* Basic */
class Animal {
    let numberOfLegs: Int
    let name: String
    
    init(leg: Int, name: String) {
        numberOfLegs = leg
        self.name = name
    }
    
    deinit {
        print("\(name) die")
    }
    
    func introduce() -> String {
        return "My name is \(name) and I have \(numberOfLegs) legs"
    }
}

var animal1 = Animal(leg: 4, name: "Alpha")
print(animal1.introduce())

animal1 = Animal(leg: 2, name: "Beta")
print(animal1.introduce())

/* Inheritance */
class Human: Animal {
    let job: String

    init(name: String, job: String) {
        self.job = job
        super.init(leg: 2, name: name)
    }
    
    func introduceAnimal() -> String {
        return super.introduce()
    }
    
    override func introduce() -> String {
        return "My name is \(name) and my job is \(job)"
    }
}

var human1 = Human(name: "Gamma", job: "Student")
print(human1.introduce())
print(human1.introduceAnimal())

/* Getter, Setter */
class Square {
    var sideLength: Double = 0.0
    var name: String
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        self.name = name
    }
    
    var perimeter: Double {
        get {
            return 4.0 * sideLength
        }
        set {
            sideLength = newValue / 4.0
        }
    }
}

var square = Square(sideLength: 10, name: "Sqaure1")
print(square.perimeter)
square.perimeter = 20
print(square.sideLength)

/* Optional Value */
var human2: Human?
print(human2?.name)
human2 = Human(name: "Delta", job: "Army")
print(human2?.name)
