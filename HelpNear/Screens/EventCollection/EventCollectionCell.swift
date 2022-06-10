//
//  EventCollectionCell.swift
//  HelpNear
//
//  Created by Садык Мусаев on 08.06.2022.
//

import Foundation
import UIKit

class EventCollectionCell: UICollectionViewCell {
    
    //Название задания
    private let title: UILabel = {
        
        let label = UILabel()
        
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize)
        
        return label
    }()
    
    //Краткое описание
    private let shortDescription: UILabel = {
        
        let label = UILabel()
        
        label.numberOfLines = 2
        
        return label
    }()
    
    //Требования к кандидату
    private let requirements: UIImageView = {
        
        let image = UIImageView()
        
        return image
    }()
    
    private let salary: UILabel = {
       
        let label = UILabel()
        
        label.numberOfLines = 1
        
        return label
    }()
    
    //Конпка для перехода к карте
    private let goToMapButton: UIButton = {
       
        let button = UIButton()
        
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 20
        
        button.setImage(Images.map, for: .normal)
        button.backgroundColor = .blue
        
        return button
    }()
    
    //Кнопка для принятия задания
    private let acceptButton: UIButton = {
        
        let button = UIButton()
        
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 20
        
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.backgroundColor = .green
        
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
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = 20
    }
    
    private func confSubviews(){
        
        self.addSubview(title, requirements, salary, goToMapButton, acceptButton)
        
        title.constraints(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 10, paddingRight: 10, width: 0, height: 0)
        
        //shortDescription.constraints(top: title.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 10, paddingRight: 10, width: 0, height: 0)
        
        requirements.constraints(top: title.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: nil, paddingTop: 10, paddingBottom: 0, paddingLeft: 10, paddingRight: 10, width: 0, height: 0)
        
        requirements.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -10).isActive = true
        requirements.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        requirements.contentMode = .left
        
        salary.constraints(top: requirements.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 10, paddingRight: 10, width: 0, height: 0)
        
        goToMapButton.constraints(top: salary.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 10, paddingRight: 10, width: 100, height: 30)
        
        acceptButton.constraints(top: goToMapButton.bottomAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 10, paddingBottom: 10, paddingLeft: 10, paddingRight: 10, width: 100, height: 30)
        
    }
    
    func render(){
        
        self.title.text = "Помочь старушке перейти дорогу"
        self.shortDescription.text = "Старушка находиться на одной стороне, а ей нужно на другую"
        self.requirements.image = Images.pin
        self.salary.text = "\(Int.random(in: 0...10000)) руб."
    }
}
