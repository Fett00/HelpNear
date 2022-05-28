//
//  ProjectCoordinator.swift


import Foundation
import UIKit

//Координатор всего приложения
class ProjectCoordinator{
    
    //singleton
    private init(){}
    
    static let shared = ProjectCoordinator()
    
    func createAppEntryPoint() -> UIViewController {
        
        let collectionVC = TasksCollectionScreen().wrapInNavigationController()
        
        collectionVC.tabBarItem = UITabBarItem(title: "Список", image: Images.collection, tag: 0)
        
        
        let mapVC = TasksMapScreen().wrapInNavigationController()
        
        mapVC.tabBarItem = UITabBarItem(title: "Карта", image: Images.map, tag: 1)
        
        
        let userProfileVC = UserProfileScreen().wrapInNavigationController()
        
        userProfileVC.tabBarItem = UITabBarItem(title: "Профиль", image: Images.person, tag: 2)
        
        
        let tabBarVC = UITabBarController()
        
        tabBarVC.viewControllers = [collectionVC, mapVC, userProfileVC]
        
        tabBarVC.selectedIndex = 1
        
        return tabBarVC
    }
}
