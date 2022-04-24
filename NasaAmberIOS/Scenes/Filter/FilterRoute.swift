//
//  FilterRoute.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 20.04.2022.
//

protocol FilterRoute {
    func presentFilter(items: [String], delegate: FilterViewControllerProtocol)
}

extension FilterRoute where Self: RouterProtocol {
    
    func presentFilter(items: [String], delegate: FilterViewControllerProtocol) {
        let router = FilterRouter()
        let viewModel = FilterViewModel(items: items, router: router)
        let viewController = FilterViewController(viewModel: viewModel)
        viewController.delegate = delegate
        
        let transition = ModalTransition()
        transition.modalPresentationStyle = .overCurrentContext
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
