//
//  UniversityRepository.swift
//  universities
//
//  Created by Ahmed Elsman on 15/07/2024.
//

import Foundation
import RealmSwift

protocol UniversityRepository {
    typealias FetchUniversitiesCompletion = (Result<[University], Error>) -> Void
    
    func fetchFromNetwork(completion: @escaping FetchUniversitiesCompletion)
    func fetchFromLocalDB(completion: @escaping FetchUniversitiesCompletion)
    func saveToDB(_ universities: [University])
}

class UniversityRepositoryImpl: UniversityRepository {
    
    private let networkManager: NetworkManaging
    private let universityEndpoint = UniversityEndpoint()
    
    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
    }
    
    func fetchFromNetwork(completion: @escaping UniversityRepository.FetchUniversitiesCompletion) {
        networkManager.fetchData(from: universityEndpoint, completion: completion)
    }
    
    func fetchFromLocalDB(completion: @escaping UniversityRepository.FetchUniversitiesCompletion) {
        DispatchQueue.main.async {
            let realm = try! Realm()
            let universities = realm.objects(University.self).map { $0 }
            if universities.isEmpty {
                completion(.failure(APIError.noData))
            } else {
                completion(.success(Array(universities)))
            }
        }
    }
    
    func saveToDB(_ universities: [University]) {
        DispatchQueue.main.async {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(realm.objects(University.self))
                realm.add(universities)
            }
        }
    }
}
