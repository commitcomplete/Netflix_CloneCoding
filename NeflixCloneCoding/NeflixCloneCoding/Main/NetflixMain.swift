//
//  NetflixMain.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/07.
//

import SwiftUI

struct NetflixMain: View {
    @State var iscategoryClicked = false
    var categoryList = ["미국 블록버스터 영화","심리 게임 영화","실화 바탕 영화","인디 영화","오늘 대한민국의 Top 10 영화","호러 영화"]
    init(){
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().backgroundColor = .black
    }
    var body: some View {
        ZStack{
            NavigationView{
        TabView{
            ZStack{
                Color.black
                ScrollView{
                    ZStack{
                        //main Poster 이미지 들어가는 부분
                        VStack{
                           MainPoster(posterName: "MainTitle",movieName: "Toy Story3")
                                .padding(.bottom,80)
                            ForEach(categoryList,id:\.self){category in
                                RowMovieList(categoryName: category)
                            }
                            
                        }
                        //상단컴포넌트를 위한 스택
                        VStack{
                            //상단 탭바
                            TopContent(iscategoryClicked: $iscategoryClicked)
                            //영화 제목
                            Text("Toy Story3")
                                .font(.custom("BebasNeue", size: 80))
                                .foregroundColor(.white)
                                .padding(.top,UIScreen.main.bounds.height * 0.2)
                            // 영화 카테고리
                            HStack{
                                Text("Friendship  *")
                                    .font(.custom("BebasNeue", size: 20))
                                    .foregroundColor(.white)
                                Text("Romance  *")
                                    .font(.custom("BebasNeue", size: 20))
                                    .foregroundColor(.white)
                                Text("  SF")
                                    .font(.custom("BebasNeue", size: 20))
                                    .foregroundColor(.white)

                            }
                            //추가 버튼들
                            HStack{
                                Spacer()
                                VStack{
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                    Text("내가 찜한 콘텐츠")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                HStack{
                                    Image(systemName:"play.fill")
                                        .foregroundColor(.black)
                                    Text("재생")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical,5)
                                    .padding(.horizontal)
                                .background(.white)
                                .cornerRadius(5)
                                .padding(.trailing,20)
                                Spacer()
                                Button{
                                    
                                }label: {
                                    VStack{
                                        Image(systemName: "info.circle")
                                            .foregroundColor(.white)
                                        Text("정보")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                    }
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        
                    }
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
        if iscategoryClicked{
            CategoryselectionView(iscategoryClicked: $iscategoryClicked)
        }
        }
            
        
       
    }
}

struct NetflixMain_Previews: PreviewProvider {
    static var previews: some View {
        NetflixMain()
    }
}
