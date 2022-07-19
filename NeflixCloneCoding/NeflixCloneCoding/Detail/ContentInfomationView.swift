//
//  ContentInfomationView.swift
//  NeflixCloneCoding
//
//  Created by 정지혁 on 2022/07/18.
//

import SwiftUI

struct ContentInfomationView: View {
    private let title = "이상한 나라의 수학자"
    private let actors = ["최민식", "김동휘", "박병은", "박해준", "조윤서", "주진모", "김원해", "탕준상", "김희정", "강말금"]
    private let directors = ["박동훈"]
    private let staff = ["이용재"]
    private let rating = ["12세 관람가"]
    private let genre = ["드라마"]
    private let keywords = ["힐링", "감명을 주는", "진심 어린"]
    
    @Binding var isModalPresent: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.grayBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Text(title)
                    .font(.system(size: 23, weight: .bold))
                
                ScrollView(.vertical, showsIndicators: false) {
                    InfomationView(subtitle: "출연", contents: actors)
                
                    InfomationView(subtitle: "감독", contents: directors)
                
                    InfomationView(subtitle: "각본", contents: staff)
                
                    InfomationView(subtitle: "관람등급", contents: rating)
                
                    InfomationView(subtitle: "장르", contents: genre)
                
                    InfomationView(subtitle: "영화 특징", contents: keywords)
                }
                .frame(width: UIScreen.main.bounds.width)
            }
            .padding(.top, 18)
            .frame(width: UIScreen.main.bounds.width)
            
            Button(action: {
                isModalPresent.toggle()
            }, label: {
                ZStack {
                    Circle()
                        .fill(Color.secondGrayButton)
                        .frame(width: 28, height: 28)
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                }
            })
            .padding(14)
        }
        .preferredColorScheme(.dark)
    }
}

struct InfomationView: View {
    var subtitle: String
    var contents: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            Text(subtitle)
                .font(.system(size: 17, weight: .bold))
                .padding(.top, 22)
            
            ForEach(contents, id: \.self) {content in
                Text(content)
                    .font(.system(size: 14))
                    .padding(.top, 28)
            }
        }
    }
}
