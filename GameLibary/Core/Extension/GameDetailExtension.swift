//
//  GameDetailExtension.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 29.09.2021.
//

import Foundation
import UIKit

extension GameDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let screenshotsList = self.gameDetail?.screenshots else { return 0 }
        
        return screenshotsList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameDetailCollectionViewCell.identifier, for: indexPath) as? GameDetailCollectionViewCell else { return UICollectionViewCell() }
        guard let screenshotsList = self.gameDetail?.screenshots else { return UICollectionViewCell() }

        
        if screenshotsList.count >  indexPath.row  {
            cell.configure(imageUrl: screenshotsList[indexPath.row].image)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       //return CGSize(width: 300, height: 246)
        return CGSize(width: 200, height: 150)

    }
}
