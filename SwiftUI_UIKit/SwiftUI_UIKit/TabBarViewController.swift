//
//  TabBarViewController.swift
//  SwiftUI_UIKit
//
//  Created by Choshim.Wei on 2023/6/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let houseVC = HouseViewController()
        houseVC.title = "House"
        houseVC.tabBarItem.title = "house"
        houseVC.tabBarItem.image = UIImage(systemName: "house")
        houseVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let messageVC = MessageViewController()
        messageVC.title = "Message"
        messageVC.tabBarItem.title = "Message"
        messageVC.tabBarItem.image = UIImage(systemName: "message")
        messageVC.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        
        self.viewControllers = [houseVC, messageVC]
        
    }

}
