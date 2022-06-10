//
//  TasksMapScreen.swift
//  HelpNear

import UIKit
import MapKit

final class EventMapScreen: UIViewController {
    
    private let mapView: MKMapView = {
        
        let map = MapSingleView.default
        
        return map
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
        
        view.addSubview(mapView)
        let safe = self.view.safeAreaLayoutGuide
        
        mapView.constraints(top: safe.topAnchor, bottom: safe.bottomAnchor, leading: safe.leadingAnchor, trailing: safe.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
}