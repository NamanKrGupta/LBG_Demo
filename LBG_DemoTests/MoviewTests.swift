import XCTest
@testable import LBG_Demo  // Replace with your module name

final class MovieTests: XCTestCase {

    // Example of a valid JSON string matching your model keys exactly
    let validJSON = """
    [
        {
            "Title": "Inception",
            "Year": "2010",
            "Runtime": "148 min",
            "Poster": "https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg"
        },
        {
            "Year": "2014",
            "Runtime": "169 min",
            "Poster": null
        }
    ]
    """.data(using: .utf8)!

    func testDecodeValidMovies() throws {
        let decoder = JSONDecoder()
        let movies = try decoder.decode([Movie].self, from: validJSON)

        XCTAssertEqual(movies.count, 2)

        let first = movies[0]
        XCTAssertEqual(first.title, "Inception")
        XCTAssertEqual(first.year, "2010")
        XCTAssertEqual(first.runtime, "148 min")
        XCTAssertEqual(first.poster, "https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg")
        XCTAssertNotNil(first.id) // UUID auto-generated
        XCTAssertNotNil(first.displayTitle)

        let second = movies[1]
        XCTAssertNil(second.title)
        XCTAssertNil(second.displayTitle)
    }

    func testDecodeInvalidJSON() {
        // Missing required "Title" key
        let badJSON = """
        [
            {
                "Year": 2010,
                "Runtime": "148 min",
                "Poster": "https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg"
            }
        ]
        """.data(using: .utf8)!

        let decoder = JSONDecoder()

        XCTAssertThrowsError(try decoder.decode([Movie].self, from: badJSON)) { error in
            print("Expected failure decoding bad JSON: \(error)")
        }
    }
}
