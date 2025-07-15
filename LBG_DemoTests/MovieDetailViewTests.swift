import XCTest
import SwiftUI
import ViewInspector
@testable import LBG_Demo

final class MovieDetailViewTests: XCTestCase {

    func testDisplaysTitleAndYear() throws {
        // Arrange
        let mockMovie = Movie(title: "Inception", year: "2010", runtime: "148 min", poster: nil)
        let viewModel = MovieDetailViewModel(movie: mockMovie)
        let view = MovieDetailView(viewModel: viewModel)

        // Act
        let vStack = try view.inspect().scrollView().vStack()

        // Assert title
        let title = try vStack.text(1).string()
        XCTAssertEqual(title, "Inception")

        // Assert year
        let year = try vStack.text(2).string()
        XCTAssertEqual(year, "2010")
    }
}
