//
//  OpportunityRoute.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

protocol OpportunityRoute {
    func presentOpportunity()
}

extension OpportunityRoute where Self: RouterProtocol {
    
    func presentOpportunity() {
        let router = OpportunityRouter()
        let viewModel = OpportunityViewModel(router: router)
        let viewController = OpportunityViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
