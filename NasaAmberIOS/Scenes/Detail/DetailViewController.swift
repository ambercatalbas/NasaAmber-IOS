//
//  DetailViewController.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 22.04.2022.
//

import UIKit
import MobilliumBuilders

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    private var contentView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .cornerRadius(8)
        .build()
    private var imageView = UIImageViewBuilder()
        .clipsToBounds(true)
        .masksToBounds(true)
        .contentMode(.scaleAspectFill)
        .image(.imgCuriosity)
        .cornerRadius(8)
        .build()
    private var mainStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(1)
        .distribution(.fillProportionally)
        .build()
    private var earthDateLabel = CustomLabel(fontSize: 15)
    private var roverNameLabel = CustomLabel(fontSize: 15)
    private var cameraNameLabel = CustomLabel(fontSize: 15)
    private var roverStatusLabel = CustomLabel(fontSize: 15)
    private var landingDateLabel = CustomLabel(fontSize: 15)
    private var launchDateLabel = CustomLabel(fontSize: 15)
    private var labelStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(1)
        .distribution(.fillEqually)
        .build()
    private var titleEarthDateLabel = CustomLabel()
    private var titleRoverNameLabel = CustomLabel()
    private var titleCameraNameLabel = CustomLabel()
    private var titleRoverStatusLabel = CustomLabel()
    private var titleLandingDateLabel = CustomLabel()
    private var titleLaunchDateLabel = CustomLabel()
    private var titleLabelStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(1)
        .distribution(.fillEqually)
        .build()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addSubViews()
        setupGesture()
    }
    
}

// MARK: - UILayout
extension DetailViewController {
    
    private func addSubViews() {
        addcontentView()
        addImageView()
        addMainStackView()
        addLabelStacView()
        addTitleLabelStacView()
    }
    
    private func addcontentView() {
        view.addSubview(contentView)
        contentView.leftToSuperview().constant = 8
        contentView.rightToSuperview().constant = -8
        contentView.topToSuperview(usingSafeArea: true)
        
    }
    
    private func addImageView() {
        contentView.addSubview(imageView)
        imageView.topToSuperview()
        imageView.leftToSuperview()
        imageView.rightToSuperview()
        
    }
    
    private func addMainStackView()  {
        contentView.addSubview(mainStackView)
        mainStackView.topToBottom(of: imageView).constant = 5
        mainStackView.leftToSuperview().constant = 5
        mainStackView.rightToSuperview().constant = -5
        mainStackView.bottomToSuperview().constant = -5
        mainStackView.addArrangedSubview(titleLabelStackView)
        mainStackView.addArrangedSubview(labelStackView)
        
    }
    private func addLabelStacView() {
        
        
        labelStackView.addArrangedSubview(earthDateLabel)
        labelStackView.addArrangedSubview(roverNameLabel)
        labelStackView.addArrangedSubview(cameraNameLabel)
        labelStackView.addArrangedSubview(roverStatusLabel)
        labelStackView.addArrangedSubview(launchDateLabel)
        labelStackView.addArrangedSubview(landingDateLabel)
        earthDateLabel.height(30)
        roverNameLabel.height(30)
        cameraNameLabel.height(30)
        roverStatusLabel.height(30)
        launchDateLabel.height(30)
        landingDateLabel.height(30)
    }
    
    private func addTitleLabelStacView() {
        titleLabelStackView.addArrangedSubview(titleEarthDateLabel)
        titleLabelStackView.addArrangedSubview(titleRoverNameLabel)
        titleLabelStackView.addArrangedSubview(titleCameraNameLabel)
        titleLabelStackView.addArrangedSubview(titleRoverStatusLabel)
        titleLabelStackView.addArrangedSubview(titleLaunchDateLabel)
        titleLabelStackView.addArrangedSubview(titleLandingDateLabel)
        titleEarthDateLabel.height(30)
        titleRoverNameLabel.height(30)
        titleCameraNameLabel.height(30)
        titleRoverStatusLabel.height(30)
        titleLaunchDateLabel.height(30)
        titleLandingDateLabel.height(30)
    }
}

// MARK: - Configure
extension DetailViewController {
    
    private func configureContents() {
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.8)
        let photo = viewModel.photo
        imageView.setImage(photo.imgSrc)
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        earthDateLabel.text = viewModel.earthDate()
        roverNameLabel.text = photo.rover?.name
        cameraNameLabel.text = photo.camera?.fullName
        roverStatusLabel.text = viewModel.roverStatus()
        launchDateLabel.text = viewModel.launchDate()
        landingDateLabel.text = viewModel.landingDate()
        
        titleEarthDateLabel.text = L10n.DetailController.earthDate
        titleRoverNameLabel.text = L10n.DetailController.rover
        titleCameraNameLabel.text = L10n.DetailController.camera
        titleRoverStatusLabel.text = L10n.DetailController.roverStatus
        titleLaunchDateLabel.text = L10n.DetailController.launchDate
        titleLandingDateLabel.text = L10n.DetailController.landingDate
    }
}

// MARK: - Actions
extension DetailViewController {
    
    @objc
    private func dismisScene() {
        viewModel.dismissScene()
    }
}

// MARK: - UITapGestureRecognizer
extension DetailViewController: UIGestureRecognizerDelegate {
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismisScene))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
}
