//
//  DirectorViewModel.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//



import SwiftUI

class DirectorViewModel: ObservableObject {
    @Published var directors: [DirectorFields] = []
    @Published var errorMessage: String?

    func loadDirectors() {
        fetchDirectors { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let directors):
                    self?.directors = directors
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
