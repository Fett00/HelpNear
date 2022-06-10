//
//  RequirementsScrolledList.swift
//  HelpNear
//
//  Created by Садык Мусаев on 10.06.2022.
//

import UIKit

class RequirementsScrolledList: UIScrollView {
    
    private let stackView: UIStackView = {
        
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 5
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(stackView)
        
        stackView.constraints(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    init(){
        super.init(frame: .zero)
        
        self.addSubview(stackView)
        
        stackView.constraints(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImages(images: [UIImage]){
        
        for view in self.subviews{
            
            view.removeFromSuperview()
        }
        
        for image in images {
            
            let imageView = UIImageView(image: image)
            
            stackView.addArrangedSubview(imageView)
            
        }
        
        self.contentSize = stackView.bounds.size
    }

    //Add gesture recognition
}
