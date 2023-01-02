import UIKit

class A {
    var x: Int
    required init(x: Int) {
        self.x = x
    }
}


class BView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// 실패가능 생성자
// 인스턴스 생성에 실패할 수도 있는 가능성을 가진 생성자.

struct Animal {
    let species: String
    
    init?(species: String) {
        if species.isEmpty {
            return nil  // 생성자 내에서 실패가능 부분에 nil을 리턴하면 된다. (문법적 약속)
        }
        self.species = species
    }
}

let a = Animal(species: "Tiger") // 인스턴스가 생성됨

let b = Animal(species: "") // nil


//
enum TemperatureUnit {
    case kelvin
    case celsius
    case fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = TemperatureUnit.kelvin
        case "C":
            self = TemperatureUnit.celsius
        case "F":
            self = TemperatureUnit.fahrenheit
        default:
            return nil
        }
    }
}

let c: TemperatureUnit = TemperatureUnit.celsius
let f: TemperatureUnit? = TemperatureUnit(symbol: "F")

enum TemperatureUnit1:Character {
    case kelvin = "K"
    case celsius = "C"
    case fahrenheit = "F"
}

let f1: TemperatureUnit1? = TemperatureUnit1(rawValue: "K")

class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty {return nil}
        self.name = name
    }
}

class AutomaticallyNamedDocument : Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) { // 재정의 (상위) 실패가능 =====> (하위) 실패불가능
        super.init() // 실패불가능 활용가능
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument : Document {
    override init() {
        super.init(name: "[Untitled]")! // 강제 언래필(!)으로 구현
    }
}

class Aclass {
    var x = 0
    var y = 0
    
    deinit {
        print("인스턴스의 소멸 시점")
    }
}

class Bclass : Aclass {
    var z = 0
    deinit {
        print("B 인스턴스의 소멸됨")
    }
}

var bb: Bclass? = Bclass()
bb = nil
//소멸자: 실제로 객체가 사라지는 지 확인할때 사용함.

// 인스턴스가 메모리에서 제거되기 직전에 자동으로 호출된다!
