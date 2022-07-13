//
//  MainPoster.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/10.
//

import SwiftUI

struct MainPoster: View {
    var posterName : String
    var movieName : String
    var body: some View {
        ZStack{
            NavigationLink {
                ContentDetailView()
                    .navigationBarTitleDisplayMode(.inline) //this must be empty
            
            } label: {
                Image(posterName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.5, alignment: .center)
            }

            
            
                
        }
        .mask(LinearGradient(gradient: Gradient(colors: [.clear, .black, .black, .black,.clear]), startPoint: .top, endPoint: .bottom))

        
    }
}

struct MainPoster_Previews: PreviewProvider {
    static var previews: some View {
        MainPoster(posterName: "MainTitle",movieName: "Toy Story3")
    }
}
