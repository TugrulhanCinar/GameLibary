//
//  ImageDetailVC.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 1.10.2021.
//

import UIKit

class ImageDetailVC: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var detailImageView: UIImageView!
    var imageUrl: URL?
    @IBOutlet weak var viewThis: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = imageUrl else { return  }
        
        detailImageView.af.setImage(withURL: url)
   
        scrollView.delegate = self
        
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0

    }
    

    @IBAction func closeButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return viewThis
    }
}
