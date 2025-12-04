//
//  ServiceApi.swift
//  FilmSearcherExam
//
//  Created by Mananas on 4/12/25.
//

import Foundation

class ServiceApi {
    static let SERVER_BASE_URL = "https://www.omdbapi.com/"
        
    func getFilms(query: String) async -> SearchResult {
        guard let url = URL(string: ServiceApi.SERVER_BASE_URL + "?s=" + query + "&apikey=31b9190c") else {
            print("Could not create URL")
            return SearchResult(films: [])
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode(SearchResult.self, from: data)
            return result
        } catch {
            print(error)
            return SearchResult(films: [])
        }
    }
    
    func getFilm(id: String) async -> Film? {
        guard let url = URL(string: ServiceApi.SERVER_BASE_URL + "?s=" + id + "&apikey=31b9190c") else {
            print("Could not create URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let film = try decoder.decode(Film.self, from: data)
            return film
        } catch {
            print(error)
            return nil
        }
    }
}
