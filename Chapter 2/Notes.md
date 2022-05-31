# Chapter 2. Control Flow

## if statement

- 조건문의 condition은 반드시 Bool type이어야 함
  - Bool type이 아닐 시 다음 에러 발생
    `error: type 'Int' cannot be used as a boolean`
  - condition을 감싸는 괄호는 선택 사항

### if let

- Optional 변수의 값이 nil이 아닐 때 unwrapped과 동시에 코드 실행
  - `if let varName = optVal` 만약 optVal이 nil이라면 else로, nil이 아니라면 unwrap과 동시에 varName으로 값을 할당
  ```swift
  var optVal1: Int?
  if let a = optVal1 {
    print(a)
  } else {
    print(optVal1)
  }
  ```

## switch

- case 조건으로 어떤 타입 지정도 가능
  - ,로 여러 조건 한줄에 입력 가능
    - `case a, b:`
- case 실행 뒤 자동으로 break 되므로 명시해주지 않아도 됨
- `default` 안해주면 다음 에러 발생
  - `error: switch must be exhaustive`

## for in

- in 뒤에 배열, 딕셔너리가 들어올 때 원소들을 차례로 탐색
- 딕셔너리
  - (key, value)의 형태로 값 전달, 이때 순서는 임의적 즉, 실행할 때마다 순서가 변경됨
- range
  - `a..<b`: $[a, b)$
  - `a...b`: $[a, b]$

## while

- `while condition {...}`: condition이 참일 때 반복
- `repeat {...} while condition`: 일단 실행한 뒤 condition이 참이면 계속 반복
