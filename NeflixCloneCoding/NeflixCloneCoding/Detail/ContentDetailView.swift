//
//  ContentDetailView.swift
//  NeflixCloneCoding
//
//  Created by 정지혁 on 2022/07/13.
//

import SwiftUI

struct ContentDetailView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 7), count: 3)
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        TopRoundedRectangleImage(radius: 13, height: 220, imageName: "MainTitle")
                        
                        Text("이상한 나라의 수학자")
                            .font(.system(size: 17, weight: .semibold))
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 12)
                        
                        Text("학업과 재정 측면에서 어려움을 겪고 있는 학생. 학교 경비원에게 수학을 가르쳐 달라고 요청한다. 그리고 성적보다 훨씬 더 많은 것을 얻게 되는데.")
                            .font(.system(size: 13))
                            .padding(.horizontal, 10)
                        
                        HStack(spacing: 0) {
                            Text("출연: ")
                                .font(.system(size: 11))
                                .foregroundColor(.secondary)
                            
                            Text("최민식, 김동회, 박병은 ...")
                                .font(.system(size: 11))
                                .foregroundColor(.secondary)
                            
                            Button(action: {}, label: {
                                Text("더보기")
                                    .font(.system(size: 11))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            })
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 10)
                        
                        HStack(spacing: 0) {
                            Text("감독: ")
                                .font(.system(size: 11))
                                .foregroundColor(.secondary)
                            
                            Text("박동훈")
                                .font(.system(size: 11))
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 4)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Rectangle()
                                .fill(.red)
                                .frame(maxWidth: 105, maxHeight: 4)
                            
                            Text("함께 시청된 컨텐츠")
                                .font(.system(size: 14, weight: .semibold))
                                .padding(.top, 12)
                        }
                        .padding(.horizontal, 12)
                        .padding(.top, 10)
                        
                        LazyVGrid(columns: columns, spacing: 7) {
                            ForEach((0...5), id: \.self) { _ in
                                Image("MainPoster")
                                    .resizable()
                                    .cornerRadius(4)
                                    .frame(height: 174)
                            }
                        }
                        .padding(.horizontal, 8)
                        .padding(.top, 20)
                    }
                }
                
                HStack(spacing: 0) {
                    Button(action: {}, label: {
                        ZStack {
                            Circle()
                                .fill(Color.grayButton)
                                .frame(width: 30, height: 30)
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        }
                    })
                }
                .padding(10)
            }
            .preferredColorScheme(.dark)
        }
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
struct TopRoundedRectangleImage: View {
    var radius: CGFloat;
    var height: CGFloat;
    var imageName: String;
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(height: height)
            .foregroundColor(.orange)
            .padding(.bottom, radius)
            .cornerRadius(radius)
            .padding(.bottom, -radius)
    }
}
