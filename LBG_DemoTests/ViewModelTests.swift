import XCTest
@testable import LBG_Demo

@MainActor
final class MoviesListViewModelTests: XCTestCase {

    func testFetchMoviesSuccess() async {
        let mockService = MockMovieService()
        mockService.moviesToReturn = [
            Movie(title: "Inception", year: "2010", runtime: "148 min", poster: nil)
        ]

        let viewModel = MoviesListViewModel(service: mockService)

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertTrue(viewModel.movies.isEmpty)

        await viewModel.fetchMovies()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.movies.count, 1)
        XCTAssertEqual(viewModel.movies.first?.title, "Inception")
    }

    func testFetchMoviesFailure() async {
        let mockService = MockMovieService()
        mockService.shouldThrowError = true

        let viewModel = MoviesListViewModel(service: mockService)

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertTrue(viewModel.movies.isEmpty)

        await viewModel.fetchMovies()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertTrue(viewModel.movies.isEmpty)
    }
}
