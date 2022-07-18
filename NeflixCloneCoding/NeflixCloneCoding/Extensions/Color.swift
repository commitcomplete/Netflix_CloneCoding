//
//  Color.swift
//  NeflixCloneCoding
//
//  Created by 정지혁 on 2022/07/13.
//

import Foundation
import SwiftUI

extension Color {
    static let grayButton = Color(hex: "#292929")
    static let grayBackground = Color(hex: "#2B2B2B")
    static let secondGrayButton = Color(hex: "#555555")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
      }
}
