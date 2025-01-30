//
//  MovieDetailsView.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//


import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieFields
    @EnvironmentObject var savedMoviesVM: SavedMoviesViewModel // Use the SavedMoviesViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Poster
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 300)
                }

                // Movie Name
                Text(movie.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                // Save Button
                Button(action: {
                    savedMoviesVM.addMovie(movie)
                }) {
                    Text("Save Movie")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                // Other Details
                VStack(alignment: .leading, spacing: 10) {
                    Text("Duration: \(movie.runtime)")
                    Text("Language: \(movie.language.joined(separator: ", "))")
                    Text("Age Rating: \(movie.rating)")
                    Text("Genre: \(movie.genre.first ?? "N/A")")
                    Text("Story: \(movie.story)")
                    Text("IMDb Rating: \(movie.IMDb_rating)/10")
                }
                .foregroundColor(.white)
                .padding(.horizontal)
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
}
