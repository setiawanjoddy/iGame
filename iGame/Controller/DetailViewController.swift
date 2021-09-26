//
//  DetailViewController.swift
//  iGame
//
//  Created by Setiawan Joddy on 26/09/21.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var gamesDetailImageView: UIImageView!
    @IBOutlet weak var gamesDetailTitleLabel: UILabel!
    @IBOutlet weak var gamesRDDetailLabel: UILabel!
    @IBOutlet weak var gamesRatingDetailLabel: UILabel!
    @IBOutlet weak var gamesDescriptionLabel: UILabel!
    
    var id: Int = 0
    var details = [DetailData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startParse()
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func startParse() {
        parseDetail { data in
            self.details = data
        }
    }
    
    func parseDetail(complete: @escaping ([DetailData]) -> Void ){
        let url = URL(string: "https://api.rawg.io/api/games/"+String(id)+"?key="+apiDetails.apiKey)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            
            guard let safeData = data else { return }
            do {
                let result = try JSONDecoder().decode(DetailData.self, from: safeData)
                DispatchQueue.main.async {
                    self.gamesDetailTitleLabel.text = result.name
                    self.gamesDetailImageView.sd_setImage(with: URL(string: result.background_image), placeholderImage: UIImage(named: "placeholder"))
                    self.gamesRDDetailLabel.text = "Release Date: \(result.released)"
                    self.gamesRatingDetailLabel.text = "⭐️ \(String(result.rating))"
                    self.gamesDescriptionLabel.text = result.description
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
}
