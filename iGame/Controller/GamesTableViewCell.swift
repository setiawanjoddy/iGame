//
//  GamesTableViewCell.swift
//  iGame
//
//  Created by Setiawan Joddy on 22/09/21.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var gamesImageView: UIImageView!
    @IBOutlet weak var gamesTitleLabel: UILabel!
    @IBOutlet weak var gamesRatingLabel: UILabel!
    @IBOutlet weak var gamesReleaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.layer.cornerRadius = 20
        bgView.layer.shadowOffset = CGSize(width: 2, height: 2)
        bgView.layer.shadowRadius = 4
        bgView.layer.shadowOpacity = 0.6
        
        gamesImageView.roundCorners([.topLeft, .topRight], radius: 20)
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIImageView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
