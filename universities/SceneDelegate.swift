//
//  SceneDelegate.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import UIKit
import ListingScreen
import Common
import DetailsScreen

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var listingViewController: ListingViewController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        listingViewController = ListingRouter.createModule(navigationCompletionHandler: { [weak self] navigation in
            self?.handle(navigation: navigation)
        })
        if let listingViewController = listingViewController {
            let navigationController = UINavigationController(rootViewController: listingViewController)
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    private func handle(navigation: Navigation) {
        switch navigation {
        case .details(let university):
            showDetails(university: university)
        default:
            listingViewController?.refreshData()
        }
    }
    
    private func showDetails(university: University){
        let detailsVC = DetailsRouter.createModule(with: university, navigationCompletionHandler: { [weak self] navigation in
            self?.handle(navigation: navigation)
        })
        listingViewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
