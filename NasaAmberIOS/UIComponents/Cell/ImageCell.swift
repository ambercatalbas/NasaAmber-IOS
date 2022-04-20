//
//  ImageCell.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import UIKit

public class ImageCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: ImageCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: ImageCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
