//
//  Result.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/13.
//

import Foundation

struct Result :Codable{
    var DOCID      : String?    = nil
    var movieId    : String?    = nil
    var movieSeq   : String?    = nil
    var title      : String?    = nil
    var titleEng   : String?    = nil
    var titleOrg   : String?    = nil
    var titleEtc   : String?    = nil
    var prodYear   : String?    = nil
    var directors : Directors? = Directors()
    var nation     : String?    = nil
    var company    : String?    = nil
    var plots     : Plots?     = Plots()
    var runtime    : String?    = nil
    var rating     : String?    = nil
    var genre      : String?    = nil
    var kmdbUrl    : String?    = nil
    var type       : String?    = nil
    var use        : String?    = nil
    var episodes   : String?    = nil
    var ratedYn    : String?    = nil
    var repRatDate : String?    = nil
    var repRlsDate : String?    = nil
    
    var keywords   : String?    = nil
    var posters    : String?    = nil
    var stlls      : String?    = nil
    
    var openThtr   : String?    = nil
    
    var screenArea : String?    = nil
    var screenCnt  : String?    = nil
    var salesAcc   : String?    = nil
    var audiAcc    : String?    = nil
    var statSouce  : String?    = nil
    var statDate   : String?    = nil
    var themeSong  : String?    = nil
    var soundtrack : String?    = nil
    var fLocation  : String?    = nil
    var Awards1    : String?    = nil
    var Awards2    : String?    = nil
    var regDate    : String?    = nil
    var modDate    : String?    = nil
    
    var ALIAS      : String?    = nil
    var actors    : Actors?    = Actors()
}
