//
//  NewsTableViewCell.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 30.09.2021.
//

import UIKit
import AlamofireImage

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    

    static let identifier = "NewsTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
 
    

    
    func configure(title:String,  imageUrl: String){
        
  
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        
        
        self.titleLabel.text = title

        guard let url = URL(string: imageUrl ) else {
            newsImageView.image = UIImage(named: ImageConstant.questionMark)
            return
        }
        newsImageView.af.setImage(withURL: url)
        
    }
    
    
 
    
}
