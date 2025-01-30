//
//  DirectorResponse.swift
//  Movie
//
//  Created by shaden  on 29/07/1446 AH.
//



struct DirectorResponse: Codable {
    let records: [DirectorRecord]
}

struct DirectorRecord: Codable {
    let id: String
    let fields: DirectorFields
}

struct DirectorFields: Codable {
    let name: String
    let movies: [String]?
}
