//
//  RankingTableCell.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation
import UIKit

final class RankingTableCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        confCell()
        confSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func confCell(){
        
    }
    
    private func confSubviews(){
        
    }
    
    func render(with model: RankingModel){
        
        self.textLabel?.text = model.name
        self.detailTextLabel?.text = model.score
    }
}
