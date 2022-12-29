import UIKit

// modeling -> DTO

class Book {
    var name : String
    var price: Int
    var publisher: String
    var author: String
    var pages : Int
    
    init(n: String, p: Int, ps: String, a: String, pg: Int) {
        self.name = n
        self.price = p
        self.publisher = ps
        self.author = a
        self.pages = pg
    }
}


// 구조체 :  메모리에 오랫동안 저장하지 않음, 상속없이 조금 가볍게 사용
// 연관된 데이터들을 단순히 캡슐화 하는 것이 목적일때 구조체 사용
// 캡슐화한 데이터를 참조하는 것보다 복사해서 사용하는 것이 효율적일때 구조체사용

// 클래스 : 메모리에 오랫동안 저장(관리)
// 데이터에서 상속의 구조가 필요하면 클래스 사용
// 해당 모델을 serialize해서 전송하거나 파일로 저장할 경우가 발생하면 클래스 사용

// 필연적으로 클래스는 구조체보다 여러가지 면에서 속도가 느릴수 밖에 없으므로 차이점을 명확하게 인지하고, 굳이 필요한 경우에만 클래스 사용

// 캡슐화, 상속성, 추상화, 다형성 (캡상추다!)
// 추상화: 실생활에서 구체적인 것들을 관찰자가 관심있는 부분만 가지고 재조합하는 것.
//       실체들에서 관심있고, 공통적인 특성을 뽑아내서 하나의 분료로 만든것 (모델링)
//       객체지향의 관점에서 , 실체들의 공통적 특성을 뽑아내서 클래스로 정의하는 것 자체가 추상화의 개념
// 다형성: 하나의 객체가 여러가지 타입의 형태로 저장이 될 수 있고, 다양한 메서드의 형태로 동작 가능함을 의미
//       하나의 객체는 다양한 방식으로 동작가능(동적바인딩/ method dispatch)



// 지연저장속성
// - 저장 속성은 저장 속성인데, 지연의 의미가 뭘까?
// 지연 저장 속성은 해당속성의 초기화를 지연시키는 것이다
// 즉 인스턴스가 초기화 되는 시점에는 해당 속성이 값을 갖고 초기화 되는 것이 아니라(메모리에 공간과 값을 갖는것이 아니라)
// 해당 속성에 접근하는 순간에 해당 저장 속성만 개별적으로 초기화

// 따라서 상수로서 선언은 안되고 변수로의 선언만 가능!
// lazy var 만 가능! lazy let 불가!
struct Bird {
    var name: String
    lazy var weight: Double = 0.2
    
    init(name: String) {
        self.name = name
    }
    
    func fly() {
        
    }
}


// 계산속성
class Person {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        get {
            let bmi = weight / (height * height) * 10000
            return bmi
        }
        set {
            weight = newValue * height * height / 10000
        }
    }
}

let mj = Person()

mj.height = 180
mj.weight = 65

mj.bmi


/**
 - 메서드가 아닌, 속성 방식으로 구현하면 무슨 장점이 있을까?
 
 - 관련이 있는 두가지 메서드(함수)를 한번에 구현할 수 있다.
 - 그리고 외부에서 보기에 속성이름으로 설정 가능하므로 보다 명확해 보인다.
 - 따라서, 계산 속성은 메서드를 개발자들이 보다 읽기 쉽고, 명확하게 쓸 수 있는 형태인 속성으로 변환해 놓은 것이다.
 
 - 실제로, 계산 속성은 겉모습은 속성 형태를 가진 메서드 이다.
 - 계산 속성은 실제 메모리 공간을 가지지 않고, 해당 속성에 접근했을때 다른 속성에 접근해서 계산한 후 그 계산 결과를 리턴하거나 세팅하는 메서드이다.
 
 - 주의점 *
 - 1) 항상 변하는 값이므로, var로 선언해야 한다.
 - 2) 자료형 선언을 해야한다 (형식추론 형태 안됨) (메서드이기 때문에 파라미터, 리턴형이 필요한 개념)
 - 3) get은 반드시 선언해야한다. 값을 얻는 것은 필수 , 값을 set하는 것은 선택.
 */



class Circle {
    // 저장 타입속성
    static let pi: Double = 3.14
    static var count : Int = 0 // 인스턴스를 전체적으로 몇개를 찍어냈는지 확인
    
    // 계산 타입속성 ( read only)
    static var multiPi : Double {
        return pi * 2
    }
    
    // 저장속성
    var radius : Double
    // 계산속성
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
    
    // 생성자
    init(radius: Double) {
        self.radius = radius
        Circle.count += 1
    }
    
}


Circle(radius: 3).diameter
Circle.count

Circle(radius: 8)
Circle.count


Double.pi
Int.max


Circle.multiPi

// 속성 감시자 (property observer) -> willSet, didSet
class Profile {
    //
    var name: String = "이름"
    
    // 저장속성 + 저장 속성이 변하는 시점을 관찰하는 메서드
    var statusMessage: String  {
        willSet {
            print("메세지가 \(statusMessage)에서 \(newValue)로 변경될 예정입니다")
            print("상태메세지 업데이트 준비")
        }
        didSet {
            print("메세지가 \(oldValue)에서 \(statusMessage)로 이미 변경되었습니다")
            print("상태메세지 업데이트 완료")
        }
    }
    
    var newName: String {
        get {
            return "안녕"
        }
        set {
            print("값이 \(newValue)로 변경될 예정입니다.")
            name = newValue
        }
    }
    
    init(message: String) {
        self.statusMessage = message
    }
}

let profile = Profile(message: "기본 상태")

profile.statusMessage
profile.statusMessage = "GOOD!"
profile.newName = "민주!!!"


// 속성 감시자 메커니즘을 생각해보면...
var X = 0

func willSetting(newValue: Int) {
    print(newValue)
}
func didSetting(oldValue:Int) {
    print(oldValue)
}

func setX(newX: Int) {
    willSetting(newValue: newX)
    X = newX
    didSetting(oldValue: newX)
}


