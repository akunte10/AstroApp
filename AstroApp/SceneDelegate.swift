//
//  SceneDelegate.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      if let windowScene = scene as? UIWindowScene {
          // Setting the Main View
          let mainView = HomeView()
          let window = UIWindow(windowScene: windowScene)
          window.rootViewController = UIHostingController(rootView: mainView)
          self.window = window
          window.makeKeyAndVisible()
      }
    }
}
