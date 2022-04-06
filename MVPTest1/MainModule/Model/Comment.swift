//
//  Model.swift
//  MVPTest1
//
//  Created by Vladislav Barinov on 17.03.2022.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}

