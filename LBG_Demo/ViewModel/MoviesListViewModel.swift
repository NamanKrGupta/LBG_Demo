import Foundation

class MoviesListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service: MovieServiceProtocol

    init(service: MovieServiceProtocol = NetworkService()) {
        self.service = service
    }

    @MainActor
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
