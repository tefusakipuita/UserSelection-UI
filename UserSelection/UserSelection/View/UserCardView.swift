//
//  UserCardView.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI

struct UserCardView: View {
    
    // MARK: - Property
    
    let user: User
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: CGFloat.userCardWidth, height: CGFloat.userCardHeight)
                .shadow(color: Color.black.opacity(0.2), radius: 30, x: 14, y: 20)
            
            VStack {
                // MARK: - Top
                HStack (spacing: 27) {
                    Image(user.profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 30, x: 14, y: 20)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text(user.name)
                            .font(.system(size: 24, weight: .light))
                        
                        Text(user.job)
                            .foregroundColor(.gray)
                    } //: VStack
                    
                    Spacer()
                } //: HStack
                
                Spacer()
                
                // MARK: - Bottom
                HStack {
                    // MARK: - Album
                    VStack (spacing: 6) {
                        Text(user.AlbumCount)
                            .font(.system(size: 24, weight: .light))
                            .kerning(1)
                        
                        Text("Album")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .light))
                    } //: VStack
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 0.5, height: 37)
                        .padding(.horizontal, 12)
                    
                    // MARK: - Followers
                    VStack (spacing: 6) {
                        Text(user.Followers)
                            .font(.system(size: 24, weight: .light))
                            .kerning(1)
                        
                        Text("Followers")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .light))
                    } //: VStack
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 0.5, height: 37)
                        .padding(.horizontal, 12)
                    
                    // MARK: - Followings
                    VStack (spacing: 6) {
                        Text(user.Following)
                            .font(.system(size: 24, weight: .light))
                            .kerning(1)
                        
                        Text("Folloing")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .light))
                    } //: VStack
                    
                } //: HStack
                
                
            } //: VStack
            .padding(28)
            .frame(width: CGFloat.userCardWidth, height: CGFloat.userCardHeight)
        } //: ZStack
    }
}

// MARK: - Preview

struct UserCardView_Previews: PreviewProvider {
    static let user = Data.users[0]
    
    static var previews: some View {
        UserCardView(user: user)
    }
}
