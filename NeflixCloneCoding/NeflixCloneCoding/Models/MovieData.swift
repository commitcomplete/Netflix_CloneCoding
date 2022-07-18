//
//  MovieData.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/13.
//

import Foundation

struct MovieData : Codable{
    var Query : String?
    var KMAQuery   : String? 
    var TotalCount : Int?
    var Data       : [Data]? = []
}
