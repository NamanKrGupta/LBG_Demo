import XCTest
import SwiftUI
import ViewInspector
@testable import LBG_Demo

@MainActor
final class MoviesListViewTests: XCTestCase {

    func testShowsLoadingState() throws {
        let viewModel = MoviesListViewModelMock()
        viewModel.isLoading = true
        let view = MoviesListViewWrapper(viewModel: viewModel)

        let progressView = try view.inspect()
            .navigationView()
            .group()
            .progressView(0)
             

        let labelText = try progressView.labelView().text().string()
        XCTAssertEqual(labelText, "Loading movies...")

    }

    func testShowsErrorState() throws {
        let viewModel = MoviesListViewModelMock()
        viewModel.errorMessage = "Failed to load"
        let view = MoviesListViewWrapper(viewModel: viewModel)
        let text = try view.inspect()
            .navigationView()
            .group()
            .text(0) // Access the first Text view inside the Group
            .string()

        XCTAssertEqual(text, "Error: Failed to load")

    }

    func testShowsMovieList() throws {
        let movie = Movie(title: "Interstellar", year: "2014", runtime: "169 min", poster: nil)
        let viewModel = MoviesListViewModelMock()
        viewModel.movies = [movie]
        let view = MoviesListViewWrapper(viewModel: viewModel)

        let list = try view.inspect()
            .navigationView()
            .group()
            .find(ViewType.List.self)



    }
}

