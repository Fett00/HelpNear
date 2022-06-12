//
//  TabBarController.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController{
    
    var layerHeight = CGFloat()
    
    private var middleIndex = 0
    
    var middleButton: UIButton = {
        
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        button.contentMode = .center
        button.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        button.setImage(Images.map, for: .normal)
        button.imageView?.tintColor = .white
        button.backgroundColor = Colors.gray
        return button
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tabBar.layer.backgroundColor = UIColor.white.cgColor
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        tabBar.layer.shadowOpacity = 0.12
        tabBar.layer.shadowRadius = 10.0
        tabBar.layer.masksToBounds = false
    }
    
    func addMiddleButton(middleIndex: Int){
        
        self.middleIndex = middleIndex
        
        if let items = self.tabBar.items {
            
            items[middleIndex].isEnabled = false
        }
        
        tabBar.addSubview(middleButton)
        
        let size = CGFloat(80)
        
        //let constant: CGFloat = -20 + ( layerHeight / 2 ) - 5
        
        NSLayoutConstraint.activate([
            
            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middleButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor),
            middleButton.heightAnchor.constraint(equalToConstant: size),
            middleButton.widthAnchor.constraint(equalToConstant: size)
        ])
        
        middleButton.layer.cornerRadius = size / 2
        // shadow
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        middleButton.layer.shadowOpacity = 0.75
        middleButton.layer.shadowRadius = 13
        // other
        middleButton.layer.masksToBounds = false
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        
        middleButton.addTarget(self, action: "openMiddleScreen", for: .touchUpInside)
    }
    
    @objc func openMiddleScreen(){
        
        if self.tabBar.items != nil {
            
            self.selectedIndex = self.middleIndex
        }
        else{
            
            self.selectedIndex = 0
        }
    }
}
