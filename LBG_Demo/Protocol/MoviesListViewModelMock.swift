import Foundation

@MainActor
class MoviesListViewModelMock: MoviesListViewModel {
    override init(service: MovieServiceProtocol = NetworkService()) {
        super.init(service: service)
    }

    override func fetchMovies() async {
        // No-op for unit test
    }
}
