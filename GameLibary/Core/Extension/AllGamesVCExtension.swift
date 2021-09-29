//
//  AllGamesExtension.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 29.09.2021.
//

import Foundation
import UIKit




extension AllGamesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return self.gameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllGamesCollectionViewCell.identifier, for: indexPath) as? AllGamesCollectionViewCell else {
            return UICollectionViewCell()
        }
        if self.gameList.count > indexPath.row  {
                        
            let game = gameList[indexPath.row]
            cell.configure(title: game.title ?? " ", imageUrl: game.thumbnail)            
            
        }else {
            return UICollectionViewCell()
        }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       //return CGSize(width: 300, height: 246)
        return CGSize(width: 200, height: 150)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if gameList.count >  indexPath.row {
            //self.allGamesCollectionView(super.self, didSelectGame: gameList[indexPath.row])
            self.goDetail(data: gameList[indexPath.row])
            
        }
    }
    
   
    
}

