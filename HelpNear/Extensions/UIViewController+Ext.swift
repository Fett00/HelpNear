//
//  UIViewController+Ext.swift


import UIKit


extension UIViewController{
    
    //Спрятать клавиатуру при тапе в любом месте
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //Спрятать клавиатуру при тапе в любом месте
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //Обертка VC в NavigationVC
    func wrapInNavigationController() -> UIViewController{
        
        UINavigationController(rootViewController: self)
    }
}
