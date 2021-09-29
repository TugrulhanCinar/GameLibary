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
    
    typealias gameDetailCallBack = (_ games:GameDetailModel?, _ status: Bool, _ message:String) -> Void

    var callBack: gamesCallBack?
    
    var gameDetailCallBack: gameDetailCallBack?

    
    func getAllGameData() {
        
        AF.request(URLConstant.sharedInstance.allGamesPopularityURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil,false, "")
                
                return
            }
            do{
                let games = try JSONDecoder().decode([GameModel].self, from: data)
                self.callBack?(games,true,"")
            }catch{
                self.callBack?(nil,false, error.localizedDescription)
                
                
            }
            
                
            
        }
    }
    
    
    func getGameDetail(id: Int) {
        
        AF.request(URLConstant.sharedInstance.gameDetailURl(id: id), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil,false, "")
                
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
    
    
    func completionHandler(callBack: @escaping gamesCallBack) {
           self.callBack = callBack
       }
    
    
    func completionHandlerGameDetail(callBack: @escaping gameDetailCallBack) {
        self.gameDetailCallBack = callBack
       }
}
