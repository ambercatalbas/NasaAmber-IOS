//
//  MainTabBarController.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .red
        let curiosityViewController = createCuriosityViewController()
        let opportunityViewController = createOpportunityViewController()
        let spiritViewController = createSpiritViewController()
        viewControllers = [curiosityViewController, opportunityViewController, spiritViewController]
        
    }
    
    private func createCuriosityViewController() -> UINavigationController {
        let router = CuriosityRouter()
        let viewModel = CuriosityViewModel(router: router)
        let viewController = CuriosityViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
//        navigationController.tabBarItem.image = .icHome
        router.viewController = viewController
        return navigationController
    }
    
    private func createOpportunityViewController() -> UINavigationController {

    }
    
    private func createSpiritViewController() -> UINavigationController {
        
    }
}
