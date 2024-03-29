//
//  RankingScreen.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation
import UIKit

final class RankingScreen: UIViewController{
    
    var viewModel: RankingViewModelProtocol!
    
    private lazy var rankedCollectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RankingCollectionCell.self)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confView()
        confSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutCollection()
        
        self.viewModel.requestRankedUsers {
            
            DispatchQueue.main.async {
                
                self.rankedCollectionView.reloadData()
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        layoutCollection()
    }
    
    private func layoutCollection(){
        
        guard let flowLayout = rankedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let insets = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        let spacing = 20.0
        let collectionWidth = self.rankedCollectionView.frame.width
        let itemSize = (collectionWidth - insets.left - insets.right)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = spacing
        rankedCollectionView.contentInset = insets
        flowLayout.itemSize = CGSize(width: itemSize, height: 70)
    }
    
    private func confView(){
        
        self.view.backgroundColor = .systemBackground
        
        let image = UIImageView(image: Images.background)
        image.frame = self.view.frame
        self.view.addSubview(image)
        
    }
    
    private func confSubviews(){
        
        self.view.addSubview(rankedCollectionView)
        
        let safe = self.view.safeAreaLayoutGuide
        
        rankedCollectionView.constraints(top: safe.topAnchor, bottom: safe.bottomAnchor, leading: safe.leadingAnchor, trailing: safe.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
}

extension RankingScreen: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionCell.reuseID, for: indexPath) as? RankingCollectionCell else { return UICollectionViewCell() }
        
        switch indexPath.row{
            
        case 0:
            cell.render(with: self.viewModel.data[indexPath.row], shadowColor: Colors.gold.cgColor)
        case 1:
            cell.render(with: self.viewModel.data[indexPath.row], shadowColor: Colors.silver.cgColor)
        case 2:
            cell.render(with: self.viewModel.data[indexPath.row], shadowColor: Colors.bronze.cgColor)
        default:
            cell.render(with: self.viewModel.data[indexPath.row], shadowColor: UIColor.black.cgColor)
        }
        
        
        return cell
    }
}

extension RankingScreen: UICollectionViewDelegate{
    
}
