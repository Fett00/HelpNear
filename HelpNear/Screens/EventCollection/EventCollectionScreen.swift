//
//  TasksCollectionScreen.swift
//  HelpNear

import UIKit

final class EventCollectionScreen: UIViewController {
    
    //Коллекция с заданями
    private let collection: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collection
    }()
    
    //Строка с поиском
    private let searchBar: EventCollectionHeader = {
       
        let header = EventCollectionHeader()
        
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        confView()
        confSubviews()
    }
    
    //Обноовление лайаута коллекции
    private func layoutCollection(){
        
        guard let flowLayout = collection.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let insets = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        let spacing = 20.0
        let deviceWidth = view.frame.width
        let itemSize = (deviceWidth - insets.left - insets.right - spacing ) / 2
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.minimumLineSpacing = spacing
        flowLayout.sectionInset = insets
        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize * 2)
    }
    
    //configurate view
    private func confView(){
        
        self.view.backgroundColor = .systemBackground
    }
    
    //configurate subviews
    private func confSubviews(){
        
        
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(EventCollectionCell.self, forCellWithReuseIdentifier: EventCollectionCell.reuseID)
        
        let safeArea = view.safeAreaLayoutGuide
        
        searchBar.constraints(top: safeArea.topAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 50)
        collection.constraints(top: searchBar.bottomAnchor, bottom: safeArea.bottomAnchor, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
}

extension EventCollectionScreen: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}

extension EventCollectionScreen: UICollectionViewDelegate{
    
}
