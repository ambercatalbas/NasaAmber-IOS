//
//  ImageCell.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import UIKit
import MobilliumBuilders

public class ImageCell: UICollectionViewCell, ReusableView {
    
    private var imageView = UIImageViewBuilder()
        .cornerRadius(4)
        .clipsToBounds(true)
        .contentMode(.scaleAspectFill)
        .image(.imgCuriosity)
        .build()
    
    weak var viewModel: ImageCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContents()
    }
    
}

// MARK: - UILayout
extension ImageCell {
    
    private func addSubViews() {
        addSubview(imageView)
        imageView.topToSuperview().constant = 5
        imageView.leftToSuperview().constant = 16
        imageView.rightToSuperview().constant = -16
        imageView.bottomToSuperview().constant = -5
        
        
    }
}

// MARK: - Configure and Set Localize
extension ImageCell {
    
    private func configureContents() {
    }
    
    public func set(viewModel: ImageCellProtocol) {
        self.viewModel = viewModel
        imageView.setImage(viewModel.photo?.imgSrc)
    }
    
}
