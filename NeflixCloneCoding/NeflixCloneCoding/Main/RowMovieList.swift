//
//  RowMovieList.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/10.
//

import SwiftUI

struct RowMovieList: View {
    var posterList = ["MainPoster","MainPoster","MainPoster","MainPoster"]
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
                ForEach(posterList.indices,id:\.self){index in
                    ZStack{
                        if categoryName == "오늘 대한민국의 Top 10 영화"{
                        Image(posterList[index])
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)
                            .padding(.horizontal,20)
                       
                            Text("\(index+1)")
                                .font(.custom("BebasNeue", size: 150))
                                .foregroundColor(.white)
                                .position(x: 0, y: 210)
                            
                        }
                        else{
                            NavigationLink {
                                ContentDetailView()
                                    .navigationBarTitleDisplayMode(.inline) //this must be empty
                            } label: {
                                Image(posterList[index])
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.3, alignment: .center)
                            }

                            
                        }
                    }
                    
                }
                
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
