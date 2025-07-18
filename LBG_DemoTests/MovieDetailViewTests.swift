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

    func testHandlesMissingTitle() throws {
        let mockMovie = Movie(title: nil, year: "2010", runtime: "148 min", poster: nil)
        let viewModel = MovieDetailViewModel(movie: mockMovie)
        let view = MovieDetailView(viewModel: viewModel)
        let vStack = try view.inspect().scrollView().vStack()
        let title = try vStack.text(1).string()
        XCTAssertEqual(title, Constants.notAvailableShort)
    }

    func testHandlesMissingYear() throws {
        let mockMovie = Movie(title: "Inception", year: nil, runtime: "148 min", poster: nil)
        let viewModel = MovieDetailViewModel(movie: mockMovie)
        let view = MovieDetailView(viewModel: viewModel)
        let vStack = try view.inspect().scrollView().vStack()
        let year = try vStack.text(2).string()
        XCTAssertEqual(year, Constants.notAvailableShort)
    }

    func testHandlesMissingPoster() throws {
        let mockMovie = Movie(title: "Inception", year: "2010", runtime: "148 min", poster: nil)
        let viewModel = MovieDetailViewModel(movie: mockMovie)
        let view = MovieDetailView(viewModel: viewModel)
        let vStack = try view.inspect().scrollView().vStack()
        let color = try vStack.color(0)
        XCTAssertNotNil(color)
    }
    
    func testHandlesPoster() throws {
        let mockMovie = Movie(title: "Inception", year: "2010", runtime: "148 min", poster: "https://m.media-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_SX300.jpg")
        let viewModel = MovieDetailViewModel(movie: mockMovie)
        let view = MovieDetailView(viewModel: viewModel)
        let vStack = try view.inspect().scrollView().vStack()
        let asyncImage = try vStack.asyncImage(0)
        XCTAssertNotNil(asyncImage)
    }
}
