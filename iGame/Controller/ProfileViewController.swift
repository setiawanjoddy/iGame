//
//  ProfileViewController.swift
//  iGame
//
//  Created by Setiawan Joddy on 26/09/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSetup()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func overlaySetup() {
        overlayView.layer.cornerRadius = overlayView.frame.height / 2
        overlayView.layer.shadowOffset = .zero
        overlayView.layer.shadowColor = UIColor.black.cgColor
        overlayView.layer.shadowRadius = 10
        overlayView.layer.shadowOpacity = 0.25
    }
    
    func screenSetup() {
        overlaySetup()
        
        profileNameLabel.text = "Setiawan Joddy"
        profileEmailLabel.text = "setiawanjoddy.id@gmail.com"
        backgroundImageView.image = UIImage(named: "background")
        profileImageView.image = UIImage(named: "profile_setiawanjoddy")
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    
}
