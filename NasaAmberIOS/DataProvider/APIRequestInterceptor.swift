//
//  APIRequestInterceptor.swift
//  Fodamy
//
//  Created by AMBER ÇATALBAŞ on 10.03.2022.
//

import Alamofire

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest

        completion(.success(urlRequest))
    }
}
