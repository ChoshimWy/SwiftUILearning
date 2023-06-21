//
//  SwiftUI_UIKitApp.swift
//  SwiftUI_UIKit
//
//  Created by Choshim.Wei on 2023/6/21.
//

import SwiftUI

@main
struct SwiftUI_UIKitApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    let os = UIDevice.current.userInterfaceIdiom
                    if os == .phone {
                        appDelegate.orientation = .portrait
                    } else if os == .pad || os == .mac {
                        appDelegate.orientation = .landscape
                    }
                    
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: appDelegate.orientation))
                    }
                }
        }
    }
}


class AppDelegate: UIResponder, UIApplicationDelegate {
    var orientation = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientation
    }
}
