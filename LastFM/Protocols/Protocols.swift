//
//  Protocols.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Foundation
import UIKit

protocol AlertDisplayer {
    func displayAlert(with title: String, message: String, actions: [UIAlertAction]?)
}
