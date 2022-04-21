//
//  GetPhotosRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 20.04.2022.
//

public struct GetPhotosRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = GetPhotos
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int, filter: String, listType: RoversType) {
        switch listType {
        case .curiosity:
            path = "curiosity/photos?sol=1000&\(filter)api_key=\(Constants.apiKey)&page=\(page)"
        case .opportunity:
            path = "opportunity/photos?api_key=\(Constants.apiKey)&\(filter)sol=1&page=\(page)"
        case .spirit:
            path = "spirit/photos?api_key=\(Constants.apiKey)&\(filter)sol=1&page=\(page)"
        }
    }
    
}


