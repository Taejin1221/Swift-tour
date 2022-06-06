# Error Handling

## Error protocol

- Error를 `Error` protocol로 정의 가능
- `throws` 키워드를 통해 함수가 error thorw가 가능하다는 것을 표시
- error throw

  - `throw` 키워드를 통해 Error thorw
  - error가 throw되면 함수는 즉시 종료
  - 이후 함수를 호출한 코드가 error handling

  ```swift
  enum PrintError: Error {
    case outOfPaper
    case noToner
    case onFire
  }

  func send(job: Int, toPrinter printerName: String) throws -> String {
    switch printerName {
    case "No Toner":
      throw PrintError.noToner
    case "Out of Paper":
      throw PrintError.outOfPaper
    case "On Fire":
      throw PrintError.onFire
    default:
      return "Job Sent"
    }
  }
  ```

## Error handling

- 방법 1

  - error throw 하는 함수 호출 할 때 `try` 사용하여 error가 throw 될 수 있다는 것을 명시
  - `do { } catch { }` 문법으로 error throw 됐을 시 catch

    ```swift
    do {
      statement1
    } catch pattern1 {
      statement2
    } catch pattern1, pattern2 {
      statement3
    } catch {
      statemnet4
    }
    ```

  - error 이름 명시하지 않으면 `error` 라는 변수명으로 error 사용

  ```swift
  do {
    // let printerResponse = try send(job: 1221, toPrinter: "No Toner")
    // let printerResponse = try send(job: 1221, toPrinter: "Out of Paper")
    // let printerResponse = try send(job: 1221, toPrinter: "On Fire")
    let printerResponse = try send(job: 1221, toPrinter: "Print!")

    print(printerResponse)
  } catch PrintError.noToner {
    print("No Toner error")
  } catch PrintError.outOfPaper {
    print("Out of Paper error")
  } catch PrintError.onFire {
    print("It's fire!")
  } catch {
    print(error)
  }
  ```

- 방법 2
  - `try?` 문법으로 error throw시 optional로 반환 가능
    - error throw 시: error는 무시 되고 값이 nil로 전달
    - error thorw 아닐시: 원래 결과 Optional으로 전달
  ```swift
  let printerSuccess = try? send(job: 1222, toPrinter: "Print!")
  let printerFailure = try? send(job: 1223, toPrinter: "No Toner")
  print(printerSuccess) // Optional("Job Sent")
  print(printerFailure) // nil
  ```

## Defer code block

- `defer` 키워드 사용하여 함수가 return 되기 전에 실행되는 code block 정의 가능

  - 아래 코드에서 실행 순서는 statement1 -> statement3 -> statement2

    ```swift
    func funcName() -> returnType {
      statement1
      defer {
        statement2
      }
      statement3

      return
    }
    ```

  - defer code block은 error가 throw 되어도 throw 전에 꼭 실행 됨

    - error throw 전에 꼭 실행되어야 하는 코드를 적어두어 안정성을 향상 시킴

    ```swift
    enum FridgeError: Error {
      case doorBonded
      case noContent
    }

    var fridgeIsOpen = false
    // let fridgeContent = ["milk", "eggs", "leftovers"]
    let fridgeContent: [String] = []

    func fridgeContains(_ food: String, smell: String = "taste") throws -> Bool {
      print("Function body starts")
      if smell == "bond" {
        throw FridgeError.doorBonded
      }

      fridgeIsOpen = true
      defer {
        print("Defer code block")
        fridgeIsOpen = false
      }

      if fridgeContent.isEmpty {
        throw FridgeError.noContent
      }

      let result = fridgeContent.contains(food)
      print("Function body ends")
      return result
    }

    /* Result:
     Function body starts
     Defer Code block
     noContent
     false
     */
    do {
      // let fridgeResult = try fridgeContains("banana")
      let fridgeResult = try fridgeContains("banana")
      // let fridgeResult = try fridgeContains("milk", smell: "bond")

      print(fridgeResult)
    } catch {
      print(error)
    }
    print(fridgeIsOpen)

    ```

    - 단, defer code block이 실행 된 뒤에 유효함 (defer code block이 실행되지 않고 return, throw 되면 나중에 실행되지 않음)
