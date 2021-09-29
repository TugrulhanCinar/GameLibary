//
//  URLConstant.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 28.09.2021.
//

import Foundation


//

class URLConstant {
    static let sharedInstance = URLConstant()
    
    init(){}
    
    let browserGamesPopularityURL : URL = URL(string: "https://www.mmobomb.com/api1/games?platform=browser&sort-by=popularity")!
    
    let allGamesPopularityURL : URL = URL(string:"https://www.mmobomb.com/api1/games?sort-by=popularity")!
    
    let latestNewsURL : URL = URL(string: "https://www.mmobomb.com/api1/latestnews")!
        
    let allGamesAlphabeticalURL : URL = URL(string:"https://www.mmobomb.com/api1/games?sort-by=alphabetical")!
    
  
    
    
    
    
    
    
    func getGamesByCategoryURL(category: GameCategoryEnum) -> URL {
        return URL(string: "https://www.mmobomb.com/api1/games?category=\(category.rawValue)")!
    }
    
    
    func gameDetailURl(id: Int) -> URL {
        return URL(string: "https://www.mmobomb.com/api1/game?id=\(id)")!
    }
    
    
}


    
 
