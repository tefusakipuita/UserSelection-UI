//
//  User.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI

struct User: Identifiable {
    
    let id = UUID()
    let name: String
    let profileImage: String
    let job: String
    let AlbumCount: String
    let Following: String
    let Followers: String
    let post: [Post]
}
