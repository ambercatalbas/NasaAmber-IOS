//
//  TitleCellModel.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 20.04.2022.
//

import Foundation

public protocol TitleCellDataSource: AnyObject {
    var title: String  { get set }
}

public protocol TitleCellEventSource: AnyObject {
    
}

public protocol TitleCellProtocol: TitleCellDataSource, TitleCellEventSource {
    
}

public final class TitleCellModel: TitleCellProtocol {
    public var title: String
    
    init(title: String) {
        self.title = title
    }
    
}
