import XCTest
@testable import LBG_Demo  // Replace with your actual module name

final class MoviesListViewModelTests: XCTestCase {

    @MainActor
    func testMoviesListViewModelMockInitialization() async {
        let viewModel = MoviesListViewModel()
        await viewModel.fetchMovies()
        XCTAssertFalse(viewModel.movies.isEmpty)
        XCTAssertTrue(viewModel.movies.count > .zero)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    @MainActor
    func testMoviesListViewModelHandlesError() async {
        class FailingService: MovieServiceProtocol {
            func fetchMovies(_ endPoint: String) async throws -> [Movie] {
                throw URLError(.badServerResponse)
            }
        }
        let viewModel = MoviesListViewModel(service: FailingService())
        await viewModel.fetchMovies()
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertTrue(viewModel.movies.isEmpty)
    }

    @MainActor
    func testMoviesListViewModelHandlesEmpty() async {
        class EmptyService: MovieServiceProtocol {
            func fetchMovies(_ endPoint: String) async throws -> [Movie] {
                []
            }
        }
        let viewModel = MoviesListViewModel(service: EmptyService())
        await viewModel.fetchMovies()
        XCTAssertTrue(viewModel.movies.isEmpty)
        XCTAssertNil(viewModel.errorMessage)
    }
}
