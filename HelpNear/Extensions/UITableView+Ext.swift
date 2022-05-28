//
//  UITableView+Ext.swift


import UIKit

extension UITableView {
        
    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        
        register(Cell.self, forCellReuseIdentifier: Cell.reuseID)
    }
}
