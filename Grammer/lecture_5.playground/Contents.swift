import UIKit

// Class

class MyInfo {
    // Initializer(생성자)
    // 생성한다 : 메모리에 올려서 존재하게 만든다.
    // designated init
    init(gender: GenderType) {
        self.genderType = gender
    }
    
    // convenience init // 필수 조건 - 다른 init을 반드시 실행해야한다.
    // 가독성을 높혀주고 중복코드를 없애준다.
    convenience init() {
        self.init()
    }
    enum GenderType {
        case male
        case female
    }
    
    private var genderType:GenderType
    // 👇🏻 Stored Property (저장된 속성)
    var name = ""
    var age = 0
    
    // lazy stored property
    // 클래스 인스턴스가 생성될때 프로퍼티들이 메모리에 할당되는데 lazy 키워드를 붙이게 되면 호출될때 메모리에 올라간다.
    // lazy를 사용하지 않을경우 이미지와 같은 용량이 큰 프로퍼티들이 있을때 부하가 올수도 있다.
    lazy var myProfiles = [UIImage(named: "a"), UIImage(named: "a"), UIImage(named: "a"), UIImage(named: "a"),UIImage(named: "a")]
    
    // computed property 계산된 프로퍼티. 값을 입력할 수 없음. Get Only!
    var isAdult:Bool{
        if age > 19 {
            return true
        }
        
        return false
    }
    
    // computed property  조건 : email -> 보안이슈 -> 암호화된 값으로 사용한다.(항상)
    var _email= ""
    var email: String {
        get {
            return _email
        }
        set {
            _email = newValue.hash.description
        }
    }
}

var myInfo = MyInfo(gender: .female)

myInfo.email = "minckan@mz.co.kr"
myInfo.email

// class는 참조타입 이다.
var myInfo2 = myInfo

// 상속

class BaseGameInfo {
    var homeScore = 0
    var awayScore = 0
    final func presentScore() -> String {
        return homeScore.description + " : " + awayScore.description
    }
}
class Soccer : BaseGameInfo {
    var time = 0

}

class Baseball : BaseGameInfo {
    var round = 0
}

let soccer = Soccer()
soccer.awayScore = 30
soccer.presentScore()
soccer.time = 10

let baseBall = Baseball()
baseBall.homeScore = 100
baseBall.presentScore()


//

