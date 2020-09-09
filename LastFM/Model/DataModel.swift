//
//  DataModel.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Foundation

struct ImageData: Codable {
    let imageUrl: String?
    let imageSize: String?
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "#text", imageSize = "size";
    }
    
    init(imageUrl:String, imageSize:String) {
        self.imageUrl = imageUrl
        self.imageSize = imageSize
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageUrl = try String(container.decode(String.self, forKey: .imageUrl))
        imageSize = try String(container.decode(String.self, forKey: .imageSize))
    }
}

struct ArtistData: Codable {
    let name: String?
    let listeners: String?
    let mbid: String?
    let url: String?
    let streamable: String?
    let image: [ImageData]?
}

struct AlbumData: Codable {
    let name: String?
    let artist:String?
    let mbid: String?
    let url: String?
    let streamable: String?
    let image: [ImageData]?
}

struct TrackData: Codable {
    let name: String?
    let artist:String?
    let mbid: String?
    let url: String?
    let listeners: String?
    let streamable: String?
    let image: [ImageData]?
}

struct SearchResult: Codable {
    let page: String?
    let totalResults: String?
    let startIndex: String?
    let itemsPerPage: String?
    let albums:[AlbumData]?
    let artists:[ArtistData]?
    let tracks:[TrackData]?
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "opensearch:totalResults"
        case startIndex = "opensearch:startIndex"
        case itemsPerPage = "opensearch:itemsPerPage"
        case albums = "albummatches"
        case artists = "artistmatches"
        case tracks = "trackmatches"
        case page = "opensearch:Query"
    }
    
    enum PageDataKeys: String, CodingKey {
        case text = "#text"
        case role
        case startPage
    }
    
    enum AlbumListKey: String, CodingKey {
        case album
    }
    
    enum ArtistListKey: String, CodingKey {
        case artist
    }
    
    enum TrackListKey: String, CodingKey {
        case track
    }


    enum AlbumDetailsKeys: String, CodingKey {
        case name
        case artist
        case mbid
        case url
        case streamable
        case image
    }
    
    enum ArtistDetailsKeys: String, CodingKey {
        case name
        case listeners
        case mbid
        case url
        case streamable
        case image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.totalResults = try values.decode(String.self, forKey: .totalResults)
        self.startIndex = try values.decode(String.self, forKey: .startIndex)
        self.itemsPerPage = try values.decode(String.self, forKey: .itemsPerPage)
        if values.contains(.albums) {
            let albumListValues = try values.nestedContainer(keyedBy: AlbumListKey.self, forKey: .albums)
            self.albums = try albumListValues.decodeIfPresent([AlbumData].self, forKey: .album)
        }
        else {
            self.albums = nil
        }
        if values.contains(.artists) {
            let artistListValues = try values.nestedContainer(keyedBy: ArtistListKey.self, forKey: .artists)
            self.artists = try artistListValues.decodeIfPresent([ArtistData].self, forKey: .artist)
        }
        else {
            self.artists = nil
        }
        if values.contains(.tracks) {
            let trackListValues = try values.nestedContainer(keyedBy: TrackListKey.self, forKey: .tracks)
            self.tracks = try trackListValues.decodeIfPresent([TrackData].self, forKey: .track)
        }
        else {
            self.tracks = nil
        }
        if values.contains(.page) {
            let pageValue = try values.nestedContainer(keyedBy: PageDataKeys.self, forKey: .page)
            self.page = try pageValue.decodeIfPresent(String.self, forKey: .startPage)
        }
        else {
            self.page = nil
        }
    }
}

struct DataModel: Codable {
     let results: SearchResult?
     let error: String?
     let message: String?
}
