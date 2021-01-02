//
//  Extension.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI



extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

extension CGFloat {
    
    static let userCardWidth = UIScreen.screenWidth - 60
    static let userCardHeight = userCardWidth * 0.65
    
    static let detailImageHeight: CGFloat = 330
    
    static let detailScrollHeight = UIScreen.screenHeight - detailImageHeight
    
    static let albumImageWidth = (UIScreen.screenWidth - 40 - 20) / 2
}
