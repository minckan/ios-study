import UIKit


// 값타입 (구조체, 열거형)에서는 기본적으로 인스턴스 메서드 내에서 속성을 수정할 수 없다.
// 수정하려면 mutating 키워드를 붙이면 속성 수정이 가능해진다. ---> 클래스와 구조체의 차이.


struct Dog2 {
    var name: String
    var weight: Double
    static var species: String = "Dog"
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)이 앉았습니다.")
    }
    
    mutating func changeName(newName name: String) {
        self.name = name
    }
    
    // 타입메서드 : 메서드 이지마느 인스턴스의 성격이 아닌 타입 자체의 성격에 가가운 메서드 일때
    static func letmeknow() {
        print("종은 항상 \(species)")
    }
}




// 타입 메서드를 상속시 재정의 가능하도록 하려면 ===> static 키워드를 상속 가능한 class로 바꿔야함. override

// 서브스크립트 []


// 내부적으로 대괄호를 사용하면 어떤 값을 리턴하도록 구현이 되어 있어서 가능한 일.

class SomeClass {
    var datas = ["Apple", "Swift", "iOS", "Hello"]
    
    subscript(index: Int) -> String {
        get {
            return datas[index]
        }
        set(parameterName) {
            datas[index] = parameterName
        }
    }
}

var data =  SomeClass()
data[0]

// 대괄호 형태로 사용하는 메서드이다.
struct TimeTable {
    let multiplier: Int = 3
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimeTable()
print("6에 3배를 하면 숫자 \(threeTimesTable[6])이 나옵니다")

struct Matrix {
    var data = [[1,2,3], [4,5,6], [7,8,9]]
    
    subscript(row: Int, column: Int) -> Int? {
        if row >= 3 || column >= 3 {
            return nil
        }
        return data[row][column]
    }
}

var mat = Matrix()
mat[0, 1]!


// 타입 서브스크립트
enum Planet : Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)


// 접근제어
// 접근제어가 필요한 이유
/**
 애플이 자신들이 원하는 코드를 감출수 있음
 코드의 영역을 분리시켜서, 효율적 관리가능
 컴파일 시간이 줄어듬 (컴파일러가 , 해당 변수가 어느 범위에서만 쓰이는지를 인지 가능)
 */


// 싱글톤패턴
// 메모리상에 유일하게 1개만 존재하는 객체 설계
// 앱구현시에 유일하게 한개만 존재하는 객체가 필요한 경우 (특정한 유일한 데이터/관리 객체가 필요한 경우)

// 한번 생성된 이후에는 앱이 종료될 때까지, 유일한 객체로 메모리에 상주
class Singleton {
    static let shared = Singleton() // 자신의 객체를 생성해서 전역변수에 할당.
    var userInfoId = 12345
    private init() {} // 새로운 객체를 생성하는 것을 막기위한 코드
}

// 실제 사용 예시
// 앱을 실행하는 동안, 하나의 유일한 객체만 생성되어서, 해당 부분을 관리
let screen = UIScreen.main
let userDefault = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default


// 클래스의 상속금지의 키워드 => final
// (경우의 따라서 클래스의 상속을 금지해야 하는 경우가 있음)

// final를 각 멤버 앞에 붙인 경우, 해당 멤버 재정의 불가능)
// 상위 클래스에서 존재하는 멤버를 변경하는 것을 재정의라고 한다.

// 재정의를 하려는 멤버에는 override 키워드를 붙여야 한다.

// ⭐️⭐️⭐️ 재정의 overriding
class Aclass {
    func doSomething() {
        print("Do Something")
    }
}

class Bclass:Aclass {
    override func doSomething() {
        super.doSomething()
        print("Do Something~~~~~~")
    }
}

let c = Bclass()

c.doSomething()


// 저장 속성의 재정의는 원칙적으로 불가 데이터 구조의 변형은 불가!
// 상속은 저장속성을 추가하는 것이다...! 저장속성~!!!
// 데이터 (저장속성) : 추가만 가능
// 메서드 : 추가 및 변형 (대체) 가능
// 실제로 메서드들은 배열로 저장되어 있다. -> 클래스를 상속받은 인스턴스를 새로 생성시 배열로 된 테이블을 새로 만들기 때문에 언제든지 재정의가 가능..
// 저장 속성 부분과 메서드 부분의 메모리 구조가 다르기 때문에 기능이 다르다.
// 저장속성은 메모리 구조에서 상위 구현을 참조하기 때문에 재정의(변형)이 불가.

class Vehicle {
    var currentSpeed = 0.0
    
    var datas = ["1","2","3","4","5"]
    
    func makeNoise() {
        print("경적을 울린다.")
    }
    
    subscript(index: Int) -> String {
        get {
            if index > 4 {
                return "0"
            }
            return datas[index]
        }
        set {
            datas[index] = newValue
        }
    }
}


let vehicle1 = Vehicle()

vehicle1[5]


class Vehicle2 : Vehicle {
    override func makeNoise() {
        print("경적을 울리고, 자전거가 지나간다고 소리친다.")
    }
    override subscript(index: Int) -> String {
        get {
            if index > 4 {
                return "777"
            }
            return super[index]
        }
        set {
            super[index] = newValue
        }
    }
}


let v = Vehicle2()
v[5]
