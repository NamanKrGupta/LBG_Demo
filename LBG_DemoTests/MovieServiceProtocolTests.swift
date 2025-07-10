import XCTest
@testable import LBG_Demo  // Replace with your module name

final class MockMovieServiceTests: XCTestCase {

    func testFetchMoviesReturnsMovies() async throws {
        // Arrange
        let mockService = MockMovieService()
        mockService.moviesToReturn = [
            Movie(title: "Test Movie", year: "2023", runtime: "120 min", poster: nil)
        ]

        // Act
        let movies = try await mockService.fetchMovies()

        // Assert
        XCTAssertEqual(movies.count, 1)
        XCTAssertEqual(movies.first?.title, "Test Movie")
        XCTAssertEqual(movies.first?.year, "2023")
    }

    func testFetchMoviesThrowsError() async {
        // Arrange
        let mockService = MockMovieService()
        mockService.shouldThrowError = true

        // Act & Assert
        do {
            _ = try await mockService.fetchMovies()
            XCTFail("Expected fetchMovies to throw an error but it did not.")
        } catch {
            // Success: error thrown
            XCTAssertTrue(error is URLError)
            let urlError = error as? URLError
            XCTAssertEqual(urlError?.code, .badServerResponse)
        }
    }
}
