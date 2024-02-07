//
//  Alert.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import UIKit

final class Alert: NSObject {
    
    internal enum PressedStateHandlerType {
        case Default
        case Cancel
        case Destructive
        case None
    }
    
//    class func show(title: String? = nil, message: String? = nil, imageIcon: UIImage? = nil, style: UIAlertController.Style = .alert, defaultActionText: String = "Ok", cancelActionText: String? = nil, pressedStateHandler: @escaping (PressedStateHandlerType) -> Void) -> Void {
//        
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
//        let rootViewController = UIApplication.shared.windows.topVisibleViewController
//        
//        let defaultAction = UIAlertAction(title: defaultActionText, style: .default) { (action:UIAlertAction) in
//            pressedStateHandler(.Default)
//        }
//        alertController.addAction(defaultAction)
//        
//        if cancelActionText !=  nil {
//            let cancelAction = UIAlertAction(title: cancelActionText, style: .cancel) { (action:UIAlertAction) in
//                pressedStateHandler(.Cancel)
//            }
//            alertController.addAction(cancelAction)
//        }
//        rootViewController?.present(alertController, animated: true, completion: nil)
//    }
}

