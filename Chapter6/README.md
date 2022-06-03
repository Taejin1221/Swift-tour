# Protocols and Extensions

## Protocol

- class, structure, enumeration 등을 통일성 있게 만들기 위한 청사진 (Java의 추상 클래스와 비슷한 개념)
- 선언
  - `protocol` 키워드 이용하여 프로토콜 선언
  - class와 동일하게 내부 property, method 선언
  - method의 body는 작성하지 않음 (`{}`도 쓰지 않음)
  - mutating method로 사용하려면 `mutating` 키워드 사용
    - class에서는 명시하지 않아도 됨
- 적용
  - 적용하려는 class(structure, enumeration도 포함)에 상속과 동일하게 `:`으로 구분 한 뒤 사용하려는 protocol 적어줌
  - protocol을 적용하려는 class는 반드시 protocol에서 정의한 내용을 정의해야 함
    - 정의하지 않으면 `error: type 'classname' does not conform to protocol 'protocolName'` 발생

```swift
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
```

- 같은 protocol로 만들어진 객체들을 담는 collection을 만들 때에 protocol을 type 이름처럼 사용가능
  - 이 때 한 변수가 여러 protocol을 담고 있더라도 collection의 type으로 선언한 protocol 내의 method, property만 사용 가능
  ```swift
  var arr: [ExampleProtocol] = [a, b]
  print(arr[0].simpleDescription, arr[1].simpleDescription)
  ```

## Extension

- 기존에 존재하던 type에 새로운 property, method를 추가하는 방법
- `extension` 키워드를 사용하여 class와 동일한 방법으로 선언
  - class와 동일하게 protocol 적용 가능
  - 사용법 또한 기존 type을 클래스처럼하여 새로 만든 property, method에 접근 가능

```swift
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

```
