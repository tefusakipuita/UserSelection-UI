//
//  DetailView.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: UserManager
    
    @Binding var showDetail: Bool
    
    @State var appearAnimation = false
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background Image
            HStack (spacing: 0) {
                ForEach(manager.userData) { user in
                    Image(user.post[0].postImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.screenWidth, height: appearAnimation ? CGFloat.detailImageHeight : UIScreen.screenHeight)
                        .clipped()
                        .edgesIgnoringSafeArea(.all)
                        .offset(y: appearAnimation ? -(UIScreen.screenHeight - CGFloat.detailImageHeight) / 2 : 0)
                        .animation(Animation.timingCurve(0.66, 0.23, 0.76, 0.67, duration: 0.5))
                    
                } //: ForEach
            } //: HStack
            .offset(x: (UIScreen.screenWidth)/2 * CGFloat((manager.userData.count - 1)))
            .offset(x: -CGFloat(manager.selected) * UIScreen.screenWidth)
            
            
            // MARK: - Album Scroll View
            AlbumView(manager: manager)
                .edgesIgnoringSafeArea(.all)
                .offset(y: appearAnimation ? (UIScreen.screenHeight - CGFloat.detailScrollHeight) / 2 : CGFloat.detailScrollHeight + (UIScreen.screenHeight - CGFloat.detailScrollHeight) / 2)
                .animation(Animation.timingCurve(0.66, 0.23, 0.76, 0.67, duration: 0.5))
            
            
            VStack {
                // MARK: - Album Title
                HStack {
                    Text(manager.userData[manager.selected].post[0].title)
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .semibold))
                        .opacity(appearAnimation ? 0 : 1)
                        .animation(.easeOut)
                    
                    Spacer()
                } //: HStack
                .padding()
                .padding(.top, 60)
                
                Spacer()
                
                // MARK: - User Card
                HStack (spacing: 20) {
                    ForEach(manager.userData) { user in
                        ZStack (alignment: .topTrailing) {
                            UserCardView(user: user)
                            
                            Button(action: {
                                appearAnimation = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    showDetail = false
                                }
                            }, label: {
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20, weight: .light))
                                    .padding(26)
                                    .opacity(appearAnimation ? 1 : 0)
                            }) //: Button
                        } //: ZStack
                    } //: ForEach
                } //: HStack
                .padding(.horizontal, 20)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .padding(.bottom, 30) 
                // 一番最初のカードまでoffsetさせておく
                .offset(x: (CGFloat.userCardWidth + 20)/2 * CGFloat((manager.userData.count - 1)))
                .offset(x: -CGFloat(manager.selected) * (CGFloat.userCardWidth + 20)) 
                .offset(y: appearAnimation ? -390 : 0)
                .animation(Animation.timingCurve(0.66, 0.23, 0.76, 0.67, duration: 0.5))
                .scaleEffect(appearAnimation ? 1.08 : 1)
                .animation(appearAnimation ?
                            Animation.timingCurve(0.32, -3.45, 0.77, 0.36, duration: 0.5) :
                            Animation.timingCurve(0.63, 0.12, 0.46, 3.56, duration: 0.5))
            } //: VStack
            .frame(width: UIScreen.screenWidth)
            
        } //: ZStack
        .onAppear(perform: {
            appearAnimation = true
        })
    }
}

// MARK: - Preview

struct DetailView_Previews: PreviewProvider {
    @ObservedObject static var manager = UserManager()
    @State static var showDetail = true
    
    static var previews: some View {
        DetailView(manager: manager, showDetail: $showDetail)
    }
}
