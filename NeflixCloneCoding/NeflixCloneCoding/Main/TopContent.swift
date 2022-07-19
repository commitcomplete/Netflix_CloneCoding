//
//  TopContent.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/07.
//

import SwiftUI

struct TopContent: View {
    @Binding var iscategoryClicked : Bool
    var body: some View {
        VStack(spacing : 0){
            HStack{
                Image("netflix")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding()
                Spacer()
                Image(systemName: "airplayvideo")
                    .foregroundColor(Color.white)
                    .font(.title2)
                Image("pig")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.13, alignment: .bottom)
//            .background(.black.opacity(0.4))
            HStack{
                Spacer()
                Text("시리즈")
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                Text("영화")
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                Button{
                    withAnimation {
                        iscategoryClicked.toggle()
                    }
                    
                }label: {
                    Text("카테고리")
                        .foregroundColor(.white)
                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundColor(.white)
                }
                Spacer()
            }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.06, alignment: .leading)
//                .background(.black.opacity(0.2))
            
        }
    }
}


