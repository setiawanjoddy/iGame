//
//  GameData.swift
//  iGame
//
//  Created by Setiawan Joddy on 22/09/21.
//

import Foundation

struct GameData: Codable {
    let results: [Results]
}

struct Results: Codable {
    let id: Int
    let name: String
    let released: String
    let background_image: String
    let rating: Double    
}
