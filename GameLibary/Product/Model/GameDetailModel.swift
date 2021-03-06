import Foundation

// MARK: - GameDetail
struct GameDetailModel: Codable {
    let id: Int?
    let title: String?
    let thumbnail: String?
    let status, shortDescription, gameDetailDescription: String?
    let gameURL: String?
    let genre, platform, publisher, developer: String?
    let releaseDate: String?
    let profileURL: String?
    let minimumSystemRequirements: MinimumSystemRequirements?
    let screenshots: [Screenshot]?

    
    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail, status
        case genre, platform, publisher, developer

        case shortDescription = "short_description"
        case gameDetailDescription
        case gameURL = "game_url"
        case releaseDate = "release_date"
        case profileURL = "profile_url"
        case minimumSystemRequirements = "minimum_system_requirements"
        case screenshots
    }
}

// MARK: - MinimumSystemRequirements
struct MinimumSystemRequirements: Codable {
    let os, processor, memory, graphics: String?
    let storage: String?
}

// MARK: - Screenshot
struct Screenshot: Codable {
    let id: Int?
    let image: String?
}
