//
//  RankingCollectionCell.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation
import UIKit

final class RankingCollectionCell: UICollectionViewCell{
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize)
        
        return label
    }()
    
    private let scoreLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        confCell()
        confSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func confCell(){
        
        self.layer.borderWidth = 0.5
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = 20
    }
    
    private func confSubviews(){
        
        self.contentView.addSubview(nameLabel, scoreLabel)
        
        nameLabel.constraints(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: scoreLabel.leadingAnchor, paddingTop: 20, paddingBottom: 20, paddingLeft: 20, paddingRight: 0, width: 0, height: 0)
        scoreLabel.constraints(top: self.topAnchor, bottom: self.bottomAnchor, leading: nil, trailing: self.trailingAnchor, paddingTop: 20, paddingBottom: 20, paddingLeft: 0, paddingRight: 20, width: 0, height: 0)
    }
    
    func render(with model: RankingModel){
        
        self.nameLabel.text = model.name
        self.scoreLabel.text = model.score
    }
}
