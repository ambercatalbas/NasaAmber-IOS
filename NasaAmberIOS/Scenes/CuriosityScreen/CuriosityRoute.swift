//
//  CuriosityRoute.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

protocol CuriosityRoute {
    func placeOnWindowCuriosity()
}

extension CuriosityRoute where Self: RouterProtocol {
    
    func placeOnWindowCuriosity() {
        let router = CuriosityRouter()
        let viewModel = CuriosityViewModel(router: router)
        let viewController = CuriosityViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
