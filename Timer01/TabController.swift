//
//  TabController.swift
//  TabBar-Tutorial
//
//  Created by Nick Rodriguez on 28/06/2024.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.tabBar.backgroundColor = .darkGray
//        self.tabBar.barTintColor = .red
//        self.tabBar.barStyle = .black
//        self.tabBar.tintColor = .green
//        self.tabBar.unselectedItemTintColor = .purple
        self.delegate = self
    }
    

    private func setupTabs(){
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeVC())
        let sendRequest = self.createNav(with: "Send Request", and: UIImage(systemName: "paperplane"), vc: SendRequestVC())
//        let workout = self.createNav(with: "Workout", and: UIImage(systemName: "person"), vc: WorkoutController())
//        let exercise = self.createNav(with: "Exercise", and: UIImage(systemName: "cloud.snow"), vc: HomeController())
        
//        self.setViewControllers([home,history,workout,exercise], animated: true)
        self.setViewControllers([home, sendRequest], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
//        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        return nav
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("- in TabController didSelect *** ")
        guard let nav_vc = viewController as? UINavigationController else {
            print("- Item is not a UINavigationController")
            return
        }
        if let homeVc = nav_vc.children[0] as? HomeVC {
            homeVc.strNameOfScreen = "Home VC"
//            homeVc.setupViews()
        }
        if let sendRequestVc = nav_vc.children[0] as? SendRequestVC {
            sendRequestVc.lblScreenTitle.text = "Send Request VC"
//            DispatchQueue.main.async {
//                sendRequestVc.strNameOfScreen = "SendRequest VC"
//            }
//            sendRequestVc.setupViews()
        }
    }
}
