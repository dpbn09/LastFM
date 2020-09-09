//
//  DataResponseError.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Foundation

enum DataResponseError: Error {
    case network
    case decoding
    case invalidURL
    case noDataAvailable
  
    var reason: String {
        switch self {
            case .network:
                return "An error occurred while fetching data "
            case .decoding:
                return "An error occurred while decoding data"
            case .invalidURL:
                return "An error occurred while creating url"
            case .noDataAvailable:
                return "No data available"
        }
    }
}
