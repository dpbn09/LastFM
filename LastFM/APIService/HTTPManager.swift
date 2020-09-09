//
//  APIManager.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Foundation

protocol HTTPManagerDelegate {
    func onResult(result: Result<SearchResult, DataResponseError>)
}

class HTTPManager {
    private lazy var baseURLString: String = {
        return "http://ws.audioscrobbler.com/2.0/?&api_key=7803d35e3c7ee5c9f70727669b2d8ce2&format=json&limit=20&"
    }()
    
    let session: URLSession
    var delegate: HTTPManagerDelegate?
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func setDelegate(delegate:HTTPManagerDelegate) {
        self.delegate = delegate
    }
    
    func fetchData(with searchContext:String, page: Int) {
        guard let url = URL(string: baseURLString + "\(searchContext)&page=\(page)") else {
            self.delegate?.onResult(result: Result.failure(DataResponseError.invalidURL))
            return
        }
        session.dataTask(with: url, completionHandler: { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, 200 ..< 300 ~= httpResponse.statusCode, let data = data
                else {
                    self.delegate?.onResult(result: Result.failure(DataResponseError.network))
                    return
                }
            guard let decodedResponse = try? JSONDecoder().decode(DataModel.self, from: data)
                else {
                    self.delegate?.onResult(result: Result.failure(DataResponseError.decoding))
                    return
            }
            if let data = decodedResponse.results {
                self.delegate?.onResult(result: Result.success(data))
            }
            else {
                self.delegate?.onResult(result: Result.failure(DataResponseError.noDataAvailable))
            }
        }).resume()
    }
}
