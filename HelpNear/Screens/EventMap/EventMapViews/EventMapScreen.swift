//
//  TasksMapScreen.swift
//  HelpNear

import UIKit
import MapKit

final class EventMapScreen: UIViewController {
    
    var viewModel: EventMapViewModelProtocol!
    
    private lazy var mapView: MKMapView = {
        
        let map = MapSingleView.default
        map.showsUserLocation = true
        map.delegate = self
        map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(EventMapAnnotation.self))
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
                
                for annotation in self.viewModel.data{
                    
                    self.mapView.addAnnotation(annotation)
                }
                //self.viewModel.data.forEach({ self.mapView.addAnnotation($0.annotation) })
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
    
//    @objc func presentEvent(_ sender: UIButton){
//
//    }
}

extension EventMapScreen: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }
        
        let view = self.mapView.dequeueReusableAnnotationView(withIdentifier: NSStringFromClass(EventMapAnnotation.self), for: annotation)
        
        if let markerAnnotationView = view as? MKMarkerAnnotationView {
            markerAnnotationView.animatesWhenAdded = true
            markerAnnotationView.canShowCallout = true
            markerAnnotationView.markerTintColor = Colors.yellow
            
            /*
             Add a detail disclosure button to the callout, which will open a new view controller or a popover.
             When the detail disclosure button is tapped, use mapView(_:annotationView:calloutAccessoryControlTapped:)
             to determine which annotation was tapped.
             If you need to handle additional UIControl events, such as `.touchUpOutside`, you can call
             `addTarget(_:action:for:)` on the button to add those events.
             */
            let rightButton = UIButton(type: .detailDisclosure)
            
            //rightButton.addTarget(self, action: "presentEvent", for: .touchUpInside)
            markerAnnotationView.rightCalloutAccessoryView = rightButton
        }
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if let annotation = view.annotation as? EventMapAnnotation{
            
            self.viewModel.createEventForPresent(with: annotation.id) { event in
                
                self.present(PresentEvent(nibName: "PresentEvent", bundle: nil, model: event), animated: true, completion: nil)
            }
        }
    }
}
