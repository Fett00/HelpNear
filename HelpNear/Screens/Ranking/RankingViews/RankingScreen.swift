//
//  RankingScreen.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation
import UIKit

final class RankingScreen: UIViewController{
    
    var viewModel: RankingViewModelProtocol!
    
    private lazy var rankedTableView: UITableView = {
       
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RankingTableCell.self)
        
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confView()
        confSubviews()
    }
    
    private func confView(){
        
        self.view.backgroundColor = .systemBackground
    }
    
    private func confSubviews(){
        
    }
}

extension RankingScreen: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableCell.reuseID, for: indexPath) as? RankingTableCell else { return UITableViewCell() }
        
        cell.render(with: self.viewModel.data[indexPath.row])
        
        return cell
    }
}

extension RankingScreen: UITableViewDelegate{
    
}
