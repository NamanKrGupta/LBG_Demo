import SwiftUI

struct MoviesListViewWrapper: View {
    @StateObject var viewModel: MoviesListViewModelMock

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView(Constants.loadingMovies)
                } else if let error = viewModel.errorMessage {
                    Text("\(Constants.error): \(error)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: Text(Constants.ScreenNames.details)) {
                            MovieRowView(movie: movie)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(Constants.ScreenNames.moviesList)
        }
    }
}
