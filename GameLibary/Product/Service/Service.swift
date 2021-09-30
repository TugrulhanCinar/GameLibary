//
//  Service.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 29.09.2021.
//

import Foundation
import Alamofire


class Service {
    
    typealias gamesCallBack = (_ games:[GameModel]?, _ status: Bool, _ message:String) -> Void
    
    typealias gameDetailCallBack = (_ game:GameDetailModel?, _ status: Bool, _ message:String) -> Void

    typealias newsCallBack = (_ news:[NewsModel]?, _ status: Bool, _ message:String) -> Void

    
    var allGamesCallBack: gamesCallBack?
    
    var gameDetailCallBack: gameDetailCallBack?
    
    var newsCallBack: newsCallBack?

    var categoryGameCallBack: gamesCallBack?

    
    func getAllGameData() {
        
        AF.request(URLConstant.sharedInstance.allGamesPopularityURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.allGamesCallBack?(nil,false, "")
                
                return
            }
            do{
                let games = try JSONDecoder().decode([GameModel].self, from: data)
                self.allGamesCallBack?(games,true,"")
            }catch{
                self.allGamesCallBack?(nil,false, error.localizedDescription)
                
                
            }
            
                
            
        }
    }
    
    
    func getGameDetail(id: Int) {
        
        AF.request(URLConstant.sharedInstance.gameDetailURl(id: id), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.allGamesCallBack?(nil,false, "")
                
                return
            }
            do{
                let games = try JSONDecoder().decode(GameDetailModel.self, from: data)
                self.gameDetailCallBack?(games,true,"")
            }catch{
                self.gameDetailCallBack?(nil,false, error.localizedDescription)
                
                
            }
            
                
            
        }
    }
    
    func getNewsData() {
        
        AF.request(URLConstant.sharedInstance.latestNewsURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.newsCallBack?(nil,false, "")
                
                return
            }
            do{
                let games = try JSONDecoder().decode([NewsModel].self, from: data)
                self.newsCallBack?(games,true,"")
            }catch{
                self.newsCallBack?(nil,false, error.localizedDescription)
                
                
            }
            
                
            
        }
    }
    
    func getCategoryGameData(category: GameCategoryEnum) {
        
        AF.request(URLConstant.sharedInstance.getGamesByCategoryURL(category: category), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.categoryGameCallBack?(nil,false, "")
                
                return
            }
            do{
                let games = try JSONDecoder().decode([GameModel].self, from: data)
                self.categoryGameCallBack?(games,true,"")
            }catch{
                
                print("Hataa: ",error )
                self.categoryGameCallBack?(nil,false, error.localizedDescription)
                
                
            }
            
                
            
        }
    }
    
    func completionHandlerGames(callBack: @escaping gamesCallBack) {
           self.allGamesCallBack = callBack
       }
    
    
    func completionHandlerGameDetail(callBack: @escaping gameDetailCallBack) {
        self.gameDetailCallBack = callBack
       }
    
    func completionCategoryInGames(callBack: @escaping gamesCallBack) {
           self.categoryGameCallBack = callBack
       }
    
    
    func completionHandlerNews(callBack: @escaping newsCallBack) {
        self.newsCallBack = callBack
       }
}
