import Foundation

class MoviesListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    let service: MovieServiceProtocol
    
    init(service: MovieServiceProtocol = NetworkService.shared) {
        self.service = service
    }
    
    @MainActor
    func fetchMovies() async {
        isLoading = true
        defer { isLoading = false }
        do {
            movies = try await service.fetchMovies(EndPoints.fetchMovies)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
