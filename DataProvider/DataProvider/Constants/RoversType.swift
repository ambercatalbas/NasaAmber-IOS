//
//  Cameras.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 21.04.2022.
//

public enum RoversType: String {
    
    case curiosity
    case opportunity
    case spirit
        
    public func cameras() -> [String] {
        switch self {
        case .curiosity:
            let cameras = ["fhaz", "rhaz", "mast", "chemcam", "mahli", "mardi", "navcam"]
            return cameras
        case .opportunity:
            let cameras = ["fhaz", "rhaz", "navcam", "pancam", "minites"]
            return cameras
        case .spirit:
            let cameras = ["fhaz", "rhaz", "navcam", "pancam", "minites"]
            return cameras
        }
    }
}
