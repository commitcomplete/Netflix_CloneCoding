//
//  NetflixMain.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/07.
//

import SwiftUI

struct NetflixMain: View {
    var body: some View {
        ZStack{
            Color.black
            ScrollView{
                ZStack{
                VStack{
                    Image("MainTitle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.5, alignment: .center)
                }
                    VStack{
                        TopContent()
                        Spacer()
                    }
                }
            }
                
                
                Spacer()
            
            
            
        }
        .ignoresSafeArea()
    }
}

struct NetflixMain_Previews: PreviewProvider {
    static var previews: some View {
        NetflixMain()
    }
}
