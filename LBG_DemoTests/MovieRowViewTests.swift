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

    func testMovieRowHandlesMissingTitle() throws {
        let movie = Movie(title: nil, year: "1999", runtime: "136 min", poster: nil)
        let view = MovieRowView(movie: movie)
        let vStack = try view.inspect().hStack().vStack(1)
        let titleText = try vStack.text(0).string()
        XCTAssertEqual(titleText, Constants.notAvailable)
    }

    func testMovieRowHandlesMissingYear() throws {
        let movie = Movie(title: "The Matrix", year: nil, runtime: "136 min", poster: nil)
        let view = MovieRowView(movie: movie)
        let vStack = try view.inspect().hStack().vStack(1)
        let yearText = try vStack.text(1).string()
        XCTAssertEqual(yearText, "Year: NA")
    }

    func testMovieRowHandlesMissingRuntime() throws {
        let movie = Movie(title: "The Matrix", year: "1999", runtime: nil, poster: nil)
        let view = MovieRowView(movie: movie)
        let vStack = try view.inspect().hStack().vStack(1)
        let runtimeText = try vStack.text(2).string()
        XCTAssertEqual(runtimeText, "Runtime: NA")
    }

    func testMovieRowHandlesMissingPoster() throws {
        let movie = Movie(title: "The Matrix", year: "1999", runtime: "136 min", poster: nil)
        let view = MovieRowView(movie: movie)
        let hStack = try view.inspect().hStack()
        let color = try hStack.color(0)
        XCTAssertNotNil(color)
    }
}
