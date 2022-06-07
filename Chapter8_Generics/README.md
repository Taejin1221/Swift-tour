# Generics

## Generic

- 함수의 내용이 똑같지만 parameter의 type이 다른 경우 여러 함수를 만들어야 함 => 코드의 중복 발생
- Generic function: 함수의 parameter type을 명시하지 않음으로써 다양한 type에 대해 열린 함수
- Generic function 선언
  - 함수 이름 뒤에 `<>`으로 placeholder 이름 명시 => type parameter
  - Function parameter에 type 지정하는 부분에 _type parameter_ 명시
  - 함수 body에는 `type parameter`라는 type으로 type을 대체
  ```swift
  func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
  }
  ```
  - Type parameter는 `,`로 여러개 선언 가능
  - Array의 원소는 `Element`, Dictionary는 `Key, Value`, 이 외에는 `T, U, V`로 명명할 것
- Generic function 호출

  - 기존 함수와 동일한 방법으로 generic function 호출
  - Type parameter의 type은 generic function이 호출 될 때 추론됨

  ```swift
  var intA = 10, intB = 20
  swapTwoValues(&intA, &intB)
  print(intA, intB)

  var doubleA = 3.14, doubleB = 1.7182
  swapTwoValues(&doubleA, &doubleB)
  print(doubleA, doubleB)

  var stringA = "Taejin", stringB = "Swift"
  swapTwoValues(&stringA, &stringB)
  print(stringA, stringB)
  ```

## Generic type

- Generic은 class, structure, enumration에도 사용가능

  - 선언: 각각의 이름 뒤에 `<>`로 type parameter 명시
  - Instance 생성: class 이름 뒤에 `<>`로 사용할 type 명시

  ```swift
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
  ```

- 기존 generic type을 extension 할 때는 type parameter를 지정해주지 않아도 됨, 바로 type parameter를 사용 가능

  ```swift
  extension Stack {
    func top() -> Element? {
      return items.isEmpty ? nil : items[items.count - 1]
    }
  }

  if let topItem = stackString.top() {
    print(topItem)
  }
  ```

## Type constraints

- Type parameter에 제약을 두는 것이 가능
  - e.g., "T는 이 class를 상속 받고 있어야 한다", "U는 이 protocol을 적용해야 한다" 등
- Type parameter 이름 옆에 `:`으로 구분한 뒤 제한 둘 class, protocol을 명시
  - `func funcName<T: className, U: protocolName>(someT: T, someU: U)`
- 예시

  - `in` 배열에 `of` 원소의 index를 반환하는 함수
    - 3번째 줄에 type이 `T`인 변수를 비교하는 코드가 존재
    - 따라서 T가 `==`, `!=` operator가 존재해야하므로 T가 `Equatable` protocol을 적용해야 한다고 명시

  ```swift
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

  ```
