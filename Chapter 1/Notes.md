# Chapter 1: Variable

## 선언

- 상수는 `let`, 변수는 `var` 키워드로 선언

  - 다른 언어와 다르게 상수를 값 할당 없이 선언 가능, 하지만 다른 언어와 같게 한번 할당하면 변경 불가

- type 명시

  - 기본적으로 type을 명시해주어야하지만 값을 할당하면서 선언시 명시할 필요 없음 => type 추론(inference)
    - `var variable: type`
    - `let variable: type`
  - 변수의 type이 한번 정해지면 다른 type의 값 할당 불가
  - 명시적으로 type 추론을 못하는 경우에 type을 선언해주지 않으면 `error: type annotation missing in pattern` 발생
  - type의 종류
    - **Character**: 16-bit Unicode character
    - **String**
    - **Int**: 64-bit integer (예측: $10^{18}$까지 확인)
    - **Float**: 32-bit floating point
    - **Double**: 64-bit floating point
    - **Bool**

- 배열은 `var array = [val1, val2,]`, 딕셔너리는 `var dict = [ key1 : val1, key2 : val2 ]`

  - 빈 배열과 딕셔너리를 만들 때 type 추론이 불가능하기 때문에 반드시 명시해주어야 함
    - 에러 메시지: `error: empty collection literal requires an explicit type`
    - `var arr: [type] = []`
    - `var dict: [type: type] = [:]`

## Question?

- 딕셔너리의 값을 접근했을 때 다음 warning이 발생하는 이유
  - `Expression implicitly coerced from 'Int?' to 'Any'`
