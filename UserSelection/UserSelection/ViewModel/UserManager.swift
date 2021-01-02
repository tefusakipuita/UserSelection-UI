//
//  UserManager.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI

class UserManager: ObservableObject {
    
    @Published var userData = Data.users
    
    @Published var selected = 0
    @Published var isChanged = false
}
