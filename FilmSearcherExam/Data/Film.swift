//
//  Film.swift
//  FilmSearcherExam
//
//  Created by Mananas on 4/12/25.
//

import Foundation

struct Film: Codable {
    let id: String
    let title: String
    let year: String
    let type: String
    let poster: String
    let duration: String?
    let genre: String?
    let director: String?
    let plot: String?

    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case poster = "Poster"
        case duration = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case plot = "Plot"
    }
}

struct SearchResult: Codable {
    let films: [Film]

    enum CodingKeys: String, CodingKey {
        case films = "Search"
    }

}
