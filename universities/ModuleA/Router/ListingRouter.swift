//
//  ListingRouter.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import UIKit

class ListingRouter {
    weak var viewController: UIViewController?

    func navigateToDetails(with university: University, listingPresenter: ListingPresenter) {
        let detailsVC = DetailsRouter.createModule(with: university, listingPresenter: listingPresenter)
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }

    static func createModule() -> UIViewController {
        let view = ListingViewController()
        let networkManager = NetworkManager()
        let interactor = ListingInteractor(networkManager: networkManager)
        let router = ListingRouter()
        let presenter = ListingPresenter(interactor: interactor, router: router)

        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        router.viewController = view

        return view
    }
}

