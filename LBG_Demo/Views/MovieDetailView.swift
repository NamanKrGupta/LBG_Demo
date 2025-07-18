import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let posterString = viewModel.movie?.poster,
                   let posterURL = URL(string: posterString) {
                    AsyncImage(url: posterURL)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(8)
                } else {
                    Color.gray.frame(height: 250)
                        .cornerRadius(8)
                }

                Text(viewModel.movie?.displayTitle ?? Constants.notAvailableShort)
                    .font(.title)
                    .padding(.top)

                Text(viewModel.movie?.year ?? Constants.notAvailableShort)
                    .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle(Constants.ScreenNames.movieDetails)
    }
}
