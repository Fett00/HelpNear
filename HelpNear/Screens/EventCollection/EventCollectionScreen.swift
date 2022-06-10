//
//  TasksCollectionScreen.swift
//  HelpNear

import UIKit

final class EventCollectionScreen: UIViewController {
    
    private let collection: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collection
    }()
    
    private let searchBar: EventCollectionHeader = {
       
        let header = EventCollectionHeader()
        
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        confView()
        confSubviews()
    }
    
    private func confView(){
        
        self.view.backgroundColor = .systemBackground
    }
    
    private func confSubviews(){
        
    }
}
