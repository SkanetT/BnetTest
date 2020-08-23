//
//  AdditionData.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

struct AdditionData: Codable {
    let status: Int
    let data: AdditionDataId
}

struct AdditionDataId: Codable {
    let id: String
}
