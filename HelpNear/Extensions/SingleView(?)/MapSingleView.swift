//
//  MapSingleView.swift
//  HelpNear


import Foundation
import MapKit


//Хранилище для mapView из-за проблемы с памятью у MKMapView
struct MapSingleView{
    
    private init(){}
    
    static let `default` = MKMapView()
}
