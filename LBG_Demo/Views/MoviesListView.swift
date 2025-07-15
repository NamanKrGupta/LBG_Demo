import SwiftUI

struct MoviesListView: View {
    @StateObject private var viewModel = MoviesListViewModel()

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
                        NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))) {
                            MovieRowView(movie: movie)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(Constants.ScreenNames.moviesList)
            .task {
                await viewModel.fetchMovies()
            }
        }
    }
}
