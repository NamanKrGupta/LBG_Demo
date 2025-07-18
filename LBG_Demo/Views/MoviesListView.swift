import SwiftUI

struct MoviesListView: View {
    
    @ObservedObject var viewModel: MoviesListViewModel
    
    init(viewModel: MoviesListViewModel = MoviesListViewModel()) {
        self.viewModel = viewModel
    }

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
            .onAppear {
                Task {
                    await viewModel.fetchMovies()
                }
            }
        }
    }
}
