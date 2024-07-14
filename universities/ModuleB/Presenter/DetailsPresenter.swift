//
//  DetailsPresenter.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation

protocol DetailsView: AnyObject {
    func showUniversityDetails(_ university: University)
}

class DetailsPresenter {
    private let interactor: DetailsInteractorInput
    private let router: DetailsRouter
    private let listingPresenter: ListingPresenter
    weak var view: DetailsView?
    
    private let university: University
    
    init(interactor: DetailsInteractorInput, router: DetailsRouter, listingPresenter: ListingPresenter, university: University) {
        self.interactor = interactor
        self.router = router
        self.listingPresenter = listingPresenter
        self.university = university
    }
    
    func viewDidLoad() {
        view?.showUniversityDetails(university)
    }
    
    func refreshListingData() {
        listingPresenter.refreshData()
        router.navigateBack()
    }
}

