//
//  CuriosityViewModel.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 19.04.2022.
//

import Foundation

protocol CuriosityViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> ImageCellProtocol
}

protocol CuriosityViewEventSource {}

protocol CuriosityViewProtocol: CuriosityViewDataSource, CuriosityViewEventSource {}

final class CuriosityViewModel: BaseViewModel<CuriosityRouter>, CuriosityViewProtocol {
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> ImageCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [ImageCellProtocol] = []
    
}
