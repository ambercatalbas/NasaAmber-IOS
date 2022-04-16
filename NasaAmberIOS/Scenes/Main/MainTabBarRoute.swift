//
//  MainTabBarRoute.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import UIKit

protocol MainTabBarRoute {
    func placeOnWindowMainTabBar()
}

extension MainTabBarRoute where Self: RouterProtocol {
    
    func placeOnWindowMainTabBar() {
        let mainTabBarController = MainTabBarController()
        let transition = PlaceOnWindowTransition()
        
        open(mainTabBarController, transition: transition)
    }
}
