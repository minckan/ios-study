import UIKit

// protocol
// 규칙, 규격, 규약, 청사진, 뼈대
// 구현부는 있으면 안됨!

protocol UserInfo {
    var name: String {get set}
    var age: Int {get set}
    
    func isAdult() -> Bool
    
}
extension UserInfo {
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

protocol UserScore {
    var score: Int { get set }
}

// 프로토콜 합성
protocol UserDetailInfo : UserInfo, UserScore{
    
}

class Guest:UserDetailInfo{
    var score: Int = 0
    var name: String = "kim"
    var age: Int = 0

}



class Member:UserInfo {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

class UserInfoPresenter {
    func present() {
        let guest = Guest()
        let member = Member(name: "minju", age: 35)
        
        let members: [UserInfo] = [guest, member]
        
        for m in members {
            print(m.name)
        }
        
    }
}

var userInfoPresenter = UserInfoPresenter()
userInfoPresenter.present()
