import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let posterString = viewModel.movie.poster,
                   let posterURL = URL(string: posterString) {
                    AsyncImage(url: posterURL) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        case .failure(_):
                            Color.red.frame(height: 250)
                        case .empty:
                            ProgressView().frame(height: 250)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    Color.gray.frame(height: 250)
                }

                Text(viewModel.movie.title)
                    .font(.title)
                    .padding(.top)

                Text(viewModel.movie.year)
                    .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Movie Details")
    }
}
