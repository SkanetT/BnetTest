//
//  URLRequest.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

extension URLRequest {
    mutating func preparationRequestForAPI(method: HttpMethods, parametres: Dictionary<String, String>) {
        self.httpMethod = method.rawValue
        self.allHTTPHeaderFields = ["token" : Constants.token, "Content-Type" : "application/x-www-form-urlencoded" ]
        self.httpBody = parametres.makeDataForRequest()
    }
}





