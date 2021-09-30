//
//  GameCategories.swift
//  GameLibary
//
//  Created by Tugrulhan Çınar on 30.09.2021.
//

import UIKit

class GameCategoriesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var picker: UIPickerView!
    var selectedItem: GameCategoryEnum = GameCategoryEnum.allCases[0]
    private var gameDetail: GameModel?
    var gameList = [GameModel](){
        didSet{
           
            DispatchQueue.main.async {
                print("yüklendi: ",self.gameList.count)
                self.tableView.reloadData()
            }
           
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getData()
        setPickerAndTableView()
        
       
        
    }
    
    func setPickerAndTableView() {
        picker.dataSource = self
        picker.delegate = self
        tableView.register(GameCategoriesTableViewCell.nib(), forCellReuseIdentifier: GameCategoriesTableViewCell.identifier)

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @IBAction func getGames(_ sender: UIButton) {
        getData()
        
    }

    
    func getData(){
        let service = Service()
                service.getCategoryGameData(category: selectedItem)
                service.completionCategoryInGames { [weak self] (games, status, message) in
                    if status {
                        guard let self = self else {return}
                        guard let _games = games else {return}
                        self.gameList = _games
                        print("başarılı")
                    }else{
                        print("error status: ", status)
                    }
                    
                }
        
    }
    
    
    
    func goDetail(data: GameModel){
        gameDetail = data
        performSegue(withIdentifier: SegueConstant.categoriesToDetailConstant.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //print("tgrl: ",segue.identifier)
        if segue.identifier == SegueConstant.categoriesToDetailConstant.rawValue {
            guard let detailVC = segue.destination as? GameDetailVC else { return }
            detailVC.gameModel = gameDetail
        }
    }
    
}
