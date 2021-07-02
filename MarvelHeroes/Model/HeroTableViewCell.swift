//
//  HeroTableViewCell.swift
//  MarvelHeroes
//
//  Created by Erick Borges on 02/07/21.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var storyDescription: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        self.tintColor = .darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
