//
//  EventMapAnnotation.swift
//  HelpNear
//
//  Created by Садык Мусаев on 13.06.2022.
//

import UIKit
import CoreLocation
import MapKit

class EventMapAnnotation: NSObject, MKAnnotation {
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    // Required if you set the annotation view's `canShowCallout` property to `true`
    var title: String?
    
    // This property defined by `MKAnnotation` is not required.
    var subtitle: String?
    
    var id: String!
}
