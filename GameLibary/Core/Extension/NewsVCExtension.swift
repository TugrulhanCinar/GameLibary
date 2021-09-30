//
//  NewsVCExtension.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 30.09.2021.
//

import Foundation
import UIKit



extension NewsVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
        if indexPath.row > self.newsList.count {
            return UITableViewCell()
        }
        guard let data = self.newsList[indexPath.row] else { return  UITableViewCell()}
        cell.selectionStyle = .none

        cell.configure(title: data.title ?? "" , imageUrl: data.thumbnail ?? "")
        
                                
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.newsList.count > indexPath.row   {
            guard let news = self.newsList[indexPath.row] else { return }
            goNewsDetail(news: news)
            return
        }
    }
    
     

    
    
    
}
