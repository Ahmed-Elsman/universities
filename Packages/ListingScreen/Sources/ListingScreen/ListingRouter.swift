//
//  ListingRouter.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import UIKit
import DAL
import Common


public class ListingRouter {
    weak var viewController: UIViewController?
    var navigationCompletionHandler: NavigationCompletionHandler?

    func navigateToDetails(with university: University) {
        navigationCompletionHandler?(.details(university))
    }

    
    public static func createModule(navigationCompletionHandler: @escaping NavigationCompletionHandler) -> ListingViewController {
        let view = ListingViewController()
        let repository = UniversityRepositoryImpl(networkManager: NetworkManager())
        let interactor = ListingInteractor(repository: repository)
        let router = ListingRouter()
        router.navigationCompletionHandler = navigationCompletionHandler
        let presenter = ListingPresenter(interactor: interactor, router: router)

        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
