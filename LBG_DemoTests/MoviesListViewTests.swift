import XCTest
import SwiftUI
import ViewInspector
@testable import LBG_Demo

@MainActor
final class MoviesListViewTests: XCTestCase {

    func testShowsLoadingState() throws {
        let viewModel = MoviesListViewModel()
        viewModel.isLoading = true
        let view = MoviesListView(viewModel: viewModel)
        let progressView = try view.inspect()
            .navigationView()
            .group()
            .progressView(0)
        let labelText = try progressView.labelView().text().string()
        XCTAssertEqual(labelText, Constants.loadingMovies)
    }

    func testShowsErrorState() throws {
        let errorMessage = "Failed to load"
        let viewModel = MoviesListViewModel()
        viewModel.isLoading = false
        viewModel.errorMessage = errorMessage
        let view = MoviesListView(viewModel: viewModel)
        let text = try view.inspect()
            .navigationView()
            .group()
            .text(0) // Access the first Text view inside the Group
            .string()
        XCTAssertEqual(text, "\(Constants.error): \(errorMessage)")
    }

    func testShowsMovieList() {
        let movie = Movie(title: "Interstellar", year: "2014", runtime: "169 min", poster: nil)
        let viewModel = MoviesListViewModel()
        viewModel.movies = [movie]
        let view = MoviesListView(viewModel: viewModel)
        do {
            let _ = try view.inspect()
                .navigationView()
                .group()
                .find(ViewType.List.self)
        } catch {
            XCTFail("Should not throw, error")
        }
    }
}

