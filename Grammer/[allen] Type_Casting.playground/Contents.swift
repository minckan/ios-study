import UIKit


//class Person {
//    var id = 0
//    var name = "이름"
//    var email = "111@email.com"
//}
//
//class Undergraduate: Person {
//    var major = "전공"
//}
//
//let person : Person = Undergraduate()
//
//if let ppp = person as? Undergraduate {
//    ppp.major
//    ppp.name
//}
//
//let ppp2 = person as! Undergraduate
//
//
//let undergraduate: Undergraduate = Undergraduate()
//
//
//// up casting
//let ppp3 = undergraduate as Person
//


// Polymorphism
// 다형성
// 하나의 객체가 여러가지 타입의 형태로 표현될 수 있음을 의미.
// 또는 하나의 타입으로 여러종류의 객체를 여러가지 형태로 해석될 수 있는 성격

// - 다형성이 구현되는 것은 클래스의 상속과 깊은 연관이 있음 ( 향후 배울 프로토콜과도 연관 )

class Person {
    var id = 0
    var name = "이름"
    var email = "abc@gmail.com"
    
    func walk() {
        print("사람이 걷는다")
    }
}

class Student: Person {
    var studentId = 1
    
    override func walk() {
        print("학생이 걷는다")
    }
    func study() {
        print("학생이 공부한다")
    }
}

class Undergraduate: Student {
    var major = "전공"
    
    override func walk() {
        print("대학생이 걷는다")
    }
    override func study() {
        print("대학생이 공부한다")
    }
    func party() {
        print("대학생이 파티를 한다")
    }
}


let person1 = Person()
person1.walk()

let student1: Person = Student()
student1.walk()
//student1.study()

let undergraduate1 : Person = Undergraduate()
undergraduate1.walk()
//undergraduate1.study()
//undergraduate1.party()


let people : [Person] = [Person(), Student(), Undergraduate()]


for person in people {
    person.walk()
}


var some:Any = "Swift"
// 단점 : 저장된 타입의 메모리 구조를 알수 없기 때문에 항상 타입캐스팅 해서 사용해야한다!⭐️
(some as! String).count
some = 10
print(some)

(some as! Int).hashValue

// 어떤 상황에서 사용할까..?
let array:[Any] = [5, "hi!", 3.6, Person(), {(name: String) in return name}] as [Any]
(array[1] as! String).count
 
// AnyObject: 클래스의 인스턴스만 담을수 있는 타입
let objectArray: [AnyObject] = [Person(), NSString(), Undergraduate()]
(objectArray[0] as! Person).name


for (index, item) in array.enumerated() {
    switch item {
    case is Int:
        print("Index - \(index): 정수입니다.")
    case let num as Double:
        print("Index - \(index): 소수 \(num)입니다.")
    case is String:
        print("Index - \(index): 문자열 입니다.")
    case let person as Person:
        print("Index - \(index): 사람입니다")
        print("이름은 \(person.name)입니다.")
    default:
        print("Index - \(index): 그 외의 타입입니다.")
    }
}




let optionalNumber : Int? = 3
print(optionalNumber)
print(optionalNumber as Any)

