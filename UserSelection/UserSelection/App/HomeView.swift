//
//  ContentView.swift
//  UserSelection
//
//  Created by 中筋淳朗 on 2020/12/16.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager = UserManager()
    
    @State var swipeImageOffset: CGFloat = 0
    @State var swipeCardOffset: CGFloat = 0
    
    @State var showDetail = false
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background Image
            HStack (spacing: 0) {
                ForEach(manager.userData) { user in
                    Image(user.post[0].postImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                        .clipped()
                        .edgesIgnoringSafeArea(.all)
                    
                } //: ForEach
            } //: HStack
            .offset(x: (UIScreen.screenWidth)/2 * CGFloat((manager.userData.count - 1)))
            .offset(x: swipeImageOffset)
            .offset(x: -CGFloat(manager.selected) * UIScreen.screenWidth)
            
            VStack {
                // MARK: - Album Title
                HStack {
                    Text(manager.userData[manager.selected].post[0].title)
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .semibold))
                        .animation(nil)
                        .opacity(manager.isChanged ? 0 : 1)
                        .scaleEffect(manager.isChanged ? 0.9 : 1)
                    
                    Spacer()
                } //: HStack
                .padding()
                .padding(.top, 60)
                 
                Spacer()
                
                // MARK: - User Card
                HStack (spacing: 20) {
                    ForEach(manager.userData) { user in
                        UserCardView(user: user)
                            .gesture(
                                DragGesture(minimumDistance: 5, coordinateSpace: .global)
                                    .onChanged({ value in
                                        swipeUser(value: value)
                                    })
                                    .onEnded({ value in
                                        endSwipe(value: value) 
                                    })
                            ) //: gesture
                            .onTapGesture {
                                showDetail = true  
                            }
                    } //: ForEach
                } //: HStack
                .padding(.horizontal, 20) 
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .padding(.bottom, 30)
                // 一番最初のカードまでoffsetさせておく
                .offset(x: (CGFloat.userCardWidth + 20)/2 * CGFloat((manager.userData.count - 1)))   
                .offset(x: swipeCardOffset)
                .offset(x: -CGFloat(manager.selected) * (CGFloat.userCardWidth + 20))
            } //: VStack
            .frame(width: UIScreen.screenWidth)
            
            
            // MARK: - Detail
            if showDetail {
                DetailView(manager: manager, showDetail: $showDetail)
            }
            
        } //: ZStack
    }
    
    
    // MARK: - Function
    
    func swipeUser(value: DragGesture.Value) {
        let moveX = value.translation.width
        
        // 右スワイプの制限
        if !(moveX >= 0 && manager.selected == 0) {
            if !(moveX <= 0 && manager.selected == manager.userData.count - 1) {
                swipeImageOffset = moveX * (UIScreen.screenWidth / (CGFloat.userCardWidth + 20))
            }
        }
        
        swipeCardOffset = moveX
    }
    
    func endSwipe(value: DragGesture.Value) {
        let moveX = value.translation.width
        
        withAnimation (.easeInOut) {
            swipeImageOffset = 0
            swipeCardOffset = 0
            
            // 右スワイプ
            if (moveX <= -(CGFloat.userCardWidth + 20) / 2  && manager.selected != manager.userData.count - 1) {
                manager.isChanged = true
                manager.selected += 1
            }
            // 左スワイプ
            else if (moveX >= (CGFloat.userCardWidth + 20) / 2  && manager.selected != 0) {
                manager.isChanged = true
                manager.selected -= 1
            }
            
        }
        
        withAnimation (Animation.easeIn.delay(0.1)) {
            manager.isChanged = false
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static let user = Data.users[0]
    
    static var previews: some View {
        HomeView()
    }
}
