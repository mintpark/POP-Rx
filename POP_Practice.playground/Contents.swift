//: Playground - noun: a place where people can play
// POP 프로그래밍 연습 예제.
// 소스 출처 : https://news.realm.io/kr/news/protocol-oriented-programming-in-swift/

import UIKit

struct Content {
    var url: String
    var note: String
}

protocol MediaContainer: class {
    var content: Content? { get set }
    var thumbnailImageView: UIImageView { get }
    var contentLabel: UILabel { get set }
    
    func contentChanged()
}

extension MediaContainer {
    func contentChanged() {
        // ~~~
    }
}

protocol ContainContents {
    var contents: [Content] { get }
}

extension ContainContents {
    var contents: [Content] {
        return TimelineContentObject.shared.contents
    }
}

class TimelineContentObject {
    static let shared = TimelineContentObject()
    var contents: [Content] = [Content]()
}


class TimelineTableViewCell: UITableViewCell, MediaContainer {
    var thumbnailImageView: UIImageView
    var contentLabel: UILabel
    var content: Content? {
        didSet {
            contentChanged()
        }
    }
    
    let contentObj = TimelineContentObject.shared
    let idx: Int = 0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        thumbnailImageView = UIImageView()
        contentLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bindData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func bindData() {
        content = contentObj.contents[self.idx]
    }
}

class TimelineTableViewController: UITableViewController, ContainContents {
    var contents: [Content] = []
}

class TimelineCollectionViewCell: UICollectionViewCell {
    var thumbnailImageView: UIImageView?
    var contentLabel: UILabel?
    var content: Content?
    
    override init(frame: CGRect) {
        thumbnailImageView = UIImageView()
        contentLabel = UILabel()
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

class TimelineCollectionViewController: UICollectionViewController {
    var contents: [Content] = []
}

func printHelloworld() -> Int{
    return 10
}

class TestViewController: UIViewController {
    
}

