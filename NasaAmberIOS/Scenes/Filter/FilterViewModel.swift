//
//  FilterViewModel.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 20.04.2022.
//

import Foundation

protocol FilterViewDataSource {
    var items: [String] { get set }
   
}

protocol FilterViewEventSource {}

protocol FilterViewProtocol: FilterViewDataSource, FilterViewEventSource {
    func dismissScene()
}

final class FilterViewModel: BaseViewModel<FilterRouter>, FilterViewProtocol {
    func dismissScene() {
        router.close()
    }
    
    var items: [String]
    
    init(items: [String], router: FilterRouter) {
        self.items = items
        super.init(router: router)
    }
    
}
