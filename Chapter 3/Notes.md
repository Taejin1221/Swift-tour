# Functions and Closures

## Function

- 기본 함수 형태
  - func 키워드 이용하여 함수 선언
  - 매개변수는 변수 선언과 동일하게, 반환 값은 `->` 뒤에 타입만 명시
    - `func funcName(param1: type, param2: type, ...) -> type { ... }`
  - 호출
    - 반드시 매개변수 이름: 값의 형태로 호출
    - 매개변수의 순서도 변경되면 안됨
      - `funcName(param1: value, param2: value)`
- 사용자 지정 인자로 선언
  - 매개변수 앞에 사용하려는 인자 이름 선언
    - `func funcName(arg1 param1: type, arg2 param2: type, ...) -> type { ... }`
  - 호출
    - 매개변수 이름 대신 인자 이름을 사용
      - `funcName(arg1: value, arg2: value)`
  - 인자 이름을 `_`로 선언시 호출 때 인자 이름 명시해주지 않아도 됨
    - `func funcName(_ param1: type, _ param2: type, ...) -> type { ... }`
    - `funcName(value1, value2)`
- compound value 반환
  - 반환 타입을 `()`로 묶어주어 사용
    - `func funcName() -> (type, type, type, ...)`s
- Nested function
  - 함수 안에 또 다른 함수를 선언
  - outer function의 변수에 접근 가능

### First-class function

- 함수는 first-class이기 때문에 함수 자체를 return하거나 다른 함수의 인자로 전달 가능
- 함수 return
  - 함수의 프로토타입을 괄호로 묶어서 리턴 타입에 넣어줌
    - `func funcName() -> ((paramType, paramType) -> returnType) { ... }`
  - return으로 받은 함수 호출 때 매개변수의 이름은 명시해주지 않음
    - `let returnFunc = funcName(); returnFunc(value, value)`
- 인자로 함수 전달
  - `func funcName(param1: (paramType, paramType) -> returnType) -> type { ... }`

## Closure

- 나중에 호출 가능한 코드 블럭을 의미함
- 함수는 closure의 한 형태
- `{}`로 선언부와 코드를 하나로 묶음, 선언부와 코드 사이에 in을 넣어 코드가 시작 되었음을 알려줌
  - `{(param1: type, param2: type) -> type in ...}`
  - `numbers.map({(number: Int) -> Int in return number * 4})`

### 생략

1. delegate의 callback처럼 closure의 type이 알려진 경우 type 생략 가능
   - `numbers.map({number in return number * 4})`
2. closure의 내부 문장이 한 문장이라면 return 없이도 그 문장 return
   - `numbers.map({number in number * 4})`
3. parameter를 `$`와 함께 인덱스로 접근 가능
   - `numbers.map({$0 * 4})`
4. closure가 유일한 인자일 때 호출하는 함수의 괄호를 생략 가능
   - `numbers.map {$0 * 4}`
