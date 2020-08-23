//
//  SessionData.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

struct SessionData: Codable {
    let status: Int
    let data: SessionDataId
}

struct SessionDataId: Codable {
    let session: String
}
