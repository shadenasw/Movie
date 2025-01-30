//
//  API.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//

import Foundation

// Fetch Movies
func fetchMovies(completion: @escaping (Result<[MovieFields], Error>) -> Void) {
    guard let url = URL(string: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/movies") else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001", forHTTPHeaderField: "Authorization")

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error fetching movies: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }

        guard let data = data else {
            print("No data received")
            return
        }

        print("Raw Response Data: \(String(data: data, encoding: .utf8) ?? "Invalid Data")")

        do {
            let decoder = JSONDecoder()
            let moviesResponse = try decoder.decode(MovieResponse.self, from: data)
            let movies = moviesResponse.records.map { $0.fields } // Extract fields
            print("Decoded Movies: \(movies)")
            completion(.success(movies))
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }.resume()
}

// Fetch Actors
func fetchActors(completion: @escaping (Result<[ActorFields], Error>) -> Void) {
    guard let url = URL(string: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/actors") else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001", forHTTPHeaderField: "Authorization")

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error fetching actors: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }

        guard let data = data else {
            print("No data received")
            return
        }

        print("Raw Response Data: \(String(data: data, encoding: .utf8) ?? "Invalid Data")")

        do {
            let decoder = JSONDecoder()
            let actorsResponse = try decoder.decode(ActorResponse.self, from: data)
            let actors = actorsResponse.records.map { $0.fields } // Extract fields
            print("Decoded Actors: \(actors)")
            completion(.success(actors))
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }.resume()
}

// Fetch Directors
func fetchDirectors(completion: @escaping (Result<[DirectorFields], Error>) -> Void) {
    guard let url = URL(string: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/directors") else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001", forHTTPHeaderField: "Authorization")

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error fetching directors: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }

        guard let data = data else {
            print("No data received")
            return
        }

        print("Raw Response Data: \(String(data: data, encoding: .utf8) ?? "Invalid Data")")

        do {
            let decoder = JSONDecoder()
            let directorsResponse = try decoder.decode(DirectorResponse.self, from: data)
            let directors = directorsResponse.records.map { $0.fields } // Extract fields
            print("Decoded Directors: \(directors)")
            completion(.success(directors))
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }.resume()
}


// Fetch user

func fetchUsers(completion: @escaping (Result<[UserFields], Error>) -> Void) {
    guard let url = URL(string: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/users") else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001", forHTTPHeaderField: "Authorization")

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            print("No data received")
            return
        }

        do {
            let response = try JSONDecoder().decode(UserResponse.self, from: data)
            let users = response.records.map { $0.fields }
            completion(.success(users))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}

