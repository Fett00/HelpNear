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
    private lazy var userDataWorker = UsersDataWorker(networkWorker: self.networkWorker, jsonWorker: self.jsonWorker)
    
    //singleton
    private init(){}
    
    static let shared = ProjectCoordinator()
    
    func createAppEntryPoint() -> UIViewController {

      let viewController = OnBoardingViewController(nibName: "OnBoardingViewController", bundle: nil)
      return viewController.wrapInNavigationController()
    //createMainScreen()
    }

  func createMainScreen() -> UIViewController {
    let collectionVC = ProjectCoordinator.shared.createEventCollectionScreen()

    collectionVC.tabBarItem = UITabBarItem(title: "", image: Images.collection, tag: 0)

    let rankingVC = ProjectCoordinator.shared.createRankingScreen()
    rankingVC.tabBarItem = UITabBarItem(title: "", image: Images.crown, tag: 1)

    let mapVC = ProjectCoordinator.shared.createMapScreen()

    mapVC.tabBarItem = UITabBarItem(title: "", image: Images.map, tag: 2)

    let userProfileVC = ProjectCoordinator.shared.createUserProfileScreen()

    userProfileVC.tabBarItem = UITabBarItem(title: "", image: Images.personCircle, tag: 4)

    let settingsVC = ProjectCoordinator.shared.createSettingsScreen()
    settingsVC.tabBarItem = UITabBarItem(title: "", image: Images.gearshape, tag: 5)


    let tabBarVC = MainTabBarController()

    tabBarVC.tabBar.layer.cornerRadius = 30
    tabBarVC.tabBar.layer.maskedCorners //= [.layerMinXMaxYCorner, .layerMinXMinYCorner ]

    tabBarVC.viewControllers = [collectionVC, rankingVC, mapVC, userProfileVC, settingsVC]

    tabBarVC.selectedIndex = 2

    tabBarVC.addMiddleButton(middleIndex: 2)

    return tabBarVC
  }
    
    func createUserProfileScreen() -> UIViewController{

      let vc = UserProfileScreen(nibName: "UserProfileScreen", bundle: nil)//EventCollectionScreen()
      return vc

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
        let vc = EventCollectionScreen(nibName: "EventCollectionScreen", bundle: nil)//EventCollectionScreen()
        vc.viewModel = vm
        
        return vc//.wrapInNavigationController()
    }
    
    func createEventFiltersScreen(with collection: UICollectionView) -> UIViewController{
        
        let vm = EventCollectionViewModel(dataWorker: self.eventsDataWorker)
        let vc = EventFilters(nibName: "EventFilters", bundle: nil, collection: collection)//EventCollectionScreen()
        vc.viewModel = vm
        
        return vc//.wrapInNavigationController()
    }
    
    func createRegistrationScreen() -> UIViewController{
        
        RegistrationScreen().wrapInNavigationController()
        //ProjectCoordinator.shared.createHostingViewController(with: someView).wrapInNavigationController()
    }
    
    func createRankingScreen() -> UIViewController{
        
        let vm = RankingViewModel(usersDataWorker: self.userDataWorker)
        let vc = RankingScreen()
        vc.viewModel = vm
        
        return vc.wrapInNavigationController()
    }
    
    func createSettingsScreen() -> UIViewController{
        
        SettingsScreen().wrapInNavigationController()
    }
    
    func createHostingViewController<HView: View>(with view: HView) -> UIHostingController<HView>{
        UIHostingController(rootView: view)
    }
}
