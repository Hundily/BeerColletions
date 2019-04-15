//
//  Beer.swift
//  Beer
//
//  Created by Hundily Cerqueira Silva on 09/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import UIKit

struct Beer: Codable {
    var id = 0
    var name: String?
    var imageUrl: String?
    var abv: Double?
    var tagline: String?
    var desc: String?
    
    private enum CodingKeys: String, CodingKey {
        case id         = "id"
        case name       = "name"
        case imageUrl   = "image_url"
        case abv        = "abv"
        case tagline    = "tagline"
        case desc       = "description"
    }
}
