/* 8. Generics */
/* Generic */
func swapTwoInt(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var a = 10, b = 20
swapTwoInt(&a, &b)
print(a, b)

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var intA = 10, intB = 20
swapTwoValues(&intA, &intB)
print(intA, intB)

var doubleA = 3.14, doubleB = 1.7182
swapTwoValues(&doubleA, &doubleB)
print(doubleA, doubleB)

var stringA = "Taejin", stringB = "Swift"
swapTwoValues(&stringA, &stringB)
print(stringA, stringB)

/* Generic type */
struct Stack<Element> {
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackInt: Stack<Int> = Stack<Int>()
stackInt.push(10)
stackInt.push(20)
stackInt.push(30)
print(stackInt.pop())

var stackString = Stack<String>()
stackString.push("Alpha")
stackString.push("Bravo")
stackString.push("Charlie")
print(stackString.pop())

extension Stack {
    func top() -> Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackString.top() {
    print(topItem)
}

/* Type Constraints */
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (idx, val) in array.enumerated() {
        if (val == valueToFind) {
            return idx
        }
    }
    
    return nil
}

let array = ["apple", "banana", "cocoa", "daisy"]
if let idx = findIndex(of: "banana", in: array) {
    print(idx)
}
