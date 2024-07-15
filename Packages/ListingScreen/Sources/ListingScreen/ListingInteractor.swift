//
//  ListingInteractor.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation
import Common
import DAL

protocol ListingInteractorInput {
    func fetchUniversities()
}

protocol ListingInteractorOutput: AnyObject {
    func didFetchUniversities(_ universities: [University])
    func didFailToFetchUniversities(with error: Error)
}

class ListingInteractor: ListingInteractorInput {
    weak var output: ListingInteractorOutput?
    private let repository: UniversityRepository
    
    init(repository: UniversityRepository) {
        self.repository = repository
    }
    
    // TODO: Fix Pyramids of Doom
    @MainActor
    func fetchUniversities() {
        repository.fetchFromNetwork { [weak self] result in
            switch result {
            case .success(let universities):
                self?.repository.saveToDB(universities)
                self?.output?.didFetchUniversities(universities)
            case .failure(let error):
                self?.repository.fetchFromLocalDB { localResult in
                    switch localResult {
                    case .success(let universities):
                        self?.output?.didFetchUniversities(universities)
                    case .failure(let localError):
                        self?.output?.didFailToFetchUniversities(with: localError)
                    }
                }
            }
        }
    }
}
