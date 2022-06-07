/* 1. Variable */
/** Variable and Constants **/
let constant1 = 10;
var variable1 = 20;

print(constant1, variable1);

// 상수는 나중에 할당 가능
let const2: Int;
const2 = 30;
print(const2)

// type inference
var variable2 = 30;
// 같은 type으로 얼마든지 변경 가능
variable2 = 40;
print(variable2)

// 다른 type으로 변경 불가
/*
 variable2 = 3.14
 print(variable2)
*/

// 명시적으로 type 추론을 못하는 경우에 type을 선언해주지 않으면
// "error: type annotation missing in pattern" 발생
/*
 var variable3;
 variable3 = 30;
 print(variable3)
*/

let apples = 1, oranges = 2;
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)


/** Array and DIctionary **/
var array = [1, 2, 3, 4, 5]
print(array[1])

var dict = [
    "key1": 1,
    "key2": 2,
    "key3": 3,
]
// warning 발생: Expression implicitly coerced from 'Int?' to 'Any'
print(dict["key1"]) // Optional(1)
dict["key1"] = 4;
print(dict["key1"]) // Optional(4)

// 빈 배열과 딕셔너리를 만들 때 type 추론이 불가능하기 때문에 반드시 명시해주어야 함
// error: empty collection literal requires an explicit type
/* var arr2 = [] => error */
var arr2: [Int] = []
var dict2: [String: Int] = [:]

arr2.append(1)
print(arr2)

// type이 explicit(명시) 되었기 때문에 빈 배열 할당 가능 (딕셔너리도 동일)
arr2 = []
print(arr2)
