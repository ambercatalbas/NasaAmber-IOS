//
//  DetailRoute.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 22.04.2022.
//

protocol DetailRoute {
    func presentDetail(photo: Photo)
}

extension DetailRoute where Self: RouterProtocol {
    
    func presentDetail(photo: Photo) {
        let router = DetailRouter()
        let viewModel = DetailViewModel(photo: photo, router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        transition.modalPresentationStyle = .overCurrentContext
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
