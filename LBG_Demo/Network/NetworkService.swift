import Foundation

protocol MovieServiceProtocol {
    func fetchMovies() async throws -> [Movie]
}

class NetworkService: MovieServiceProtocol {
    func fetchMovies() async throws -> [Movie] {
        guard let url = URL(string: "\(NetworkConstants.baseUrl)/fake-movies-api/movies") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Movie].self, from: data)
    }
}
