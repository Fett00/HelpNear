//
//  TasksCollectionScreen.swift
//  HelpNear

import UIKit
import NVActivityIndicatorView

final class EventCollectionScreen: UIViewController {
    
    var viewModel: EventCollectionViewModelProtocol!
    
    //Строка Поиска
    @IBOutlet weak var searchBar: UITextField!

    //кнопка фильтрации
    @IBOutlet weak var filterButton: UIButton!
    
    //Индикатор загрузки
    private let activityIndicator: NVActivityIndicatorView = {
       
        let indicator = NVActivityIndicatorView(frame: .zero, type: .circleStrokeSpin, color: .gray, padding: nil)
        indicator.bounds = CGRect(origin: .zero, size: .init(width: 20, height: 20))
        return indicator
    }()
    
    //Коллекция с заданиями
    @IBOutlet weak var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        confView()
        confSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutCollection()
        
        activityIndicator.startAnimating()
        viewModel.requestEvents {
            DispatchQueue.main.async {
                //Обработать загрузку данных
                sleep(1)
                self.collection.reloadData()
                self.activityIndicator.stopAnimating()
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
        
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        let spacing = 20.0
        let cellAtRow = 1.0
        let collectionWidth = self.collection.frame.width
        let itemSize = (collectionWidth - insets.left - insets.right - spacing * (cellAtRow - 1))
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.minimumLineSpacing = spacing
        flowLayout.sectionInset = insets
        flowLayout.itemSize = CGSize(width: itemSize, height: 150)
        
        //flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        //flowLayout.estimatedItemSize = CGSize(width: itemSize, height: 250)
    }
    
    //configurate view
    private func confView(){
        
        self.view.backgroundColor = .systemBackground
    }
    
    //configurate subviews
    private func confSubviews(){
        
        self.view.addSubview(activityIndicator)
        
        collection.delegate = self
        collection.dataSource = self
        //collection.register(EventCollectionCell.self, forCellWithReuseIdentifier: EventCollectionCell.reuseID)
        collection.register(UINib(nibName: "EventCollectionCell", bundle: nil), forCellWithReuseIdentifier: "1234q")
        
        self.navigationController?.isNavigationBarHidden = true

        activityIndicator.constraints(centerX: collection.centerXAnchor, centerY: collection.centerYAnchor, xPadding: 0, yPadding: 0)
    }
    
    
    @IBAction func goToFilters(_ sender: Any) {
        
        self.present(ProjectCoordinator.shared.createEventFiltersScreen(with: self.collection), animated: true, completion: nil)
    }
}

extension EventCollectionScreen: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "1234q", for: indexPath) as? EventCollectionCell else { return UICollectionViewCell() }
        
        cell.render(with: self.viewModel.data[indexPath.row], index: indexPath.row)
        
        return cell
    }
    
    @objc func presentFullEvent(_ sender: UIButton){
        
        let index = sender.tag
        
        let model = self.viewModel.data[index]
        
        self.present(PresentEvent(nibName: "PresentEvent", bundle: nil, model: model), animated: true, completion: nil)
    }
}

extension EventCollectionScreen: UICollectionViewDelegate{
    
}
