import XCTest
@testable import LBG_Demo  // Replace with your actual module name

final class MoviesListViewModelMockTests: XCTestCase {

    @MainActor
    func testMoviesListViewModelMockInitialization() async {
        let mockViewModel = MoviesListViewModelMock()

        await mockViewModel.fetchMovies()

        XCTAssertTrue(mockViewModel.movies.isEmpty)
        XCTAssertFalse(mockViewModel.isLoading)
        XCTAssertNil(mockViewModel.errorMessage)
    }
}
