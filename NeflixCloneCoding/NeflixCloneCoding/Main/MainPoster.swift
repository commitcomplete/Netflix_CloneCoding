//
//  MainPoster.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/10.
//

import SwiftUI

struct MainPoster: View {
    @EnvironmentObject var viewModel: ViewModel
    var posterName : String
    var movieName : String
    var toystory2 = "http://file.koreafilm.or.kr/thm/02/00/01/61/tn_DPF002688.JPG"
    var body: some View {
        ZStack{
            
            AsyncImage(url: URL(string: viewModel.modelResultData.mainPosterUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.5, alignment: .center)
            
        }
        .mask(LinearGradient(gradient: Gradient(colors: [.clear, .black, .black, .black,.clear]), startPoint: .top, endPoint: .bottom))
        .onAppear(){
            
        }
        
    }
    
   
}

struct MainPoster_Previews: PreviewProvider {
    static var previews: some View {
        MainPoster(posterName: "MainTitle",movieName: "Toy Story3")
    }
}
