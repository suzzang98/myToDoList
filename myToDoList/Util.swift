//
//  Util.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/14.
//
import UIKit

extension String {
    
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

struct PetImageData: Decodable {
    let url: String
    let width: Int
    let height: Int
}
