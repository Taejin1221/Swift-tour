/* 7. Error Handling */
/* Define error enumeration*/
enum PrintError: Error {
    case outOfPaper
    case noToner
    case onFire
}


/* Define throwing function */
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


/* Error handling 1: do catch statement */
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
//    let printerResponse = try send(job: 1040, toPrinter: "No Toner")
    print(printerResponse)
    print(type(of: printerResponse))
} catch {
    print(error)
    print(type(of: error))
}

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


/* Error handling 2: try? statement */
let printerSuccess = try? send(job: 1222, toPrinter: "Print!")
let printerFailure = try? send(job: 1223, toPrinter: "No Toner")
print(printerSuccess) // Optional("Job Sent")
print(printerFailure) // nil

if let printerResponse2 = try? send(job: 1224, toPrinter: "No Toner") {
    print(printerResponse2)
} else {
    print("Error occured")
}


/* defer */
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
