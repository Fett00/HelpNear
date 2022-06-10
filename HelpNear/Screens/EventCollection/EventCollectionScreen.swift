//
//  TasksCollectionScreen.swift
//  HelpNear

import UIKit

final class EventCollectionScreen: UIViewController {
    
    var dataWorker: EventCollectionDataWorkerProtocol!
    
    //Коллекция с заданиями
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutCollection()
        
        dataWorker.requestEvents {
            DispatchQueue.main.async {
                //Обработать загрузку данных
                self.collection.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutCollection()
    }
    
    //Обноовление лайаута коллекции
    private func layoutCollection(){
        
        guard let flowLayout = collection.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let spacing = 20.0
        let cellAtRow = 1.0
        let collectionWidth = self.collection.frame.width
        let itemSize = (collectionWidth - insets.left - insets.right - spacing * (cellAtRow - 1))
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.minimumLineSpacing = spacing * 2
        flowLayout.sectionInset = insets
        flowLayout.itemSize = CGSize(width: itemSize, height: 250)
        
        //flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        //flowLayout.estimatedItemSize = CGSize(width: itemSize, height: 250)
    }
    
    //configurate view
    private func confView(){
        
        self.view.backgroundColor = .systemBackground
    }
    
    //configurate subviews
    private func confSubviews(){
        
        view.addSubview(searchBar, collection)
        
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
        
        10//dataWorker.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionCell.reuseID, for: indexPath) as? EventCollectionCell else { return UICollectionViewCell() }
        
        cell.render()
        
        return cell
    }
    
    
}

extension EventCollectionScreen: UICollectionViewDelegate{
    
}
