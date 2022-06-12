//
//  TasksMapScreen.swift
//  HelpNear

import UIKit
import MapKit

final class EventMapScreen: UIViewController {
    
    var viewModel: EventMapViewModelProtocol!
    
    private let mapView: MKMapView = {
        
        let map = MapSingleView.default
        map.showsUserLocation = true
        return map
    }()
    
    private lazy var trackingButton: MKUserTrackingButton = {
        
        let button = MKUserTrackingButton(mapView: self.mapView)
        button.tintColor = Colors.accentColor
        button.backgroundColor = Colors.trackerBack
        button.layer.cornerRadius = 30
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        confView()
        confSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.requestEventsViewModelForMap {
            DispatchQueue.main.async {
                
                self.viewModel.data.forEach({ self.mapView.addAnnotation($0.annotation) })
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.requestGeopositionPermission()
    }
    
    private func confView(){
        
        self.view.backgroundColor = .systemBackground
    }
    
    private func confSubviews(){
        
        view.addSubview(mapView, trackingButton)
        let safe = self.view.safeAreaLayoutGuide
        
        mapView.constraints(top: self.view.topAnchor, bottom: safe.bottomAnchor, leading: safe.leadingAnchor, trailing: safe.trailingAnchor, paddingTop: 0, paddingBottom: -40, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        trackingButton.constraints(top: nil, bottom: safe.bottomAnchor, leading: nil, trailing: safe.trailingAnchor, paddingTop: 0, paddingBottom: 30, paddingLeft: 0, paddingRight: 30, width: 60, height: 60)
    }
}
