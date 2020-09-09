//
//  ViewModel.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchFailed(with reason: String)
    func navigateToDetailsViewController(data:Any, selection:Selection)
}

final class SearchViewModel {
    private weak var delegate: SearchViewModelDelegate?
    private var recordsArray: [Any] = []
    private var currentPage = 1
    private var total = 0
    private var selectedOption:Selection = Selection.Unknown
    
    private var client:HTTPManager!
    
    init(delegate:SearchViewModelDelegate) {
        self.delegate = delegate
        self.client = HTTPManager()
        self.client.setDelegate(delegate: self)
    }
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return recordsArray.count
    }
    
    func data(at index: Int) -> (title: String, url:String) {
        switch selectedOption {
            case .Album:
                let data = (recordsArray as? [AlbumData])?[index]
                return (data?.name ?? "", data?.image?.last?.imageUrl ?? "")
            case .Artist:
                let data = (recordsArray as? [ArtistData])?[index]
                return (data?.name ?? "", data?.image?.last?.imageUrl ?? "")
            case .Track:
                let data = (recordsArray as? [TrackData])?[index]
                return (data?.name ?? "", data?.image?.last?.imageUrl ?? "")
            default:
                debugPrint("unknown option selected")
                return ("", "")
        }
    }
    
    func getSelectedOption() -> Selection{
        return selectedOption
    }
    
    func setSelectionOption(option:Selection) {
        selectedOption = option
    }
    
    func setRecordsArray(data:[Any]) {
        recordsArray = data
    }
    
    func setClient(client:HTTPManager) {
        self.client = client
    }
    
    func fetchData(selection:Selection, searchText:String) {
        guard !searchText.isEmpty else {
            self.delegate?.onFetchFailed(with: "Enter data in field to search")
            return
        }
        selectedOption = selection
        guard recordsArray.count < total || recordsArray.count == 0 else {
            return
        }
        var apiParamString = ""
        switch selection {
            case .Album:
                apiParamString = "method=album.search&album=\(searchText)"
            case .Artist:
                apiParamString = "method=artist.search&artist=\(searchText)"
            case .Track:
                apiParamString = "method=track.search&track=\(searchText)"
            default:
                debugPrint("unknown selection type")
        }
        client.fetchData(with: apiParamString, page: currentPage)
    }
    
    func reset() {
        recordsArray.removeAll()
        currentPage = 1
        total = 0
        self.delegate?.onFetchCompleted()
    }
    
    func selectedRow(at index: Int) {
        delegate?.navigateToDetailsViewController(data: recordsArray[index], selection: selectedOption)
    }
}


extension SearchViewModel: HTTPManagerDelegate {
    func onResult(result: Result<SearchResult, DataResponseError>) {
        switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.delegate?.onFetchFailed(with: error.reason)
                }
            case .success(let response):
                DispatchQueue.main.async {
                    self.currentPage += 1
                    self.total = Int(response.totalResults ?? "0") ?? 0
                    switch self.selectedOption {
                        case .Album:
                            self.recordsArray.append(contentsOf: response.albums ?? [])
                        case .Artist:
                            self.recordsArray.append(contentsOf: response.artists ?? [])
                        case .Track:
                            self.recordsArray.append(contentsOf: response.tracks ?? [])
                        default:
                            debugPrint("unknown selection type")
                    }
                    self.delegate?.onFetchCompleted()
                }
        }
    }
}
