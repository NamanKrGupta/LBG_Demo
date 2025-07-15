import XCTest
import SwiftUI
import ViewInspector
@testable import LBG_Demo

final class MovieRowViewTests: XCTestCase {

    func testMovieRowDisplaysCorrectText() throws {
        // Arrange: create a sample movie
        let movie = Movie(
            title: "The Matrix",
            year: "1999",
            runtime: "136 min",
            poster: nil
        )
        let view = MovieRowView(movie: movie)

        // Act: inspect VStack where texts are
        let vStack = try view.inspect().hStack().vStack(1)

        // Assert: verify title, year, runtime
        let titleText = try vStack.text(0).string()
        XCTAssertEqual(titleText, "The Matrix")

        let yearText = try vStack.text(1).string()
        XCTAssertEqual(yearText, "Year: 1999")

        let runtimeText = try vStack.text(2).string()
        XCTAssertEqual(runtimeText, "Runtime: 136 min")
    }
}
