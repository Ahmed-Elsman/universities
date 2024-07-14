//
//  ListingInteractor.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation

protocol ListingInteractorInput {
    func fetchUniversities()
}

protocol ListingInteractorOutput: AnyObject {
    func didFetchUniversities(_ universities: [University])
    func didFailToFetchUniversities(with error: Error)
}

class ListingInteractor: ListingInteractorInput {
    weak var output: ListingInteractorOutput?
    private let apiUrl = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
    
    func fetchUniversities() {
        if let url = URL(string: apiUrl) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    return
                }
                
                if let data = data {
                    do {
                        let universities = try JSONDecoder().decode([University].self, from: data)
                        self.output?.didFetchUniversities(universities)
                    } catch {
                    }
                }
            }
            task.resume()
        }
    }
}
