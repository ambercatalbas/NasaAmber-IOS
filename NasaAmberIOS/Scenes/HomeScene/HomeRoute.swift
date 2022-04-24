//
//  HomeRoute.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

protocol HomeRoute {
    func placeOnWindowCuriosity(rover: RoversType)
}

extension HomeRoute where Self: RouterProtocol {
    
    func placeOnWindowCuriosity(rover: RoversType) {
        let router = HomeRouter()
        let viewModel = HomeViewModel(rover: rover, router: router)
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
