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
        //tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confView()
        confSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.requestRankedUsers {
            
            DispatchQueue.main.async {
                
                self.rankedTableView.reloadData()
            }
        }
    }
    
    private func confView(){
        
        self.view.backgroundColor = .systemBackground
    }
    
    private func confSubviews(){
        
        self.view.addSubview(rankedTableView)
        
        let safe = self.view.safeAreaLayoutGuide
        
        rankedTableView.constraints(top: safe.topAnchor, bottom: safe.bottomAnchor, leading: safe.leadingAnchor, trailing: safe.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
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
