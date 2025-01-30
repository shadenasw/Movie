//
//  ProfileInfoPage.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//



import SwiftUI

struct ProfileInfoPage: View {
    var body: some View {
        VStack {
            // Header with "Back" and "Edit" buttons
            HStack {
                
                Spacer()

                Button(action: {
                    // Edit action
                }) {
                    Text("Edit")
                        .foregroundColor(.yellow)
                }
            }
            .padding()

            // Profile Image
            Circle()
                .fill(Color.gray) // Placeholder for profile image
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)

            // Profile Name Card with iOS Line Separator
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("First Name:")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("John") // Placeholder for first name
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)

                // Line Separator
                Divider()
                    .background(Color.white.opacity(0.3)) // Light white line

                HStack {
                    Text("Last Name:")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Doe") // Placeholder for last name
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.1))
            )
            .padding(.horizontal)

            Spacer()

            // Sign Out Button
            Button(action: {
                // Sign out action
            }) {
                Text("Sign Out")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
}
