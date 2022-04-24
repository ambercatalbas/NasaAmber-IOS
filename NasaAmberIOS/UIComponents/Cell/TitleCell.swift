//
//  TitleCell.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 20.04.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

public class TitleCell: UITableViewCell, ReusableView {
    
    private var titleLabel = UILabelBuilder()
        .font(.font(.josefinSansSemibold, size: .custom(size: 15)))
        .numberOfLines(1)
        .build()
    weak var viewModel: TitleCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        addSubview(titleLabel)
        titleLabel.leftToSuperview().constant = 20
        titleLabel.rightToSuperview().constant = -20
        titleLabel.topToSuperview().constant = 5
        titleLabel.bottomToSuperview().constant = -5
    }
    
    public func set(viewModel: TitleCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
    }
    
}
