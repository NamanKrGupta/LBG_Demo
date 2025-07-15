import Foundation

struct Movie: Identifiable, Codable, Hashable {
    let id = UUID() // Create unique id since JSON has none
    let title: String?
    let year: String?
    let runtime: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case poster = "Poster"
    }
}
