import Foundation

class MockMovieService: MovieServiceProtocol {
    var moviesToReturn: [Movie] = []
    var shouldThrowError = false

    func fetchMovies() async throws -> [Movie] {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return moviesToReturn
    }
}
