//
//  Utils.swift
//  SaleKit
//
//  Created by Nguyen Anh on 14/07/2021.
//

import UIKit
import NVActivityIndicatorView

class Utils: NSObject {

    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.topViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let child = base?.children.last {
            return topViewController(child)
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    // MARK: - Hub
    
    class func showLoadingIndicator(_ message: String? = nil) {
        // stop
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)

        // start
        let activityData = ActivityData(size: CGSize.init(width: 60, height: 60),
                                        message: message,
                                        messageFont: nil,
                                        type: NVActivityIndicatorType.ballSpinFadeLoader,
                                        color: .white,
                                        padding: 5,
                                        displayTimeThreshold: nil,
                                        minimumDisplayTime: nil,
                                        backgroundColor: nil,
                                        textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    class func hideLoadingIndicator() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
}
