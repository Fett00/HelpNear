//
//  ProjectCoordinator.swift


import Foundation
import UIKit
import SwiftUI

//Координатор всего приложения
class ProjectCoordinator{
    
    let coreDataWorker = CoreDataWorker()
    let networkWorker = NetworkWorker()
    let jsonWorker = JSONDecoderWorker()
    let locationWorker = LocationWorker()
    
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
        
        EventMapScreen().wrapInNavigationController()
    }
    
    func createEventCollectionScreen() -> UIViewController{
        
        let dw = EventCollectionDataWorker(coreDataWorker: self.coreDataWorker, networkWorker: self.networkWorker, jsonWorker: self.jsonWorker)
        let vm = EventCollectionViewModel(dataWorker: dw)
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
