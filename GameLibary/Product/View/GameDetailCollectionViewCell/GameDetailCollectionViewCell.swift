//
//  GameDetailCollectionViewCell.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 29.09.2021.
//

import UIKit
import AlamofireImage


class GameDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    static let identifier = "GameDetailCollectionViewCell"

    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    

  
    
    func configure(imageUrl: String?){
        guard let url = URL(string: imageUrl ?? "") else {
            image.image = UIImage(named: ImageConstant.questionMark)
            return
        }
        image.af.setImage(withURL: url)
        
    }
    
    

}
