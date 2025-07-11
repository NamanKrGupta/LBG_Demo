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
                             .cornerRadius(8)
                             .clipped()
                    case .failure(_):
                        Color.red.frame(width: 60, height: 90)
                    case .empty:
                        ProgressView().frame(width: 60, height: 90)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Color.gray.frame(width: 60, height: 90)
            }

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text("Year: \(movie.year)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Runtime: \(movie.runtime)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 6)
    }
}
