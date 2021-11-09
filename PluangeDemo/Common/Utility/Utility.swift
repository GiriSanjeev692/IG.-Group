//
//  Utility.swift
//  Utility
//
//  Created by Sanjeev Kumar on 09/11/21.
//

import Foundation
import UIKit

enum AlertType: String {
    case success
    case error
}
public typealias VoidClosure = () -> Void

class Utility {
    static func showAlert(title: String? = "", message: String?, style: AlertType = .success, callback: VoidClosure? = nil) {
        if let topController = UIApplication.topViewController() {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: AppStrings.ok, style: .default, handler: { action in
                callback
            }))
            topController.present(alert, animated: true, completion: nil)
        }
    }

}
