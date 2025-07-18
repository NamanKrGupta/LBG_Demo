import Foundation
import Reachability

protocol MovieServiceProtocol {
    func fetchMovies(_ endPoint: String) async throws -> [Movie]
}

class NetworkService: MovieServiceProtocol {
    
    static let shared: NetworkService = NetworkService()
    let reachability: Reachability? = try? Reachability()

    private init() {}
    
    func fetchMovies(_ endPoint: String) async throws -> [Movie] {
        guard let reachability = reachability, reachability.connection != .unavailable else {
            throw URLError(.notConnectedToInternet)
        }
        guard let url = URL(string: "\(NetworkConstants.baseUrl)/\(endPoint)") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Movie].self, from: data)
    }
}
