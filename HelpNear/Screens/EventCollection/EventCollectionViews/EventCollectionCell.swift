//
//  EventCollectionCell.swift
//  HelpNear
//
//  Created by Садык Мусаев on 08.06.2022.
//

import Foundation
import UIKit

class EventCollectionCell: UICollectionViewCell {
    
    private var model: EventCollectionModel?
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var fasting: UILabel!
    @IBOutlet weak var separatior: UIView!
    @IBOutlet weak var button: UIButton!
    
    static let id = "1234q"
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        confCell()
//        confSubviews()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        confCell()
        confSubviews()
    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func confCell(){
        
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = 20
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 0.45
        self.layer.shadowRadius = 8.0
        self.layer.masksToBounds = false
    }
    
    private func confSubviews(){
        
        separatior.layer.borderWidth = 2
        separatior.layer.borderColor = Colors.gray.cgColor
        button.setTitle("", for: .normal)
        let imageConf = UIImage.SymbolConfiguration(pointSize: 20, weight: .thin)
        
        button.contentMode = .center
        button.clipsToBounds = true
        //button.imageEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        //button.setBackgroundImage(, for: )
        button.setPreferredSymbolConfiguration(imageConf, forImageIn: .normal)
        button.setImage(Images.triangleLeft, for: .normal)
        button.imageView?.tintColor = Colors.accentColor
        button.addTarget(nil, action: "presentFullEvent:", for: .touchUpInside)
    }
    
    func render(with model: EventCollectionModel, index: Int){
        
        self.model = model
        self.button.tag = index
        
        self.title.text = model.title
        self.owner.text = "Направление:  \(model.description)"
        self.format.text = "Формат: очно"
        self.fasting.text = "Срочность: срочно"
    }
}
