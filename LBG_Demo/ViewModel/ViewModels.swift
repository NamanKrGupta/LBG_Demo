import Foundation

@MainActor
class MoviesListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service: MovieServiceProtocol

    init(service: MovieServiceProtocol = NetworkService()) {
        self.service = service
    }

    func fetchMovies() async {
        isLoading = true
        defer { isLoading = false }
        do {
            movies = try await service.fetchMovies()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

@MainActor
class MovieDetailViewModel: ObservableObject {
    let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }
}
