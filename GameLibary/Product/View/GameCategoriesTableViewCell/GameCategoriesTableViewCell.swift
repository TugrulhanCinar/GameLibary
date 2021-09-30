//
//  GameCategoriesTableViewCell.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 30.09.2021.
//

import UIKit

class GameCategoriesTableViewCell: UITableViewCell {

 
    @IBOutlet weak var gameCategoriesImageView: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    
    static let identifier = "GameCategoriesTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
 
    

    
    func configure(title:String,  imageUrl: String){
        
        
        
        gameTitle.text = title
        
        guard let url = URL(string: imageUrl ) else {
            gameCategoriesImageView.image = UIImage(named: ImageConstant.questionMark)
            return
        }
        gameCategoriesImageView.af.setImage(withURL: url)
    }
    
    /*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 */
    
}
