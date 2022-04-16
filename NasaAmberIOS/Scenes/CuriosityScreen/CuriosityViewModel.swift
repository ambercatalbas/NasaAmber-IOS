//
//  CuriosityViewModel.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import Foundation

protocol CuriosityViewDataSource {}

protocol CuriosityViewEventSource {}

protocol CuriosityViewProtocol: CuriosityViewDataSource, CuriosityViewEventSource {}

final class CuriosityViewModel: BaseViewModel<CuriosityRouter>, CuriosityViewProtocol {
    
}
