//
//  DetailVC.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 29.09.2021.
//

import UIKit

class GameDetailVC: UIViewController {

 //   @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var thumbNailImage: UIImageView!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var osLabel: UILabel!
    @IBOutlet weak var processorLabel: UILabel!
    @IBOutlet weak var memoryLabel: UILabel!
    @IBOutlet weak var graphicsLabel: UILabel!
    @IBOutlet weak var storageLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var imagesTitleLabel: UILabel!
    @IBOutlet weak var minimumSystemReqirementsView: UIStackView!
    @IBOutlet weak var minimumSystemReqirementsTitle: UILabel!
    var gameModel : GameModel?
    var gameDetail : GameDetailModel?{
        didSet{
            DispatchQueue.main.async {
                self.imagesCollectionView.reloadData()
                self.setData()
            }
        }
    }
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesCollectionView.isHidden = true
        navigationItem.title = gameModel?.title ?? " "
        getData()


        
    }
    

    @IBAction func buyButtonClicked(_ sender: UIButton) {
        if let url = URL(string: gameDetail?.gameURL ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func visitGamePageButtonClicked(_ sender: UIButton) {
        if let url = URL(string: gameDetail?.profileURL ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
 
    
    func getData() {
       
        guard let id = gameModel?.id else { return }
        let service = Service()
        service.getGameDetail(id: id)
        service.completionHandlerGameDetail{
            [weak self] (gameDetail, status, message) in
            if status {
                guard let self = self else {return}
                guard let _games = gameDetail else {return}
                self.gameDetail = _games
            }
        }
    }
    
    func setData(){
        
        guard let detailData = gameDetail else { return  }
     //   gameTitleLabel.text = detailData.title  ?? ""
        guard let url = URL(string: detailData.thumbnail ?? "") else {
            thumbNailImage.image = UIImage(named: ImageConstant.questionMark)
            return
        }
        thumbNailImage.af.setImage(withURL: url)
        shortDescriptionLabel.text = detailData.shortDescription  ?? ""
        descriptionLabel.text = detailData.gameDetailDescription  ?? ""
        developerLabel.text = detailData.developer ?? ""
        platformLabel.text = detailData.platform ?? ""
        genreLabel.text = detailData.genre ?? ""
        publisherLabel.text = detailData.publisher ?? ""
        
        if detailData.minimumSystemRequirements != nil {
        osLabel.text =  detailData.minimumSystemRequirements?.os ?? ""
        processorLabel.text = detailData.minimumSystemRequirements?.processor ?? ""
        memoryLabel.text = detailData.minimumSystemRequirements?.memory ?? ""
        graphicsLabel.text = detailData.minimumSystemRequirements?.graphics ?? ""
        storageLabel.text = detailData.minimumSystemRequirements?.storage ?? ""
        } else {
            minimumSystemReqirementsView.isHidden = true
            minimumSystemReqirementsTitle.isHidden = true
            
        }
        guard let screnShots = detailData.screenshots  else { return }
        if !screnShots.isEmpty {
            imagesCollectionView.isHidden = false
            imagesTitleLabel.isHidden = false
            imagesCollectionView.register(GameDetailCollectionViewCell.nib(), forCellWithReuseIdentifier: GameDetailCollectionViewCell.identifier)
            imagesCollectionView.delegate = self
            imagesCollectionView.dataSource = self
            
        }
        
        
       
        
    }
    
}
