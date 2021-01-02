//
//  AlbumItemView.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI

struct AlbumItemView: View {
    
    // MARK: - Property
    
    let album: Post
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(album.postImage)
                .resizable()
                .scaledToFill()
                .frame(width: CGFloat.albumImageWidth, height: CGFloat.albumImageWidth)
                .clipped()
            
            Text(album.title)
                .foregroundColor(Color.black.opacity(0.8))
                .font(.system(size: 18, weight: .light))
        } //: VStack
    }
}

// MARK: - Preview

struct AlbumItemView_Previews: PreviewProvider {
    @ObservedObject static var manager = UserManager()
    @State static var showDetail = true
    
    static var previews: some View {
        DetailView(manager: manager, showDetail: $showDetail)
    }
}
