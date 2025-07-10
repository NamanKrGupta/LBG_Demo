import XCTest
@testable import LBG_Demo  // Replace with your app target module

final class NetworkServiceTests: XCTestCase {

    func testFetchMoviesReturnsMovies() async throws {
        let mockService = MockMovieService()
        mockService.moviesToReturn = [
            Movie(title: "Movie 1", year: "2020", runtime: "120 min", poster: "https://example.com/poster1.jpg"),
            Movie(title: "Movie 2", year: "2021", runtime: "110 min", poster: nil)
        ]

        let movies = try await mockService.fetchMovies()

        XCTAssertEqual(movies.count, 2)
        XCTAssertEqual(movies[0].title, "Movie 1")
        XCTAssertNil(movies[1].poster)
    }

    func testFetchMoviesThrowsError() async {
        let mockService = MockMovieService()
        mockService.shouldThrowError = true

        do {
            _ = try await mockService.fetchMovies()
            XCTFail("Expected fetchMovies to throw an error")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
