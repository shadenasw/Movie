//
//  SavedMoviesViewModel.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//



import Foundation

class SavedMoviesViewModel: ObservableObject {
    @Published var savedMovies: [MovieFields] = []

    func addMovie(_ movie: MovieFields) {
        // Avoid adding duplicates
        if !savedMovies.contains(where: { $0.name == movie.name }) {
            savedMovies.append(movie)
        }
    }

    func removeMovie(_ movie: MovieFields) {
        savedMovies.removeAll { $0.name == movie.name }
    }
}
