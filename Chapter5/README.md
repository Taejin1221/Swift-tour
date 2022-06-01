# Enumerations and Structures

## Enumerations

- 기본 문법

  - `enum` 키워드 이용해서 enumeration 선언
    - 열거형 옆에 `:`으로 type 명시, 값이 필요 없으면 명시하지 않아도 됨
    - property, method 접근, 선언 등은 class와 동일
      - enum이 명확하지 않은 곳에선 `enumName.property`로 명시해줘야하지만 enum이 명확한 곳에선 `.property`로 줄여서 사용 가능
    - 단, property 선언은 `let`, `var`가 아닌 `case`로
  - default로 0부터 시작, 명시해줌으로써 시작 값 변경 가능
  - `rawValue`로 property의 raw value에 접근 가능
    - 만약 type을 명시하지 않았다면 접근 불가능

  ```swift
  enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
      switch self {
      case .ace:
        return "ace"
      case .jack:
        return "jack"
      case .queen:
        return "queen"
      case .king:
        return "king"
      default:
        return String(self.rawValue)
      }
    }
  }

  let ace = Rank.ace
  let aceRawValue = ace.rawValue
  print(ace, ace.simpleDescription(), aceRawValue) // ace ace 1
  ```

- `init?(rawValue:)`로 특정 raw value를 가지는 열거형 변수 생성 가능

  - 만약 raw value가 존재하지 않으면 nil (=> Optional variable로 생성)

  ```swift
  let rank = Rank(rawValue: 3)
  // let rank = Rank(rawValue: 17) => nil
  if let convertedRank = rank {
      print(convertedRank.simpleDescription())
  }
  ```

- rawValue 선언

  - 선언과 동시에 할당하는 방법: 모든 instance의 같은 property는 동일한 값을 가짐
  - 선언만 하고 값은 나중에 할당: 모든 instance의 같은 property는 다른 값을 가짐

  ```swift
  enum ServerResponse {
    case result(String, String)
    case failure(String)
  }

  let success = ServerResponse.result("06:00am", "08:09pm")
  let failure = ServerResponse.failure("Out of cheese.")
  switch success {
  case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
  case let .failure(message):
    print("Failure: \(message)")
  }
  ```

## Structures

- `struct` 키워드로 선언
- class와 모든 것이 동일, 다른 점은 class는 reference를 전달하지만, structure는 복사본을 전달

  ```swift
  struct AnimalStruct {
    var leg: Int
    init(leg: Int) {
      self.leg = leg
    }
  }

  class AnimalClass {
    var leg: Int
    init(leg: Int) {
      self.leg = leg
    }
  }

  var aniStruct1 = AnimalStruct(leg: 4)
  var aniStruct2 = aniStruct1
  aniStruct2.leg = 2
  print(aniStruct1.leg, aniStruct2.leg) // 4 2

  var aniClass1 = AnimalClass(leg: 4)
  var aniClass2 = aniClass1
  aniClass2.leg = 2
  print(aniClass1.leg, aniClass2.leg) // 2 2
  ```
