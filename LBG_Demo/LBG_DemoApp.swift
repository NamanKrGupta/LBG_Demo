 
import SwiftUI
 
@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesListView(viewModel: .init())
        }
    }
}
