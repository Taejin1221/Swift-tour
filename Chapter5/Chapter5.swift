/* 5. Enumerations and Structures */
/* Enumeration with rawValue */
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
print(ace, ace.simpleDescription(), aceRawValue)

let rank = Rank(rawValue: 3)
// let rank = Rank(rawValue: 17)
if let convertedRank = rank {
    print(convertedRank.simpleDescription())
}

/* Enumeration without rawValue*/
enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }

    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

let hearts = Suit.hearts
print(hearts, hearts.simpleDescription(), hearts.color())

/* Enumeration with various rawValues*/
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("06:00am", "08:09pm")
let failure = ServerResponse.failure("Out of cheese.")
switch failure {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure: \(message)")
}

/* Structure */
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
