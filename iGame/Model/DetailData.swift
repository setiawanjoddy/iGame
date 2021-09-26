//
//  DetailData.swift
//  iGame
//
//  Created by Setiawan Joddy on 26/09/21.
//

import Foundation

struct DetailData: Decodable {
    let id: Int
    let slug: String
    let name: String
    let description: String
    let released: String
    let background_image: String
    let rating: Double
}
