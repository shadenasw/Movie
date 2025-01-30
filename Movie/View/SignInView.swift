//
//  SignInView.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//



import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isAuthenticated: Bool = false
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        ZStack {
            // Background Image
            Image("Image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()

                Text("Sign in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("You'll find what you're looking for in the ocean of movies")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)

                // Email TextField
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding(.bottom, 15)

                // Password SecureField
                ZStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(.white)
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 10)
                    }
                )
                .padding(.bottom, 30)

                // Sign-in Button
                Button(action: {
                    handleSignIn()
                }) {
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }

                Spacer()
            }
            .padding()
        }
        .fullScreenCover(isPresented: $isAuthenticated) {
            MovieCenterView() // Navigate to the Movie Center upon successful sign-in
        }
    }

    private func handleSignIn() {
        fetchUsers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    if let user = users.first(where: { $0.email == email && $0.password == password }) {
                        isAuthenticated = true
                        print("Authenticated as \(user.name)")
                    } else {
                        errorMessage = "Invalid email or password."
                    }
                case .failure(let error):
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}
