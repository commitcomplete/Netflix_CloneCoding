//
//  RowMovieList.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/10.
//

import SwiftUI

struct RowMovieList: View {
    
    @EnvironmentObject var viewModel: ViewModel
    var posterList = ["MainPoster","MainPoster","MainPoster","MainPoster","MainPoster","MainPoster","MainPoster","MainPoster","MainPoster"]
    var categoryName : String
    var body: some View {
        VStack(alignment:.leading){
            Text(categoryName)
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.black)
                .padding(.horizontal)
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                
//                        if categoryName == "오늘 대한민국의 Top 10 영화"{
//                            AsyncImage(url: URL(string: viewModel.rowMovieData1.mainPosterUrl[index])) { image in
//                                    image.resizable()
//                                } placeholder: {
//                                    Color.gray
//                                }
//                            .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)
//                            .padding(.horizontal,20)
//
//                            Text("\(index+1)")
//                                .font(.custom("BebasNeue", size: 150))
//                                .foregroundColor(.white)
//                                .position(x: 0, y: 210)
//
//                        }
//                        else{
                            if categoryName == "액션"{
                                ForEach(viewModel.rowMovieData1.mainPosterUrl.indices,id:\.self){index in
                                    ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData1.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)
                                    }
                                    
                                }
                            }else if categoryName == "어드벤처"{ForEach(viewModel.rowMovieData2.mainPosterUrl.indices,id:\.self){index in
                                ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData2.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)}}
                            }else if categoryName == "SF"{
                                ForEach(viewModel.rowMovieData3.mainPosterUrl.indices,id:\.self){index in
                                    ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData3.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)}}
                            }else if categoryName == "드라마"{
                                ForEach(viewModel.rowMovieData4.mainPosterUrl.indices,id:\.self){index in
                                    ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData4.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)}}
                            }else if categoryName == "미스터리"{
                                ForEach(viewModel.rowMovieData5.mainPosterUrl.indices,id:\.self){index in
                                    ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData5.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)}}
                            }else if categoryName == "판타지"{
                                ForEach(viewModel.rowMovieData6.mainPosterUrl.indices,id:\.self){index in
                                    ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData6.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)}}
                            }else if categoryName == "공포"{
                                ForEach(viewModel.rowMovieData7.mainPosterUrl.indices,id:\.self){index in
                                    ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData7.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)}}
                            }else if categoryName == "스릴러"{
                                ForEach(viewModel.rowMovieData8.mainPosterUrl.indices,id:\.self){index in
                                    ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData8.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)}}
                            }else if categoryName == "전기"{
                                ForEach(viewModel.rowMovieData9.mainPosterUrl.indices,id:\.self){index in
                                    ZStack{
                                AsyncImage(url: URL(string: viewModel.rowMovieData9.mainPosterUrl[index])) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)
                                    }}
                            }
                                
                            

                            
//                        }
//                    }
//
//                }
                
            }
            .padding(.horizontal)
           
            
        }
        }
    }
}

struct RowMovieList_Previews: PreviewProvider {
    static var previews: some View {
        RowMovieList(categoryName:"오늘 대한민국의 Top 10 영화")
    }
}
