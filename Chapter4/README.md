# Objects and Classes

## 기본 문법

- class 선언은 class 키워드 이용
  - `class className { ... }`
- property, method는 변수, 함수 선언 방법과 동일

  ```swift
  class Animal {
    let numberOfLegs: Int
    let name: String

    func introduce() -> String {
      return "My name is \(name) and I have \(numberOfLegs) legs"
    }
    ...
  }
  ```

- 생성자

  - class 내부에 init() 함수 생성 (func 키워드 사용 X)
  - self로 자기 자신에 접근
  - property는 선언과 동시 할당 or 생성자 내부에서 할당의 방법으로 꼭 값을 할당해 주어야 함

    ```swift
    class Animal {
      ...
      init(leg: Int, name: String) {
        numberOfLegs = leg
        self.name = name
      }
      ...
    }
    ```

- Instance

  - `className(arg1: value, arg1: value)`로 instance 생성
  - instance의 property, method는 `.`로 접근

    ```swift
    var animal1 = Animal(leg: 4, name: "Alpha")
    print(animal1.introduce())
    animal1 = Animal(leg: 2, name: "Beta")
    print(animal1.introduce())
    ```

- 소멸자

  - deinit으로 소멸자 생성 (매개변수 X)

    ```swift
    class Animal {
    ...

    deinit {
        print("\(name) die")
    }
    }
    ```

## Inheritance

- superclass는 subclass의 : 옆에 선언

  - `class subClass: superClass { ... }`

  ```swift
  class Human: Animal {
    let job: String
    ...
  }
  ```

- superclass 접근은 super

  - 생성자에서 반드시 superclass의 생성자를 호출해야 함

  ```swift
  class Human: Animal {
    ...
    init(name: String, job: String) {
      self.job = job
      super.init(leg: 2, name: name)
    }

    func introduceAnimal() -> String {
      return super.introduce()
    }
    ...
  }
  ```

- override 키워드를 이용하여 overriding
  ```swift
  class Human: Animal {
    ...
    override func introduce() -> String {
      return "My name is \(name) and my job is \(job)"
    }
    ...
  }
  ```

## Getter, Setter

- `var name: type { get { return ... } set { ... }`

  - name에 접근할 때 get 실행
  - name이 변경되면 set 실행, 변경 된 값은 newValue로 접근

  ```swift
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
  ```

- `willSet, didSet`

## Optional instance variable

- Optional value의 속성, method에 접근하고자 할 때 ?를 . 앞에 두어 nil일 때, 아닐 때 각각 할당 가능

  - nil일 때: 모든 문장이 nil로 변경
  - nil이 아닐 때: unwrapped된 상태로 뒤에 수식 실행
  - `let const1 = optionalInst?.prop`

  ```swift
  var human2: Human?
  print(human2?.name) // nil
  human2 = Human(name: "Delta", job: "Army")
  print(human2?.name) // Optional("Delta")

  ```
