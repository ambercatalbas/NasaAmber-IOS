//
//  SpiritViewModel.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import Foundation

protocol SpiritViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> ImageCellProtocol
}

protocol SpiritViewEventSource {}

protocol SpiritViewProtocol: SpiritViewDataSource, SpiritViewEventSource {}

final class SpiritViewModel: BaseViewModel<SpiritRouter>, SpiritViewProtocol {
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> ImageCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [ImageCellProtocol] = []
    
}
