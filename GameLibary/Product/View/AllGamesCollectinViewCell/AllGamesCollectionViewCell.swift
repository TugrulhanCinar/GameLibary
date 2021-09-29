//
//  AllGamesCollectionViewCell.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 29.09.2021.
//

import UIKit
import AlamofireImage

class AllGamesCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!


    
    static let identifier = "AllGamesCollectionViewCell"

    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    

  
    
    func configure(title: String, imageUrl: String?){
        titleLabel.text = title
        guard let url = URL(string: imageUrl ?? "") else {
            image.image = UIImage(named: ImageConstant.questionMark)
            return
        }
        image.af.setImage(withURL: url)
    }
   
}
