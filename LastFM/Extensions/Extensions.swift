//
//  Extensions.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Foundation
import UIKit

extension AlertDisplayer where Self: UIViewController {
    func displayAlert(with title: String, message: String, actions: [UIAlertAction]? = nil) {
        guard presentedViewController == nil else {
            return
        }
    
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions?.forEach { action in
            alertController.addAction(action)
        }
        present(alertController, animated: true)
    }
}


extension UIStoryboard {
    class func instantiateVC<T: UIViewController>(forModule module : StoryboardModule) -> T? {
        if let name = NSStringFromClass(T.self).components(separatedBy: CharacterSet(charactersIn: ".")).last {
            return UIStoryboard.init(name: module.rawValue, bundle: nil).instantiateViewController(withIdentifier: name) as? T
        }
        return nil
    }
}
