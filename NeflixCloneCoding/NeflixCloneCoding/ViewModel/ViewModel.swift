//
//  ViewModel.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/13.
//

import SwiftUI
import Combine
class ViewModel : ObservableObject{
    //스트링키 추가
    //var stringKey =
    @Published var mainPosterImageUrl = ""
    @Published var imageurlArr : [String] = []
    
    func loadData(completionHandler: @escaping (_ data:String)->Void) {
        var urlString = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&title=토이스토리2&ServiceKey="+stringKey
        
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: encodedString ) else {
            print(encodedString)
            fatalError("Invalid URL")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            let result = try? JSONDecoder().decode(MovieData.self, from: data)
            if let result = result {
                
                result.Data?.forEach {
                    self.imageurlArr =  ($0.Result?[0].posters?.components(separatedBy : "|"))!
                    print($0.Result?[0].posters)
                    print($0.TotalCount)
                }
                completionHandler(self.imageurlArr[1])
                print(self.imageurlArr[0])
            }
            
            
        }.resume()
        
    }
    
    func getmoviePoster(){
        loadData { [weak self] data in
            self?.mainPosterImageUrl = data
        }
    }
}



