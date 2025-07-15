import Foundation

class MovieDetailViewModel: ObservableObject {
    let movie: Movie?

    init(movie: Movie?) {
        self.movie = movie
    }
}
