//
//  PresentEvent.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation
import UIKit

class PresentEvent: UIViewController{
    
    @IBOutlet weak var eventTilte: UILabel!
    @IBOutlet weak var req: UILabel!
    @IBOutlet weak var acceptEventButton: UIButton!
    @IBOutlet weak var eventDescription: UILabel!
    
    let model: EventCollectionModel
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, model: EventCollectionModel) {
        
        self.model = model
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        acceptEventButton.layer.cornerCurve = .continuous
        acceptEventButton.layer.cornerRadius = 20
        acceptEventButton.setTitle("Откликнуться", for: .normal)
        acceptEventButton.backgroundColor = Colors.accentColor
        acceptEventButton.setTitleColor(.white, for: .normal)
        
        eventTilte.text = model.title
        eventDescription.text = model.description
    }
    
    @IBAction func acceptEvent(_ sender: Any) {
        
    }
}
