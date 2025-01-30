//
//  DirectorListView.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//



import SwiftUI

struct DirectorView: View {
    @StateObject private var viewModel = DirectorViewModel()

    var body: some View {
        NavigationView {
            if viewModel.directors.isEmpty {
                Text("Loading directors...")
                    .onAppear {
                        viewModel.loadDirectors()
                    }
            } else {
                List(viewModel.directors, id: \.name) { director in
                    VStack(alignment: .leading) {
                        Text(director.name).font(.headline)
                        if let movies = director.movies {
                            ForEach(movies, id: \.self) { movieID in
                                Text("Movie ID: \(movieID)").font(.caption)
                            }
                        }
                    }
                }
                .navigationTitle("Directors")
            }
        }
    }
}
