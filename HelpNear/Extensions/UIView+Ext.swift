//
//  UIView+Ext.swift


import UIKit

extension UIView {
    
    func constraints(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingBottom: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let leading = leading {
            
            self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let trailing = trailing {
            
            self.trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func constraints(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, xPadding: CGFloat, yPadding: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            
            self.centerXAnchor.constraint(equalTo: centerX, constant: xPadding).isActive = true
        }
        if let centerY = centerY {
            
            self.centerYAnchor.constraint(equalTo: centerY, constant: yPadding).isActive = true
        }
    }
    
    func addSubview(_ views: UIView...){
        
        let _ = views.map { self.addSubview($0) }
    }
    
    func showTapAnimation(_ completionBlock: @escaping () -> ()) {
        
        //isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: { [weak self] in
            
            guard let strongSelf = self else { return }
            strongSelf.alpha = 0.6
            completionBlock()
            
        }) { done in
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: { [weak self] in
                
                guard let strongSelf = self else { return }
                strongSelf.alpha = 1.0
                
            }) { (_) in
                
                //guard let strongSelf = self else { return }
                //strongSelf.isUserInteractionEnabled = true
            }
        }
    }
}
