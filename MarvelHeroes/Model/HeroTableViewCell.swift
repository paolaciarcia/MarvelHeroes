//
//  HeroTableViewCell.swift
//  MarvelHeroes
//
//  Created by Erick Borges on 02/07/21.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var storyDescription: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tintColor = .darkGray
    }
    
    func prepareCell(with hero: Hero) {
        characterName.text = hero.name
        storyDescription.text = hero.description
        characterImage.layer.cornerRadius = 5
        characterImage.layer.borderWidth = 2
        characterImage.layer.borderColor = UIColor.red.cgColor

        if let url = URL(string: hero.thumbnail.url) {
            print("ImageURL \(url)")
            characterImage.kf.setImage(with: url)
        } else {
            characterImage.image = UIImage(named: "xmark.circle")
        }
    }
}



