//
//  ReusableView.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 16.04.2022.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}
