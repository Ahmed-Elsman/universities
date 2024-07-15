//
//  ListingPresenter.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation

protocol ListingView: AnyObject {
    func showUniversities(_ universities: [University])
    func showError(_ error: String)
}

class ListingPresenter {
    typealias Data = [University]
    
    private let interactor: ListingInteractorInput
    private let router: ListingRouter
    weak var view: ListingView?
    
    var state: PresenterState<Data> = .loading {
        didSet {
            DispatchQueue.main.async {
                self.handleStateChange()
            }
        }
    }
    
    init(interactor: ListingInteractorInput, router: ListingRouter) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        state = .loading
        interactor.fetchUniversities()
    }

    func refreshData() {
        state = .loading
        interactor.fetchUniversities()
    }

    func didSelectUniversity(_ university: University) {
        router.navigateToDetails(with: university, listingPresenter: self)
    }
    
    private func handleStateChange() {
        switch state {
        case .loading:
            // showProgressView()
            print("Loading ....")
        case .loaded(let universities):
            // .hideProgressView()
            print("Loaded")
            view?.showUniversities(universities)
        case .error(let error):
            // hideProgressView()
            print("Error")
            view?.showError(error.localizedDescription)
        }
    }
}

extension ListingPresenter: ListingInteractorOutput {
    func didFetchUniversities(_ universities: [University]) {
        state = .loaded(data: universities)
    }

    func didFailToFetchUniversities(with error: Error) {
        state = .error(error: .decodingError)
    }
}

