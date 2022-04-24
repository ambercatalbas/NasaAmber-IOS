//
//  IntroCell.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 22.04.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

public class IntroCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    private let bottomContainerView = UIView()
    private let textStackView = UIStackViewBuilder()
        .spacing(10)
        .axis(.vertical)
        .build()
    private let titleLabel = UILabelBuilder()
        .font(.font(.josefinSansBold, size: .custom(size: 17)))
        .textAlignment(.center)
        .textColor(.appCinder)
        .adjustsFontSizeToFitWidth(true)
        .build()
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.josefinSansSemibold, size: .custom(size: 15)))
        .textAlignment(.center)
        .numberOfLines(0)
        .textColor(.appRaven)
        .build()
    
    weak var viewModel: IntroCellProtocol?
    
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
extension IntroCell {
    private func addSubViews() {
        addImageView()
        addBottomContainerView()
        addTextStackView()
        addTitleLabel()
        addDescriptionLabel()
    }
    
    private func addImageView() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50))
        imageView.centerYToSuperview()
        imageView.aspectRatio(1)
    }
    
    private func addBottomContainerView() {
        contentView.addSubview(bottomContainerView)
        bottomContainerView.topToBottom(of: imageView)
        bottomContainerView.edgesToSuperview(excluding: .top)
    }
    private func addTextStackView() {
        bottomContainerView.addSubview(textStackView)
        textStackView.centerYToSuperview()
        textStackView.leadingToSuperview().constant = 50
        textStackView.trailingToSuperview().constant = -50
    }
    
    private func addTitleLabel() {
        textStackView.addArrangedSubview(titleLabel)
    }
    
    private func addDescriptionLabel() {
        textStackView.addArrangedSubview(descriptionLabel)
    }
}
// MARK: - Configure and Localize
extension IntroCell {
    
    private func configureContents() {
        contentView.backgroundColor = .appWhite
    }
    
    public func set(viewModel: IntroCellProtocol) {
        self.viewModel = viewModel
        self.imageView.image = viewModel.image
        self.titleLabel.text = viewModel.titleText
        self.descriptionLabel.text = viewModel.descriptionText
    }
    
}
