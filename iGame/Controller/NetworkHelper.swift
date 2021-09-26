//
//  NetworkHelper.swift
//  iGame
//
//  Created by Setiawan Joddy on 22/09/21.
//

import Foundation

struct NetworkHelper {
    
    func parse(complete: @escaping ([Results]) -> Void ){
        let url = URL(string: "https://api.rawg.io/api/games?key="+apiDetails.apiKey)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            
            guard let safeData = data else { return }
            do {
                let result = try JSONDecoder().decode(GameData.self, from: safeData)
                DispatchQueue.main.async {
                    complete(result.results)
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
