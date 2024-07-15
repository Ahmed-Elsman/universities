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
    private let networkManager: NetworkManaging
    private let universityEndpoint = UniversityEndpoint()
    
    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
    }
    
    func fetchUniversities() {
        networkManager.fetchData(from: universityEndpoint) { [weak self] (result: Result<[University], Error>) in
            switch result {
            case .success(let universities):
                if self?.universityEndpoint.shouldSaveToDatabase == true {
                    self?.saveToLocalDB(universities)
                }
                DispatchQueue.main.async {
                    self?.output?.didFetchUniversities(universities)
                }
            case .failure(let error):
                self?.fetchFromLocalDB(with: error)
            }
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
