//
//  ActionMovieCard.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//
import SwiftUI

struct ActionMovies: View {
    let movie: MovieFields

    var body: some View {
        NavigationLink(destination: MovieDetailsView(movie: movie)) {
            ZStack {
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 208, height: 275)
                        .cornerRadius(10)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 208, height: 275)
                        .cornerRadius(10)
                }
            }
        }
    }
}
