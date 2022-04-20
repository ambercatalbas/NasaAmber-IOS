//
//  ImageCellModel.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import Foundation

public protocol ImageCellDataSource: AnyObject {
    
}

public protocol ImageCellEventSource: AnyObject {
    
}

public protocol ImageCellProtocol: ImageCellDataSource, ImageCellEventSource {
    
}

public final class ImageCellModel: ImageCellProtocol {
    
}
