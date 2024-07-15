//
//  DetailsRouter.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import UIKit
import Common

public class DetailsRouter {
    weak var viewController: UIViewController?
    var navigationCompletionHandler: NavigationCompletionHandler?

    func navigateBack() {
        navigationCompletionHandler?(.list)
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    public static func createModule(with university: University, navigationCompletionHandler: @escaping NavigationCompletionHandler) -> UIViewController {
        let view = DetailsViewController()
        let router = DetailsRouter()
        let presenter = DetailsPresenter(router: router, university: university)

        view.presenter = presenter
        presenter.view = view
        router.viewController = view
        router.navigationCompletionHandler = navigationCompletionHandler

        return view
    }
}
