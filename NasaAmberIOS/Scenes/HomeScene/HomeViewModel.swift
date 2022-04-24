//
//  HomeViewModel.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 19.04.2022.
//

import Foundation

protocol HomeViewDataSource {
    var roverCameras: [String] { get set }
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> ImageCellProtocol
}

protocol HomeViewEventSource {
    var didSuccessFetchRecipes: VoidClosure? { get set }

}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func showFilterScene(items: [String], delegate: FilterViewControllerProtocol)
    func fetchFilter(filter: String)
    func fetchMorePages()
    func showDetailScene(photo: Photo)

}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {

    var roverCameras: [String]
    var listType: RoversType
    var title: String
    var didSuccessFetchRecipes: VoidClosure?
    var isRequestEnabled = false
    var isPagingEnabled = false
    var page = 1
    var filter: String = ""
    
    func fetchMorePages() {
       fetchPhotosListingType()
    }
    
    func fetchFilter(filter: String) {
        self.filter = filter
        page = 1
        cellItems.removeAll()
        fetchPhotosListingType()
    }

    func showFilterScene(items: [String], delegate: FilterViewControllerProtocol) {
        router.presentFilter(items: items, delegate: delegate)
    }
    
    func showDetailScene(photo: Photo) {
        router.presentDetail(photo: photo)
    }
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> ImageCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private var cellItems: [ImageCellProtocol] = []
    
    init(rover: RoversType, router: HomeRouter) {
        self.listType = rover
        switch rover {
        case .curiosity:
            self.roverCameras = RoversType.curiosity.cameras()
            self.title = L10n.CuriosityController.title
        case .opportunity:
            self.roverCameras = RoversType.opportunity.cameras()
            self.title = L10n.OpportunityController.title
        case .spirit:
            self.roverCameras = RoversType.spirit.cameras()
            self.title = L10n.SpiritController.title

        }
        super.init(router: router)
    }
    
}

// MARK: - Network
// swiftlint:disable line_length
extension HomeViewModel {
 
    func fetchPhotosListingType() {
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        dataProvider.request(for: GetPhotosRequest(page: page, filter: filter, listType: listType)) { [weak self] (result) in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                let cellItems = response.photos.map({ ImageCellModel(photo: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.photos.count > 24
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                if self.page == 1 { self.showWarningToast?("\(error.localizedDescription) Lütfen ekranı yukarıdan aşağıya kaydırarak yenileyiniz.") }
            }
        }
    }
}

