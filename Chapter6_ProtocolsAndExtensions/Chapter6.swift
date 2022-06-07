/* 6. Protocols and Extensions */
/* Protocol */
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 991221
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
print(a.simpleDescription)
a.adjust()
print(a.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A very simple structure"
    
    mutating func adjust() {
        simpleDescription += " (adjusted)."
    }
}

var b = SimpleStructure()
print(b.simpleDescription)
b.adjust()
print(b.simpleDescription)

var arr: [ExampleProtocol] = [a, b]
print(arr[0].simpleDescription, arr[1].simpleDescription)

/* Extension */
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 12
    }
}

print(7.simpleDescription)
var c: Int = 21
c.adjust()
print(c)
