//
//  NetflixMain.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/07.
//

import SwiftUI

struct NetflixMain: View {
    @State var iscategoryClicked = false
    init(){
        UITabBar.appearance().barTintColor = .black
    }
    var body: some View {
        
        
        TabView{
            ZStack{
                Color.black
                ScrollView{
                    ZStack{
                        //main content 들어가야되는 부분
                        VStack{
                            Image("MainTitle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.5, alignment: .center)
                            
                        }
                        //상단바를 위한 스택
                        VStack{
                            TopContent(iscategoryClicked: $iscategoryClicked)
                            Spacer()
                        }
                        
                    }
                }
                if iscategoryClicked{
                    CategoryselectionView(iscategoryClicked: $iscategoryClicked)
                }
                
            }
            .ignoresSafeArea()
            .tabItem {
                Image(systemName: "house.fill")
                Text("홈")
            }
            ZStack{
                Color.black.ignoresSafeArea()
            }.tabItem{Image(systemName: "newspaper")
                Text("New & Hot")}
            ZStack{
                Color.black.ignoresSafeArea()
            }.tabItem{Image(systemName: "magnifyingglass")
                Text("검색")}
            ZStack{
                Color.black.ignoresSafeArea()
            }.tabItem{Image(systemName: "square.and.arrow.down")
                    .foregroundColor(Color.white)
                Text("저장한 컨텐츠 목록")
                    .foregroundColor(.white)
            }
        }
        .accentColor(.white)
        
    }
}

struct NetflixMain_Previews: PreviewProvider {
    static var previews: some View {
        NetflixMain()
    }
}
