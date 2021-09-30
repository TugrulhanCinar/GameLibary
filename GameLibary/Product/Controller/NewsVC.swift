//
//  NewsCV.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 30.09.2021.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var newsList = [NewsModel?](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var newsModel: NewsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setTableView()
    }
    func setTableView()  {
        tableView.register(NewsTableViewCell.nib(), forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func getData() {
        let service = Service()
        service.getNewsData()
        service.completionHandlerNews{
            [weak self] (news, status, message) in
            if status {
                guard let self = self else { return}
                guard let _news = news else { return }
                self.newsList = _news
            }
        }
                
    }
    
    
    func goNewsDetail(news: NewsModel)  {
        newsModel = news
        performSegue(withIdentifier: SegueConstant.newsToNewsDetailConstant.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newsDetailVC = segue.destination as? NewsDetailVC else { return  }
        newsDetailVC.newsModel = newsModel
    }
    
    

}
