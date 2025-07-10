import XCTest
import SwiftUI
import ViewInspector
@testable import LBG_Demo


    @MainActor
    func testShowsErrorMessageWhenError() throws {
        // Arrange
        let mockVM = MoviesListViewModelMock()
        mockVM.errorMessage = "Failed to load"

        let view = MoviesListViewWrapper(viewModel: mockVM)
        
        // You must inspect the first child of the Group, assuming it's the Text showing the error
        let errorText = try view.inspect()
            .navigationView()
            .group()
            .text(0)  // <-- specify index here

        // Assert
        XCTAssertEqual(try errorText.string(), "Error: Failed to load")
    }

