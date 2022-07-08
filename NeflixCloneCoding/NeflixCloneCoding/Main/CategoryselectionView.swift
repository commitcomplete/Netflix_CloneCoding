//
//  CategoryselectionView.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/08.
//

import SwiftUI

struct CategoryselectionView: View {
    var categoryList = ["모든 카테고리","저장 가능", "한국","미국 영화","해외","어워드 수상","인디","어린이 & 가족","애니메이션","코미디","호러","스릴러","SF","판타지"]
    @Binding var iscategoryClicked : Bool
    var body: some View {
       
        ZStack{
            Color.black
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators:false){
                LazyVStack(pinnedViews: [.sectionFooters]){
                    Section(footer: Footer(iscategoryClicked: $iscategoryClicked)){
                    ForEach(categoryList,id:\.self){ category in
                            Text(category)
                                .font(.title2)
                                .foregroundColor(.gray)
                                .padding()
                    }
                }
                }
                .clipped()
            }
        }
    }
}


struct Footer: View {
    @Binding var iscategoryClicked : Bool
    var body: some View {
        HStack{
            Button{
                withAnimation {
                    iscategoryClicked.toggle()
                }
                
            }label: {
                Image(systemName: "x.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                
            }
                
        }
        .padding()
        .padding(.bottom,20)
    }
    
}
