//
//  OpportunityViewModel.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import Foundation

protocol OpportunityViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> ImageCellProtocol
}

protocol OpportunityViewEventSource {}

protocol OpportunityViewProtocol: OpportunityViewDataSource, OpportunityViewEventSource {}

final class OpportunityViewModel: BaseViewModel<OpportunityRouter>, OpportunityViewProtocol {
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> ImageCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [ImageCellProtocol] = []
    
}
