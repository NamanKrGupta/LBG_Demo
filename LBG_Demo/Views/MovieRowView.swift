import SwiftUI

struct MovieRowView: View {
    let movie: Movie

    var body: some View {
        HStack {
            if let posterString = movie.poster,
               let posterURL = URL(string: posterString) {
                AsyncImage(url: posterURL) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                             .aspectRatio(contentMode: .fill)
                             .frame(width: 60, height: 90)
                             .clipped()
                    case .failure(_):
                        Color.red.frame(width: 60, height: 90)
                    case .empty:
                        ProgressView().frame(width: 60, height: 90)
                    @unknown default:
                        EmptyView()
                    }
                }
                .cornerRadius(8)
            } else {
                Color.gray.frame(width: 60, height: 90)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading) {
                Text(movie.displayTitle ?? Constants.notAvailable)
                    .font(.headline)
                Text("\(Constants.year): \(movie.year ?? Constants.notAvailableShort)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("\(Constants.runtime): \(movie.runtime ?? Constants.notAvailableShort)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 6)
    }
}
