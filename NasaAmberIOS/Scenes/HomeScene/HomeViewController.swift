//
//  HomeViewController.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 19.04.2022.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCell.self)
        return collectionView
    }()
    private let refreshControl = UIRefreshControl()
    private var loadingFooterView: ActivityIndicatorFooterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.fetchPhotosListingType()
        subscribeViewModelEvents()
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchRecipes = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
 
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
   
}

// MARK: - Configure and Set Localize
extension HomeViewController {
    
    private func configureContents() {
        view.backgroundColor = .systemTeal
        navigationItem.title = viewModel.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .hamburgerIcon, style: .done, target: self, action: #selector(filterButtonTapped))
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
}

// MARK: - Actions
extension HomeViewController {
    
    @objc
    private func filterButtonTapped() {
        let items = viewModel.roverCameras
        viewModel.showFilterScene(items: items, delegate: self)
    }
}

// MARK: - UIScrollViewDelegate
extension HomeViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height && viewModel.isPagingEnabled && viewModel.isRequestEnabled {
            viewModel.fetchMorePages()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let photo = viewModel.cellItemAt(indexPath: indexPath).photo else { return }
        viewModel.showDetailScene(photo: photo)
    }
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
    
}
// swiftlint:enable line_length

// MARK: - FilterViewControllerProtocol
extension HomeViewController: FilterViewControllerProtocol {
    func selectedItem(item: String) {
        viewModel.fetchFilter(filter: "camera=\(item)&")
    }
   
}
