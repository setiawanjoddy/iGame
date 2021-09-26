//
//  ViewController.swift
//  iGame
//
//  Created by Setiawan Joddy on 13/09/21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var gamesTableView: UITableView!
    
    let parser = NetworkHelper()
    var games = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "iGame"
        
        loadData()
        
        gamesTableView.delegate = self
        gamesTableView.dataSource = self
        gamesTableView.register(UINib(nibName: "GamesTableViewCell", bundle: nil), forCellReuseIdentifier: "GamesCell")
        
        self.gamesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        parser.parse { data in
            self.games = data
            self.gamesTableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GamesCell", for: indexPath) as? GamesTableViewCell {
            cell.gamesTitleLabel.text = games[indexPath.row].name
            cell.gamesReleaseDateLabel.text = "Release date: \(games[indexPath.row].released)"
            cell.gamesRatingLabel.text = "⭐️ \(games[indexPath.row].rating)"
            cell.gamesImageView.sd_setImage(with: URL(string: games[indexPath.row].background_image), placeholderImage: UIImage(named: "placeholder"))
            
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    
}
