//
//  AppRouter.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import Foundation
import UIKit

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = MainTabBarRoute
    
    static let shared = AppRouter()
    
    func startApp() {
            placeOnWindowMainTabBar()
    }
    
    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil

    }
    
}
