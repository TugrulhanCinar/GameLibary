//
//  GameCategoriesVCExtension.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 30.09.2021.
//

import Foundation
import  UIKit


extension GameCategoriesVC: UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GameCategoryEnum.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          
            return GameCategoryEnum.allCases[row].rawValue
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedItem = GameCategoryEnum.allCases[row]
    }
 
    
}


extension GameCategoriesVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gameList.count
      //  return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameCategoriesTableViewCell.identifier, for: indexPath) as? GameCategoriesTableViewCell else {
            return UITableViewCell()
        }
        
        if gameList.count >  indexPath.row {
            cell.configure(title: gameList[indexPath.row].title ?? "", imageUrl: gameList[indexPath.row].thumbnail ?? "" )
        }
        
       
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if gameList.count >  indexPath.row   {
            self.goDetail(data: gameList[indexPath.row])
        }
     
    }
    
    
}
