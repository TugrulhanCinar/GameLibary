//
//  NewsDetailVC.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 30.09.2021.
//

import UIKit
import AlamofireImage

class NewsDetailVC: UIViewController {

    
    var newsModel: NewsModel?
    
    @IBOutlet weak var newsDetailImage: UIImageView!
    @IBOutlet weak var newsContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
    
    @IBAction func goButtonclicked(_ sender: UIButton) {
    }
    
    func setData()  {
        guard let model = newsModel else { return }
        
        if let newsTitle = newsModel?.title {
            title = newsTitle
        }else{
            title = "News Detail"
        }
        
        
        if let str = model.articleContent {
            newsContent.text =  str.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        }
        
       
       
        

        guard let url = URL(string: model.mainImage ?? "") else {
            newsDetailImage.image = UIImage(named: ImageConstant.questionMark)
            return
        }
        newsDetailImage.af.setImage(withURL: url)
       
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
