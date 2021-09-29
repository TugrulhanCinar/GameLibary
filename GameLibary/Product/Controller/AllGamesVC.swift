//
//  AllGamesVC.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 29.09.2021.
//

import UIKit

class AllGamesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var gameList = [GameModel](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    private var gameDetail: GameModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AllGamesCollectionViewCell.nib(), forCellWithReuseIdentifier: AllGamesCollectionViewCell.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        getData()
        
      
    }
    
    func getData() {
        let service = Service()
                service.getAllGameData()
                service.completionHandler { [weak self] (games, status, message) in
                    if status {
                        guard let self = self else {return}
                        guard let _games = games else {return}
                        self.gameList = _games
                    }
                }
    }
    
    
    func goDetail(data: GameModel){
        gameDetail = data
        performSegue(withIdentifier: SegueConstant.allGamesTodetailConstant.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueConstant.allGamesTodetailConstant.rawValue {
            guard let detailVC = segue.destination as? GameDetailVC else { return }
            detailVC.gameModel = gameDetail
        }
    }
                
}
