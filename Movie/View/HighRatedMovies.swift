//
//  HighRatedMovieCard.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//
import SwiftUI

struct HighRatedMovies: View {
    let movie: MovieFields

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Movie Poster
            AsyncImage(url: URL(string: movie.poster)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 366, height: 434) // Updated size
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
            }

            // Movie Name and Rating (Inside Poster)
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 0) // Text shadow for readability
                Text("IMDb: \(movie.IMDb_rating, specifier: "%.1f")")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
                    .shadow(color: .black, radius: 3, x: 0, y: 0) // Text shadow
            }
            .padding()
            .background(
                LinearGradient(
                    colors: [Color.black.opacity(0.8), Color.clear],
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .cornerRadius(15)
        }
        .frame(width: 366, height: 434) // Ensure card frame matches poster size
    }
}
