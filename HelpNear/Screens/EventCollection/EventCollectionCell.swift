//
//  EventCollectionCell.swift
//  HelpNear
//
//  Created by Садык Мусаев on 08.06.2022.
//

import Foundation
import UIKit

class EventCollectionCell: UICollectionViewCell {
    
    private let title: UILabel = {
        
        let label = UILabel()
        
        return label
    }()
    
    private let shortDescription: UILabel = {
        
        let label = UILabel()
        
        return label
    }()
    
    private let ageLimit: UIImageView = {
        
        let image = UIImageView()
        
        return image
    }()
    
    private let goToMapButton: UIButton = {
       
        let button = UIButton()
        
        return button
    }()
    
    private let acceptButton: UIButton = {
        
        let button = UIButton()
        
        return button
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
        
    }
    
    private func confSubviews(){
        
        self.addSubview(title, shortDescription, ageLimit, acceptButton)
        
    }
    
    func render(){
        
    }
}
