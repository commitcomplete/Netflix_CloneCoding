//
//  ViewModel.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/13.
//

import SwiftUI
import Combine
class ViewModel : ObservableObject{
    var stringKey = "1Q1WI0Q207J726GV3U9B"
    @Published var mainPosterImageUrl = ""
    @Published var imageurlArr : [String] = []
    //메인 포스터용 모델 변수
    @Published var modelResultData = ResultData()
    @Published var rowMovieData1 = RowMovieData()
    @Published var rowMovieData2 = RowMovieData()
    @Published var rowMovieData3 = RowMovieData()
    @Published var rowMovieData4 = RowMovieData()
    @Published var rowMovieData5 = RowMovieData()
    @Published var rowMovieData6 = RowMovieData()
    @Published var rowMovieData7 = RowMovieData()
    @Published var rowMovieData8 = RowMovieData()
    @Published var rowMovieData9 = RowMovieData()
    
    @Published var detailMovieTitle = ""
    @Published var detailMovieResultData = DetailResultData()
    
    @Published var detailCategory = ""
    @Published var detailRow = RowMovieData()
    
    func loadData(completionHandler: @escaping (_ data:ResultData)->Void) {
        var resultData = ResultData()
        var urlString = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=1Q1WI0Q207J726GV3U9B&listCount=3&releaseDts=2016"
        
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
                    self.imageurlArr =  ($0.Result?[1].posters?.components(separatedBy : "|"))!
                    print($0.Result?[0].posters)
                    print($0.TotalCount)
                    resultData.mainPosterUrl = self.imageurlArr[0]
                    resultData.mainMovieTitle = ($0.Result?[1].title)!
                    resultData.categories = ($0.Result?[1].genre?.components(separatedBy : ","))!
                    
                }
                completionHandler(resultData)
                print(self.imageurlArr[0])
                print(resultData.mainPosterUrl)
                print(resultData.mainMovieTitle)
                print(resultData.categories[0])
            }
            
            
        }.resume()
        
    }
    //메인포스터 호출용 함수
    func getmoviePoster(){
        loadData { [weak self] data in
            DispatchQueue.main.async {
            self?.modelResultData = data
            }
        }
    }
    
    
        func loadRowData(category : String , completionHandler: @escaping (_ data:RowMovieData)->Void) {
        var resultData = RowMovieData()
        var urlString = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=1Q1WI0Q207J726GV3U9B&detail=Y&listCount=17&releaseDts=2017&genre="
        urlString += category
        print(urlString)
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
                    
//                    print($0.Result?[0].posters)
//                    print($0.TotalCount)
//                    resultData.mainPosterUrl = self.imageurlArr[0]
//                    resultData.mainMovieTitle = ($0.Result?[1].title)!
//                    resultData.categories = ($0.Result?[1].genre?.components(separatedBy : ","))!
//                    resultData.mainMovieTitle[0] = ($0.Result?[0].title)!
//                    resultData.mainPosterUrl[0] = ($0.Result?[0].posters)!
//                    print(($0.Result?[0].title)!)
//                    print(($0.Result?[0].posters?.components(separatedBy : "|"))![0])
                    for i in 0...16{
                        print(($0.Result?[i].title)!)
                        print(($0.Result?[i].posters?.components(separatedBy : "|"))![0])
                        if ($0.Result?[i].posters?.components(separatedBy : "|"))![0] != ""{
                            resultData.mainMovieTitle.append(($0.Result?[i].title)!)
                            resultData.mainPosterUrl.append(($0.Result?[i].posters?.components(separatedBy : "|"))![0])
                        }
                        if resultData.mainPosterUrl.count == 10 {
                            break
                        }
                        
                    }
                }
                completionHandler(resultData)
                
            }
            
            
        }.resume()
        
    }
    //메인포스터 호출용 함수
   
    func getRowPoster1(){
        loadRowData(category : "액션") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData1 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster2(){
        loadRowData(category : "어드벤처") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData2 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster3(){
        loadRowData(category : "SF") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData3 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster4(){
        loadRowData(category : "드라마") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData4 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster5(){
        loadRowData(category : "미스터리") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData5 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster6(){
        loadRowData(category : "판타지") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData6 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster7(){
        loadRowData(category : "공포") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData7 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster8(){
        loadRowData(category : "스릴러") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData8 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster9(){
        loadRowData(category : "전기") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData9 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    
    //카테고리 변경을 위한 함수들
    func loadRowData2(category : String , completionHandler: @escaping (_ data:RowMovieData)->Void) {
        var resultData = RowMovieData()
        var urlString = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=1Q1WI0Q207J726GV3U9B&detail=Y&listCount=17&releaseDts=2014&genre="
        urlString += category
        print(urlString)
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
                    
//                    print($0.Result?[0].posters)
//                    print($0.TotalCount)
//                    resultData.mainPosterUrl = self.imageurlArr[0]
//                    resultData.mainMovieTitle = ($0.Result?[1].title)!
//                    resultData.categories = ($0.Result?[1].genre?.components(separatedBy : ","))!
//                    resultData.mainMovieTitle[0] = ($0.Result?[0].title)!
//                    resultData.mainPosterUrl[0] = ($0.Result?[0].posters)!
//                    print(($0.Result?[0].title)!)
//                    print(($0.Result?[0].posters?.components(separatedBy : "|"))![0])
                    for i in 0...16{
                        print(($0.Result?[i].title)!)
                        print(($0.Result?[i].posters?.components(separatedBy : "|"))![0])
                        if ($0.Result?[i].posters?.components(separatedBy : "|"))![0] != ""{
                            resultData.mainMovieTitle.append(($0.Result?[i].title)!)
                            resultData.mainPosterUrl.append(($0.Result?[i].posters?.components(separatedBy : "|"))![0])
                        }
                        if resultData.mainPosterUrl.count == 10 {
                            break
                        }
                        
                    }
                }
                completionHandler(resultData)
                
            }
            
            
        }.resume()
        
    }
    //메인포스터 호출용 함수
   
    func getRowPoster12(){
        loadRowData2(category : "액션") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData1 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster22(){
        loadRowData2(category : "어드벤처") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData2 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster32(){
        loadRowData2(category : "SF") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData3 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster42(){
        loadRowData2(category : "드라마") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData4 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster52(){
        loadRowData2(category : "미스터리") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData5 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster62(){
        loadRowData2(category : "판타지") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData6 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster72(){
        loadRowData2(category : "공포") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData7 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster82(){
        loadRowData2(category : "스릴러") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData8 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    func getRowPoster92(){
        loadRowData2(category : "전기") { [weak self] data in
            DispatchQueue.main.async {
            self?.rowMovieData9 = data
            }
        }
        
        print(rowMovieData1.mainPosterUrl.count)
    }
    
    
    func loadData2(completionHandler: @escaping (_ data:ResultData)->Void) {
        var resultData = ResultData()
        var urlString = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=1Q1WI0Q207J726GV3U9B&listCount=3&releaseDts=2015"
        
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
                    self.imageurlArr =  ($0.Result?[1].posters?.components(separatedBy : "|"))!
                    print($0.Result?[0].posters)
                    print($0.TotalCount)
                    resultData.mainPosterUrl = self.imageurlArr[0]
                    resultData.mainMovieTitle = ($0.Result?[1].title)!
                    resultData.categories = ($0.Result?[1].genre?.components(separatedBy : ","))!
                    
                }
                completionHandler(resultData)
                print(self.imageurlArr[0])
                print(resultData.mainPosterUrl)
                print(resultData.mainMovieTitle)
                print(resultData.categories[0])
            }
            
            
        }.resume()
        
    }
    //메인포스터 호출용 함수
    func getmoviePoster2(){
        loadData2 { [weak self] data in
            DispatchQueue.main.async {
            self?.modelResultData = data
            }
        }
    }
    
    func getdetailmoviePoster(titles:String){
        loadData3(title:titles) { [weak self] data in
            DispatchQueue.main.async {
                self?.detailMovieResultData = data
            }
        }
    }
    
    //디테일 뷰 영화 정보를 받아오기 위한 함수
    func loadData3(title : String,completionHandler: @escaping (_ data:DetailResultData)->Void) {
        var resultData = DetailResultData()
        var urlString = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=1Q1WI0Q207J726GV3U9B&detail=Y&listCount=1&title="
        urlString += title
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
                    resultData.posterurl = self.imageurlArr[0]
                    resultData.title = ($0.Result?[0].title)!
                    resultData.directors = ($0.Result?[0].directors?.director![0].directorNm)!
                    resultData.actor1 = ($0.Result?[0].actors?.actor![0].actorNm)!
                    resultData.actor2 = ($0.Result?[0].actors?.actor![1].actorNm)!
                    resultData.actor3 = ($0.Result?[0].actors?.actor![2].actorNm)!
                    resultData.plot = ($0.Result?[0].plots?.plot![0].plotText)!
//                    resultData.genre = ($0.Result?[0].genre[0])
//                    resultData.categories = ($0.Result?[1].genre?.components(separatedBy : ","))!
                    
                }
                completionHandler(resultData)
                print(self.imageurlArr[0])
//                print(resultData.mainPosterUrl)
//                print(resultData.mainMovieTitle)
//                print(resultData.categories[0])
            }
            
            
        }.resume()
        
    }

    
    
    func getDetailRow(categorys : String){
        loadRowData2(category : categorys) { [weak self] data in
            DispatchQueue.main.async {
                self?.detailRow = data
            }
        }
        
       
    }
    
}


