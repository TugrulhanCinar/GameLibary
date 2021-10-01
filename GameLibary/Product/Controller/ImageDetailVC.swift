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
    
    @IBOutlet weak var scroolView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = imageUrl else { return  }
        
        detailImageView.af.setImage(withURL: url)
        scroolView.minimumZoomScale = 1.0
        scroolView.maximumZoomScale = 6.0
     
    }
    

    @IBAction func closeButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
           
            return detailImageView
        }
    
}
