// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameModel = try? newJSONDecoder().decode(GameModel.self, from: jsonData)

import Foundation

// MARK: - GameModelElement
struct GameModelElement: Codable {
    let id: Int?
    let title: String?
    let thumbnail: String?
    let shortDescription: String?
    let gameURL: String?
    let genre: String?
    let platform: String?
    let publisher, developer, releaseDate: String?
    let profileURL: String?

    enum CodingKeys: String, CodingKey {
           case id, title, thumbnail
           case shortDescription
           case gameURL = "game_url"
           case genre, platform, publisher, developer
           case releaseDate
           case profileURL
       }

}



typealias GameModel = GameModelElement
