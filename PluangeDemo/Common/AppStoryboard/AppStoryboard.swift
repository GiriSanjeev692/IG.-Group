//
//  AppStoryboard.swift
//  AppStoryboard
//
//  Created by Sanjeev Kumar on 31/11/09.
//

import Foundation
import UIKit

enum AppStoryboard: String {
    case main = "Main"
    
}

extension AppStoryboard {
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }

    func viewController<T: UIViewController>(viewControllerClass: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(rawValue) Storyboard.\nFile: \(file) \nLine Number: \(line) \nFunction: \(function)")
        }
        return scene
    }

    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID: String {
        let viewControllerName = "\(self)"
        return viewControllerName
    }

    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
