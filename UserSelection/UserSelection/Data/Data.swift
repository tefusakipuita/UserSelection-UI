//
//  Data.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI

struct Data {
    
    static let users = [
        User(name: "Julian Castillo", profileImage: "p1", job: "Photographer", AlbumCount: "147", Following: "282", Followers: "8,667", post: posts1),
        User(name: "Dimest.c", profileImage: "p2", job: "Designer", AlbumCount: "68", Following: "8,052", Followers: "375", post: posts2),
        User(name: "Tesusaki Puita", profileImage: "p3", job: "Programmer", AlbumCount: "10", Following: "23", Followers: "14", post: posts3)
    ]
    
    static let posts1 = [
        Post(title: "Chirstmas", postImage: "a1"),
        Post(title: "Present for my son", postImage: "a2"),
        Post(title: "Bristle grass ??", postImage: "a3"),
        Post(title: "Sun Rise!!", postImage: "a4")
    ]
    
    static let posts2 = [
        Post(title: "beautiful leaf", postImage: "b1"),
        Post(title: "awesome!!", postImage: "b2"),
        Post(title: "night view", postImage: "b3"),
        Post(title: "a lot of star", postImage: "b4")
    ]
    
    static let posts3 = [
        Post(title: "soooo cooooold", postImage: "c1"),
        Post(title: "with my friend", postImage: "c2"),
        Post(title: "٩(ˊᗜˋ )و", postImage: "c3"),
        Post(title: "cute bonsai", postImage: "c4")
    ]
}
