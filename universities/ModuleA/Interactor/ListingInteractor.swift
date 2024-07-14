//
//  ListingInteractor.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation
import RealmSwift

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
                    self.fetchFromLocalDB(with: error)
                    return
                }
                
                if let data = data {
                    do {
                        let universities = try JSONDecoder().decode([University].self, from: data)
                        self.saveToLocalDB(universities)
                        DispatchQueue.main.async {
                            self.output?.didFetchUniversities(universities)
                        }
                    } catch {
                        self.fetchFromLocalDB(with: error)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func saveToLocalDB(_ universities: [University]) {
        DispatchQueue.main.async {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(realm.objects(University.self))
                realm.add(universities)
            }
        }
    }
    
    private func fetchFromLocalDB(with error: Error) {
        DispatchQueue.main.async {
            let realm = try! Realm()
            let universities = realm.objects(University.self).map { $0 }
            if universities.isEmpty {
                self.output?.didFailToFetchUniversities(with: error)
            } else {
                self.output?.didFetchUniversities(Array(universities))
            }
        }
    }
}
