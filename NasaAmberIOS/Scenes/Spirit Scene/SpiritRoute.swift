//
//  SpiritRoute.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

protocol SpiritRoute {
    func presentSpirit()
}

extension SpiritRoute where Self: RouterProtocol {
    
    func presentSpirit() {
        let router = SpiritRouter()
        let viewModel = SpiritViewModel(router: router)
        let viewController = SpiritViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
