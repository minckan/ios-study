import UIKit

// Structure
// 구조체

// 클래스는 레퍼런스 타입. 해당 클래스를 참조하고 있는 모든 인스턴스들은 하나의 원본을 바라보고 있다.
// 스트럭쳐는 밸류타입. 값을 참조하는게 아닌 복제를 한다.
// 상속이 불가하다.

struct ImageType {
    var type = ""
    
}

var imageType = ImageType()
var imageType2 = imageType
var imageType3 = imageType2


imageType.type = "jpg"
imageType2.type = "png"

imageType.type
imageType2.type


//extension
//기능 확장
// struct, class, enum, protocol

extension Int {
    var oddOrEven: String {
        if self % 2 == 0 {
            return "짝수"
        }
        return "홀수"
    }
}

3.oddOrEven
4.oddOrEven

// UIColor

extension UIColor {
    static var mainColor1: UIColor {
        UIColor(red: 50/255, green: 70/255, blue: 50/255, alpha: 1)
    }
}

var button = UIButton()
button.titleLabel?.textColor = .mainColor1

