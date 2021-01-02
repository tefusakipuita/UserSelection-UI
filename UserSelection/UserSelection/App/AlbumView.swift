//
//  AlbumView.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI

struct AlbumView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: UserManager
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.white
            
            ScrollView (showsIndicators: false) {
                VStack {
                    // MARK: - Top Title
                    HStack {
                        Text("Album")
                            .font(.system(size: 30, weight: .light))
                            .kerning(1)
                        
                        Spacer()
                        
                        Text("All")
                            .foregroundColor(.gray)
                            .font(.system(size: 22, weight: .light))
                            .kerning(1)
                    } //: HStack
                    .padding(.horizontal, 26)
                    .padding(.top, 130)
                    .padding(.bottom, 22)
                    
                    // MARK: - Albums
                    LazyVGrid(columns: layout, spacing: 20) {
                        ForEach(manager.userData[manager.selected].post) { album in
                            AlbumItemView(album: album)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                } //: VStack
                .padding(.bottom, 30)
            } //: Scroll
            
        } //: ZStack
        .frame(width: UIScreen.screenWidth, height: CGFloat.detailScrollHeight)
    }
}

// MARK: - Preview

struct AlbumView_Previews: PreviewProvider {
    @ObservedObject static var manager = UserManager()
    @State static var showDetail = true
    
    static var previews: some View {
        DetailView(manager: manager, showDetail: $showDetail)
    }
}
