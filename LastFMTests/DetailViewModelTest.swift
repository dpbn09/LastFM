//
//  DetailViewModelTest.swift
//  LastFMTests
//
//  Created by Deepanshu Bansal on 09/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

@testable import LastFM
import XCTest
import Cuckoo

class DetailViewModelTest: XCTestCase {
    
    var mockDetailViewModelDelegate:MockDetailViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        mockDetailViewModelDelegate = MockDetailViewModelDelegate()
        stub(mockDetailViewModelDelegate) { stub in
            when(stub.populateData(name: "test", artist: "test", mbid: "test", url: "test", listner: "test", streamable: "test")).thenDoNothing()
            when(stub.populateData(name: "test", artist: "", mbid: "test", url: "test", listner: "", streamable: "test")).thenDoNothing()
            when(stub.populateData(name: "test", artist: "test", mbid: "test", url: "test", listner: "", streamable: "test")).thenDoNothing()
        }
    }

    override func tearDown() {
        super.tearDown()
        mockDetailViewModelDelegate = nil
    }

    func testFetchDataForUnknown() {
        let viewModel = DetailViewModel(delegate: mockDetailViewModelDelegate, selectedOption:  LastFM.Selection.Unknown, record: LastFM.TrackData(name: "test", artist: "test", mbid: "test", url: "test", listeners: "test", streamable: "test", image: [LastFM.ImageData(imageUrl: "test", imageSize: "test")]))
        XCTAssertFalse(viewModel.fetchData())
    }

    func testFetchDataForArtist() {
        let viewModel = DetailViewModel(delegate: mockDetailViewModelDelegate, selectedOption:  LastFM.Selection.Artist, record: LastFM.ArtistData(name: "test", listeners: "test", mbid: "test", url: "test", streamable: "test", image: [LastFM.ImageData(imageUrl: "test", imageSize: "test")]))
        XCTAssertTrue(viewModel.fetchData())
    }
    
    func testFetchDataForTrack() {
        let viewModel = DetailViewModel(delegate: mockDetailViewModelDelegate, selectedOption:  LastFM.Selection.Track, record: LastFM.TrackData(name: "test", artist: "test", mbid: "test", url: "test", listeners: "test", streamable: "test", image: [LastFM.ImageData(imageUrl: "test", imageSize: "test")]))
        XCTAssertTrue(viewModel.fetchData())
    }
    
    func testFetchDataForAlbum() {
        let viewModel = DetailViewModel(delegate: mockDetailViewModelDelegate, selectedOption:  LastFM.Selection.Album, record: LastFM.AlbumData(name: "test", artist: "test", mbid: "test", url: "test", streamable: "test", image: [LastFM.ImageData(imageUrl: "test", imageSize: "test")]))
        XCTAssertTrue(viewModel.fetchData())
    }
}
