//
//  NetflixMain.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/07.
//

import SwiftUI

struct NetflixMain: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var iscategoryClicked = false
    
    @State private var showingSheet = false
    //화면에 표시되는 리스트
    var categoryList = ["액션","어드벤처", "SF","드라마","미스터리","판타지","오늘 대한민국의 Top 10 영화","스릴러","전기"]
    //진짜 서치에 사용할 리스트
    var realCategoryList = ["액션","어드벤처", "SF","드라마","미스터리","판타지","공포","스릴러","전기"]
    
    init(){
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().backgroundColor = .black
    }
    var body: some View {
        ZStack{
        TabView{
            ZStack{
                Color.black
                ScrollView{
                    ZStack{
                        //main Poster 이미지 들어가는 부분
                        VStack{
                            Button{
                                self.showingSheet.toggle()
                                viewModel.detailMovieTitle =  viewModel.modelResultData.mainMovieTitle
                            }label: {
                                MainPoster(posterName: "MainTitle",movieName: "Toy Story2")
                                     .padding(.bottom,80)
                            }
                            ForEach(realCategoryList,id:\.self){category in
                                RowMovieList(categoryName: category,isPresented: $showingSheet)
                            }
                            
                        }
                        //상단컴포넌트를 위한 스택
                        VStack{
                            //상단 탭바
                            TopContent(iscategoryClicked: $iscategoryClicked)
                            //영화 제목
                           
                              
                            
                            Text(viewModel.modelResultData.mainMovieTitle)
                                    .font(.custom("BebasNeue", size: 40))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.1)
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
                .fullScreenCover(isPresented: $showingSheet) {
                         //sheet에 표시될 뷰를 할당
                    ContentRootView(showingSheet: $showingSheet)
                        .onAppear(){
                            viewModel.getdetailmoviePoster(titles: viewModel.detailMovieTitle)
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
        
        if iscategoryClicked{
            CategoryselectionView(iscategoryClicked: $iscategoryClicked)
        }
        }
        .onAppear(){
            
            viewModel.getmoviePoster()
            viewModel.getRowPoster1()
            viewModel.getRowPoster2()
            viewModel.getRowPoster3()
            viewModel.getRowPoster4()
            viewModel.getRowPoster5()
            viewModel.getRowPoster6()
            viewModel.getRowPoster7()
            viewModel.getRowPoster8()
            viewModel.getRowPoster9()
            
        }
        
       
    }
}

struct NetflixMain_Previews: PreviewProvider {
    static var previews: some View {
        NetflixMain()
    }
}
