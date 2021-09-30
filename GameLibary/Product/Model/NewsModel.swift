// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newsModel = try? newJSONDecoder().decode(NewsModel.self, from: jsonData)

import Foundation

// MARK: - NewsModelElement
struct NewsModelElement: Codable {
    let id: Int?
    let title, shortDescription: String?
    let thumbnail, mainImage: String?
    let articleContent: String?
    let articleURL: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case shortDescription = "short_description"
        case thumbnail
        case mainImage = "main_image"
        case articleContent = "article_content"
        case articleURL = "article_url"
    }
}

typealias NewsModel = NewsModelElement
