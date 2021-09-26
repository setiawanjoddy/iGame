//
//  GameData.swift
//  iGame
//
//  Created by Setiawan Joddy on 22/09/21.
//

import Foundation

struct GameData: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let id: Int
    let name: String
    let released: String
    let background_image: String
    let rating: Double    
}
