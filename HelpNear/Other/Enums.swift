//
//  Enums.swift
//  DeliveryApp


import UIKit

enum Images{
    
    static let map = UIImage(systemName: "map")!
    static let collection = UIImage(systemName: "list.bullet.rectangle")!
    static let person = UIImage(systemName: "person")!
    static let pin = UIImage(systemName: "pin")!
    static let crown = UIImage(systemName: "crown")!
    static let personCircle = UIImage(systemName: "person.circle")!
    static let gearshape = UIImage(systemName: "gearshape")!
    static let background = UIImage(named: "Background")!
    static let filterIcon = UIImage(named: "FilterIcon")!
    static let filterBack = UIImage(named: "FilterBackground")!
    static let arrow = UIImage(named: "Arrow")!
    static let triangleLeft = UIImage(systemName: "arrowtriangle.forward.fill")
}

enum URLs{
    
    static let eventsURL = "http://85.192.49.140:3077/api/get-all-tasks"
    static let usersURL = "http://85.192.49.140:3077/api/get-all-users"
}

enum Colors{
    
    static let gray = UIColor(named: "GrayColor")!
    static let main = UIColor(named: "MainColor")!
    static let text = UIColor(named: "TextColor")!
    static let trackerBack = UIColor(named: "TrackerBackground")!
    static let yellow = UIColor(named: "YellowColor")!
    static let mainLight = UIColor(named: "MainLightColor")!
    static let accentColor = UIColor(named: "AccentColor")!
    static let gold = UIColor(named: "Gold")!
    static let silver = UIColor(named: "Silver")!
    static let bronze = UIColor(named: "Bronze")!
}
