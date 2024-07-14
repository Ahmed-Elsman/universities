//
//  DetailsRouter.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import UIKit

class DetailsRouter {
    weak var viewController: UIViewController?
    
    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    static func createModule(with university: University) -> UIViewController {
        let view = DetailsViewController()
        let interactor = DetailsInteractor()
        let router = DetailsRouter()
        let presenter = DetailsPresenter(interactor: interactor, router: router, university: university)
        
        view.presenter = presenter
        presenter.view = view
        router.viewController = view
        
        return view
    }
}

