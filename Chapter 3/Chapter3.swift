/* 3. Functions and Closures */
/* Declare Basic Function */
func func1(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
let result1 = func1(num1: 10, num2: 20)
print(result1)

/* Function with custom argument name */
func func2(a num1: Int, b num2: Int) -> Int {
    return num1 * num2
}

let result2 = func2(a: 10, b: 20)
print(result2)

func func3(_ num1: Int, _ num2: Int) -> Int {
    return num1 - num2
}

let result3 = func3(20, 10)
print(result3)

/* Function returns compound values */
func func4(num1: Int, num2: Int) -> (Int, Int, Int, Double) {
    return (num1 + num2, num1 - num2, num1 * num2, Double(num1) / Double(num2))
}

let result4 = func4(num1: 20, num2: 10)
let (a, b, c, d) = func4(num1: 30, num2: 10)
print(result4)
print(a, b, c, d)

/* nested function */
func func5(_ num1: Int, _ num2: Int) -> Int {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    return add(a: num1, b: num2)
}

let result5 = func5(10, 20)
print(result5)

/* First-class function */
func makeAdd() -> ((Int, Int) -> Int) {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    return add
}

let result6 = makeAdd()
print(result6(10, 20))

func execute(callback: (Int, Int) -> Int) -> Int {
    return callback(10, 20)
}
print(execute(callback: result6))

/* Closure */
let func6 = { (a: Int, b: Int) -> Int in
    var result = 0
    for i in a...b {
        result += i
    }
    return result
}
let result7 = func6(1, 100)
print(result7)

let numbers = [10, 20, 30, 40, 50]
let result8 = numbers.map({(number: Int) -> Int in
    return number * 4
})
print(result8)

/* 생략 */
print(numbers.map({number in return number * 4}))
print(numbers.map({number in number * 4}))
print(numbers.map({$0 * 4}))
print(numbers.map {$0 * 4})

