import UIKit

// 열거형을 사용하면 코드의 가독성과 안정성이 높아짐 ==> 명확한 분기처리 가능

enum School {
    case elementary
    case middle
    case high
    case university
}

var school : School = School.elementary

// 열거형은 타입이다!
// 열거형은 항상 스위치문으로 분기처리 가능 (if문보다 스위치문으로 활용 많이함)

enum Weekday {
    case monday
    case tueseday
    case wednesday
}

// 열거형의 원시값
enum Alignment: Int {
    case left // = 0 자동으로 숫자가 매개짐
    case center // = 1
    case right // = 2
}

// 원시값 입력안하면 0,1,2 이렇게 자동으로 저장됨 (정수의 경우 숫자가 하나씩 증가)
// 1(설정시), 2,3
// 0, 2(설정시), 3

enum Alignment1 : String {
    case left
    case center = "C"
    case right
}

var align = Alignment1(rawValue: "C")
align

let leftValue = Alignment1.center.rawValue

// 활용
enum RpsGame: Int {
    case rock
    case paper
    case scissors
}

var game = RpsGame(rawValue: 0)
RpsGame(rawValue: 1)
RpsGame(rawValue: 2)

// 논리적으로 nil이 될수 없다면
let number = Int.random(in: 0...100) % 3
print(RpsGame(rawValue: number)!)


// 열거형의 연관값: 구체적인 추가정보를 저장하기 위해 사용
enum Computer {
    case cpu(core: Int, ghz: Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
}

Computer.cpu(core: 4, ghz: 3.5)


// 각 케이스별로 상이한 특징이 있고, 그것을 저장 / 활용할 필요가 있을때

// 개별 케이스마다 저장할 형식을 따로 정의 (자료형에 제한이 없음 / 튜플의 형태)
// 하나의 케이스에 서로다른 연관값을 저장할 수 있음 ===> 선언시점이 아니라, 새로운 열거형 값을 생성 할 때 저장.

// 원시값과 연관값의 차이
/**
 1. 자료형 선언 방식 : 선언하는 위치가 다름
 2. 선언형식 : (1) 원시값 ===> 2가지중 1가지 선택 / (2)연관값 ===> 튜플의 형태로 형식 제한 없음
 3. 값의 저장 시점: (원시값:선언시점/연관값:새로운 열거형 값을 생성할 때)
 4. 서로 배타적: 하나의 열거형에서 원시값과 연관값을 함께 사용하는 것은 불가능함
 */


//연관값의 활용
var chip = Computer.hardDisk(gb: 256)



switch chip {
case .cpu(core: 8, ghz: 3.1):
    print("CPU 8코어 3.1GHz입니다.")
case .cpu(core: 8, ghz: 2.6):
    print("CPU 8코어 2.6GHz입니다.")
case .ram(32, _):
    print("32기가 램입니다")
default:
    print("그 이외의 칩에는 관심이 없습니다.")
}

// ⭐️ 연관값을 가진 케이스를 패턴 매칭시키기
switch chip {
case .cpu(let a, let b):
    print("CPU \(a)코어 \(b)GHz입니다.")
case let .ram(a, _):
    print("ram \(a)기가 램 입니다.")
case .hardDisk(let a):
    print("하드디스크 \(a)기가 용량입니다.")
}


if case Computer.hardDisk(gb: let GB) = chip, GB == 256 {
    print("hard disk \(GB)gb")
}

let chipLists: [Computer] = [
    .cpu(core: 4, ghz: 3.0),
    .cpu(core: 8, ghz: 3.5),
    .ram(16, "SDAM"),
    .ram(32, "DRAM"),
    .cpu(core: 8, ghz: 3.5),
    .hardDisk(gb: 500),
    .hardDisk(gb: 256)
]


for case let .cpu(core: c, ghz: h) in chipLists {
    print("CPU chip : \(c) core , \(h) herzh")
}

//for chip in chipLists {
//    print("\(chip)")
//}


enum SomeEnum {
    case left
    case right
}

let x : SomeEnum? = .left

switch x {
case .some(let value):
    switch value {
    case .left:
        print("left")
    case .right:
        print("right")
    }
case .none:
    print("go foward")
}

// 옵셔널 패턴
switch x {
case let z?:
    print(z)
case nil:
    print("nil")
}

switch x {
case .left:
    print("")
case .right:
    print("")
case nil:
    print("")
}


let arrays: [Int?] = [nil, 2,3,nil,5]

for case .some(let number) in arrays {
    print(number)
}

for case let number? in arrays {
    print(number)
}


// Unknown 키워드
// - 만약, 열거형의 케이스가 늘어난다면 항상 올바른 처리를 하고 있다고 말할 수 있을까?

enum LoginProvider: String {
    case email
    case facebook
    case google
    case kakaotalk
}

let userLogin = LoginProvider.google

switch userLogin {
case .email:
    print("email")
case .facebook:
    print("facebook")
case .google:
    print("google")
case .kakaotalk:
    print("kakao")
@unknown default:
    print("그위의 모든 경우")
}
