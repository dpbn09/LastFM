//
//  DetailViewModel.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 09/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate: class {
    func populateData(name:String, artist:String, mbid:String, url:String, listner:String, streamable:String)
}

final class DetailViewModel {
    private weak var delegate: DetailViewModelDelegate?
    private var selectedOption:Selection?
    private var record:Any?
    
    init(delegate:DetailViewModelDelegate, selectedOption:Selection, record:Any) {
        self.delegate = delegate
        self.selectedOption = selectedOption
        self.record = record
    }
    
    func setSetectedOption(selectedOption:Selection) {
        self.selectedOption = selectedOption
    }
    
    func setRecord(record: Any) {
        self.record = record
    }
    
    func fetchData() -> Bool {
        var retVal = false
        switch selectedOption {
            case .Album:
                let data = record as! AlbumData
                self.delegate?.populateData(name: data.name ?? "", artist: data.artist ?? "", mbid: data.mbid ?? "", url: data.url ?? "", listner: "", streamable: data.streamable ?? "")
                retVal = true
            case .Artist:
                let data = record as! ArtistData
                self.delegate?.populateData(name: data.name ?? "", artist: "", mbid: data.mbid ?? "", url: data.url ?? "", listner: "", streamable: data.streamable ?? "")
                retVal = true
            case .Track:
                let data = record as! TrackData
                self.delegate?.populateData(name: data.name ?? "", artist: data.artist ?? "", mbid: data.mbid ?? "", url: data.url ?? "", listner: data.listeners ?? "", streamable: data.streamable ?? "")
                retVal = true
            default:
                debugPrint("unknown selection type")
                retVal = false
        }
        return retVal
    }
}
