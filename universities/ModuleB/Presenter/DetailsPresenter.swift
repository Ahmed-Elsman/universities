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
    weak var view: DetailsView?
    
    private let university: University
    
    init(interactor: DetailsInteractorInput, router: DetailsRouter, university: University) {
        self.interactor = interactor
        self.router = router
        self.university = university
    }
    
    func viewDidLoad() {
        view?.showUniversityDetails(university)
    }
    
    func didTapBack() {
        router.navigateBack()
    }
}

