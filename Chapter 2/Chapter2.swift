/* 2. Control Flow */
/* if statement */
print("===== if statement =====")
let a = 10
if a == 10 {
    print("a is 10")
} else if a == 20 {
    print("a is 20")
} else {
    print("a is not 10")
}

/* condition은 반드시 Bool type */
// 다음 코드는 error
// "error: type 'Int' cannot be used as a boolean"
/*
let b = 0
if b {
    print("true")
}
*/

/* Optional Variable */
print("===== Optional Variable =====")
/*
var varName: Int
print(varName)
*/

var varName: Int? = 10
print(varName)
print(varName!)

/* if let */
print("===== if let =====")
// var optVal1: Int?
var optVal1: Int? = 10
if let a = optVal1 {
    print(a)
} else {
    print(optVal1)
}

/* switch */
print("===== switch =====")
// let device = "Galaxy"
let device = "iPhone"
switch device {
case "Galaxy":
    print("Samsung \(device)")
case "iPhone", "iPad":
    print("Apple \(device)")
default:
    print("Who are you")
}

/* for in */
print("===== for in =====")

var wonderland = ["Alice", "Bob", "Charlie"]
for w in wonderland {
    print(w)
}

var alphabets = [
    "A": "Alpha",
    "B": "Bravo",
    "C": "Charlie",
    "D": "Delta"
]
for (k, a) in alphabets {
    print(k, a)
}

for i in 0..<3 {
    print("\(i): \(wonderland[i])")
}

/* while */
print("===== while =====")
var variable1 = 10
while variable1 < 10 {
    variable1 += 5
}

var variable2 = 10
repeat {
    variable2 += 5
} while variable2 < 10
            
print(variable1, variable2)
