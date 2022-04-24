//
//  DetailViewModel.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 22.04.2022.
//

import Foundation

protocol DetailViewDataSource {
    var photo: Photo { get set }
    func roverStatus() -> String
    func earthDate() -> String
    func landingDate() -> String
    func launchDate() -> String
}

protocol DetailViewEventSource {}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource {
    func dismissScene()
}

final class DetailViewModel: BaseViewModel<DetailRouter>, DetailViewProtocol {
    
    var photo: Photo
    
    init(photo: Photo, router: DetailRouter) {
        self.photo = photo
        super.init(router: router)
    }
    
    func dismissScene() {
        router.close()
    }
    
    func roverStatus() -> String {
        return photo.rover?.status?.capitalizingFirstLetter() ?? ""
    }

    func earthDate() -> String {
        let date = photo.earthDate ?? ""
        return DateFormatter().formattedDateFromString(date)
    }
    
    func landingDate() -> String {
        let date = photo.rover?.landingDate ?? ""
        return DateFormatter().formattedDateFromString(date)
    }
    
    func launchDate() -> String {
        let date = photo.rover?.launchDate ?? ""
        return DateFormatter().formattedDateFromString(date)
    }
}
