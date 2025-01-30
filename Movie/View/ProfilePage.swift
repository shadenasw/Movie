//
//  ProfilePage.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//
import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var savedMoviesVM: SavedMoviesViewModel // Access saved movies data

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header: "Profile"
            Text("Profile")
                .font(.system(size: 33, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.top)

            // Profile Card
            HStack(spacing: 15) {
                // Profile Image
                Circle()
                    .fill(Color.gray) // Placeholder image
                    .frame(width: 60, height: 60)

                VStack(alignment: .leading) {
                    Text("User Name") // Placeholder name
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("user@example.com") // Placeholder email
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                // Arrow Button to navigate to Profile Info Page
                NavigationLink(destination: ProfileInfoPage()) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.1))
            )
            .padding(.horizontal)

            // Saved Movies Section
            Text("Saved Movies")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            if savedMoviesVM.savedMovies.isEmpty {
                // If no saved movies
                Text("No saved movies yet.")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            } else {
                // List of saved movies
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(savedMoviesVM.savedMovies, id: \.name) { movie in
                            HStack {
                                // Movie Poster
                                AsyncImage(url: URL(string: movie.poster)) { image in
                                    image.resizable()
                                        .frame(width: 50, height: 75)
                                        .cornerRadius(5)
                                } placeholder: {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 50, height: 75)
                                        .cornerRadius(5)
                                }

                                // Movie Name and IMDb Rating
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(movie.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("IMDb: \(movie.IMDb_rating, specifier: "%.1f")")
                                        .font(.subheadline)
                                        .foregroundColor(.yellow)
                                }

                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                }
            }

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
