//
//  ImageDetailVC.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 1.10.2021.
//

import UIKit

class ImageDetailVC: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    var imageUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = imageUrl else { return  }
        
        detailImageView.af.setImage(withURL: url)

     
    }
    


}
