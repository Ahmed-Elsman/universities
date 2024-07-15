//
//  DetailsPresenter.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation
import DAL
import Common

protocol DetailsView: AnyObject {
    func showUniversityDetails(_ university: University)
}

class DetailsPresenter {
    private let router: DetailsRouter
    weak var view: DetailsView?

    private let university: University

    init(router: DetailsRouter, university: University) {
        self.router = router
        self.university = university
    }

    func viewDidLoad() {
        view?.showUniversityDetails(university)
    }

    func refreshListingData() {
        router.navigateBack()
    }
}
