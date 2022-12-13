import UIKit

// deinitialization
// 메모리 해제

var a: Int? = 10
a = nil // 메모리 해제

class MyGame {
    var score = 0
    var name = ""
    var round : Round?
    
    deinit {
        print("Game deinit")
    }
}

//class Round {
//    var gameInfo:MyGame?
//    var lastRound = 10
//    var roundTime = 20
//    deinit {
//        print("Round deinit")
//    }
//}


// ❗️클래스를 메모리에서 해제하려면 해당 클래스를 참조하고 있는 모든 인스턴스들을 해제해줘야 해제된다.deinit.👆🏻
// ❗️클래스들 끼리 상호참조가 되고 있다면 해당 클래스의 인스턴스들을 모두 nil처리 하더라도 deinit이 되지 않는다.
// ❗️해당 인스턴스를 바라보는 변수만 메모리에서 해제된다.
// ❗️이를 방지하는 방법👇🏻

class Round {
    weak var gameInfo:MyGame? // ❗️❗️❗️weak 키워드 : 참조하고 있는 요소의 원본이 없으면 나도 사라지겠다. 참조하고 있는 요소의 원본이 있어야 존재하겠다.
    var lastRound = 10
    var roundTime = 20
    deinit {
        print("Round deinit")
    }
}

var game:MyGame? = MyGame()
var round: Round? = Round()

round?.gameInfo = game
game?.round = round


game = nil
round = nil



