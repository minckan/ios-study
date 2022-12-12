import UIKit

// Enum
// 타입분류

// 도서관 -> 항목 -> 소설, 잡지, 만화, 에세이...
// 분류만 하고 싶다 + 값
enum BookType {
    case finction(title: String, price: Int, year: Int)
    case comics(title: String, price: Int, year: Int)
    case megazin(title: String, price: Int, year: Int)
}

extension BookType {
    var typeName: String {
        switch self {
        case .comics:
            return "comics"
        case .finction:
            return "finction"
        case .megazin:
            return "megazin"
        }
    
    }
}

var bookType : BookType?
var books = [BookType]()

func saveBook(book: BookType) {
    books.append(book)
}

//func loadBooks(book: BookType) -> [BookType] {
//    var tempBooks = [BookType]()
//
//    for item in books {
//        if item == book {
//            tempBooks.append(item)
//        }
//    }
//    return tempBooks
//}

saveBook(book: .comics(title: "aaa", price: 3000, year: 2020))
saveBook(book: .comics(title: "bbb", price: 4000, year: 2020))
saveBook(book: .finction(title: "nnn", price: 5000, year: 2020))
saveBook(book: .finction(title: "ddd", price: 6000, year: 2020))
saveBook(book: .finction(title: "sss", price: 7000, year: 2020))
saveBook(book: .finction(title: "www", price: 8000, year: 2020))

for book in books {
    
    if case let BookType.comics(title, _, _) = book {
        print("comics", title, book.typeName)
    }
    
    switch book {
    case let .comics(_, price,_):
       print(price)
    case let .finction(_, price,_):
        print(price)
        
    default:
        break
    }
}
