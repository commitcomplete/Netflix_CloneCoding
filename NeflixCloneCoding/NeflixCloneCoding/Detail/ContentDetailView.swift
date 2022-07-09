//
//  ContentDetailView.swift
//  NeflixCloneCoding
//
//  Created by 정지혁 on 2022/07/09.
//

import SwiftUI

struct ContentDetailView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                TopRoundedRectangle(radius: 13, height: 220)
                
                Text("이상한 나라의 수학자")
                    .font(.system(size: 16))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 10)
                
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
            .previewDevice("iPhone 13 Pro")
    }
}

// 상단 모서리만 둥근 모서리로 만드는 코드
// https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
struct TopRoundedRectangle: View {
    var radius: CGFloat;
    var height: CGFloat;
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(.orange)
            .padding(.bottom, radius)
            .cornerRadius(radius)
            .padding(.bottom, -radius)
    }
}
