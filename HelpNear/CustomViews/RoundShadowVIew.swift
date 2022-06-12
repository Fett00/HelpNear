//
//  RoundShadowVIew.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation
import UIKit

class RoundShadowView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutView() {

        // set the shadow of the view's layer
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -8.0)
        layer.shadowOpacity = 0.12
        layer.shadowRadius = 10.0   
    }
}
