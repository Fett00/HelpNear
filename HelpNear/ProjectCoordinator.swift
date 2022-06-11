//
//  ProjectCoordinator.swift


import Foundation
import UIKit
import SwiftUI

//Координатор всего приложения
class ProjectCoordinator{
    
    private let coreDataWorker = CoreDataWorker()
    private let networkWorker = NetworkWorker()
    private let jsonWorker = JSONDecoderWorker()
    private let locationWorker = LocationWorker()
    private lazy var eventsDataWorker = EventsDataWorker(coreDataWorker: self.coreDataWorker, networkWorker: self.networkWorker, jsonWorker: self.jsonWorker)
    
    //singleton
    private init(){}
    
    static let shared = ProjectCoordinator()
    
    func createAppEntryPoint() -> UIViewController {
        
        let collectionVC = ProjectCoordinator.shared.createEventCollectionScreen()
        
        collectionVC.tabBarItem = UITabBarItem(title: "Список", image: Images.collection, tag: 0)
        
        
        let mapVC = ProjectCoordinator.shared.createMapScreen()
        
        mapVC.tabBarItem = UITabBarItem(title: "Карта", image: Images.map, tag: 1)
        
        
        let userProfileVC = ProjectCoordinator.shared.createUserProfileScreen()
        
        userProfileVC.tabBarItem = UITabBarItem(title: "Профиль", image: Images.person, tag: 2)
        
        
        let tabBarVC = UITabBarController()
        
        tabBarVC.viewControllers = [collectionVC, mapVC, userProfileVC]
        
        tabBarVC.selectedIndex = 1
        
        return tabBarVC
    }
    
    func createUserProfileScreen() -> UIViewController{
        
        UserProfileScreen().wrapInNavigationController()
        //ProjectCoordinator.shared.createHostingViewController(with: someView).wrapInNavigationController()
    }
    
    func createMapScreen() -> UIViewController{
        
        let vm = EventMapViewModel(dataWorker: self.eventsDataWorker, locationWorker: self.locationWorker)
        let vc = EventMapScreen()
        vc.viewModel = vm
        
        return vc.wrapInNavigationController()
    }
    
    func createEventCollectionScreen() -> UIViewController{
        
        let vm = EventCollectionViewModel(dataWorker: self.eventsDataWorker)
        let vc = EventCollectionScreen()
        vc.viewModel = vm
        
        return vc.wrapInNavigationController()
    }
    
    func createRegistrationScreen() -> UIViewController{
        
        RegistrationScreen().wrapInNavigationController()
        //ProjectCoordinator.shared.createHostingViewController(with: someView).wrapInNavigationController()
    }
    
    func createHostingViewController<HView: View>(with view: HView) -> UIHostingController<HView>{
        UIHostingController(rootView: view)
    }
}
