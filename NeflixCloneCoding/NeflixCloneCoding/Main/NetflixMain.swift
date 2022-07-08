//
//  NetflixMain.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/07.
//

import SwiftUI

struct NetflixMain: View {
    @State var iscategoryClicked = false
    var body: some View {
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
    }
}

struct NetflixMain_Previews: PreviewProvider {
    static var previews: some View {
        NetflixMain()
    }
}
