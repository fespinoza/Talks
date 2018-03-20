//
//  AppDelegate.swift
//  QuizList
//
//  Created by Felipe Espinoza on 18/03/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white

    let questionListViewController = QuestionsListViewController()
    let questionsNavigationController = UINavigationController(rootViewController: questionListViewController)
    questionsNavigationController.tabBarItem = UITabBarItem(title: "Questions", image: #imageLiteral(resourceName: "list-icon"), tag: 0)

    let quizViewController = QuizViewController()
    quizViewController.tabBarItem = UITabBarItem(title: "Quiz", image: #imageLiteral(resourceName: "question-icon"), tag: 1)

    let tabBarViewController = UITabBarController()
    tabBarViewController.viewControllers = [
      questionsNavigationController,
      quizViewController
    ]

    window?.rootViewController = tabBarViewController
    window?.makeKeyAndVisible()
    return true
  }
}

