//
//  Constants.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Foundation

enum CellIdentifiers {
    static let SearchCell = "SearchCell"
    static let CustomSectionHeader = "CustomSectionHeader"
}

enum FileNameIdentifiers {
    static let CustomTableViewCell = "CustomTableViewCell"
    static let SearchView = "SearchView"
    static let SelectionView = "SelectionView"
    static let CustomSectionHeaderView = "CustomSectionHeaderView"
}

enum StoryboardModule: String {
    case Main
}

enum Selection:Int {
    case Artist, Album, Track, Unknown
}
