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
    private let interactor: ListingInteractorInput
    private let router: ListingRouter
    weak var view: ListingView?

    init(interactor: ListingInteractorInput, router: ListingRouter) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.fetchUniversities()
    }

    func refreshData() {
        interactor.fetchUniversities()
    }

    func didSelectUniversity(_ university: University) {
        router.navigateToDetails(with: university, listingPresenter: self)
    }
}

extension ListingPresenter: ListingInteractorOutput {
    func didFetchUniversities(_ universities: [University]) {
        view?.showUniversities(universities)
    }

    func didFailToFetchUniversities(with error: Error) {
        view?.showError(error.localizedDescription)
    }
}
