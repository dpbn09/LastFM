//
//  SearchViewModelTest.swift
//  LastFMTests
//
//  Created by Deepanshu Bansal on 09/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

@testable import LastFM
import XCTest
import Cuckoo

class SearchViewModelTest: XCTestCase {

    var viewModel : SearchViewModel?
    
    override func setUp() {
        super.setUp()
        
        let mockSearchViewModelDelegate = MockSearchViewModelDelegate()
        stub(mockSearchViewModelDelegate) { stub in
            when(stub.onFetchFailed(with: "Enter data in field to search")).thenDoNothing()
            when(stub.onFetchCompleted()).thenDoNothing()
        }
        viewModel = SearchViewModel(delegate: mockSearchViewModelDelegate)
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testCheckCounts() {
        XCTAssertEqual(viewModel?.currentCount, 0)
        XCTAssertEqual(viewModel?.totalCount, 0)
    }

    func testDataForArtist() {
        viewModel?.setSelectionOption(option: .Artist)
        viewModel?.setRecordsArray(data: [ArtistData(name: "test", listeners: "", mbid: "", url: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        let (title, url) = viewModel?.data(at: 0) ?? ("", "")
        XCTAssertEqual(title, "test")
        XCTAssertEqual(url, "testurl")
    }
    
    func testDataForAlbum() {
        viewModel?.setSelectionOption(option: .Album)
        viewModel?.setRecordsArray(data: [AlbumData(name: "test", artist: "", mbid: "", url: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        let (title, url) = viewModel?.data(at: 0) ?? ("", "")
        XCTAssertEqual(title, "test")
        XCTAssertEqual(url, "testurl")
    }
    
    func testDataForTrack() {
        viewModel?.setSelectionOption(option: .Track)
        viewModel?.setRecordsArray(data: [TrackData(name: "test", artist: "", mbid: "", url: "", listeners: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        let (title, url) = viewModel?.data(at: 0) ?? ("", "")
        XCTAssertEqual(title, "test")
        XCTAssertEqual(url, "testurl")
    }
    
    func testFetchDataOnUnknownStatus() {
        let mockHTTPManagerClient = MockHTTPManager()
        stub(mockHTTPManagerClient) { stub in
            when(stub.fetchData(with: "", page: 1)).thenDoNothing()
        }
        viewModel?.setClient(client: mockHTTPManagerClient)
        viewModel?.setSelectionOption(option: .Artist)
        viewModel?.setRecordsArray(data: [ArtistData(name: "test", listeners: "", mbid: "", url: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        viewModel?.fetchData(selection: Selection.Unknown, searchText: "")
    }
    
    func testFetchDataOnEmptyData() {
        let mockHTTPManagerClient = MockHTTPManager()
        stub(mockHTTPManagerClient) { stub in
            when(stub.fetchData(with: "", page: 1)).thenDoNothing()
        }
        viewModel?.setClient(client: mockHTTPManagerClient)
        viewModel?.setSelectionOption(option: .Artist)
        viewModel?.setRecordsArray(data: [ArtistData(name: "test", listeners: "", mbid: "", url: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        viewModel?.fetchData(selection: Selection.Unknown, searchText: "test")
        XCTAssertEqual(viewModel!.getSelectedOption(), Selection.Unknown)
    }
    
    
    func testFetchDataForArtist() {
        let mockHTTPManagerClient = MockHTTPManager()
        stub(mockHTTPManagerClient) { stub in
            when(stub.fetchData(with: "", page: 1)).thenDoNothing()
        }
        viewModel?.setClient(client: mockHTTPManagerClient)
        viewModel?.setRecordsArray(data: [ArtistData(name: "test", listeners: "", mbid: "", url: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        viewModel?.fetchData(selection: Selection.Artist, searchText: "test")
        XCTAssertEqual(viewModel!.getSelectedOption(), Selection.Artist)
    }
    
    func testFetchDataForAlbum() {
        let mockHTTPManagerClient = MockHTTPManager()
        stub(mockHTTPManagerClient) { stub in
            when(stub.fetchData(with: "", page: 1)).thenDoNothing()
        }
        viewModel?.setClient(client: mockHTTPManagerClient)
        viewModel?.setRecordsArray(data: [AlbumData(name: "test", artist: "", mbid: "", url: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        viewModel?.fetchData(selection: Selection.Album, searchText: "test")
        XCTAssertEqual(viewModel!.getSelectedOption(), Selection.Album)
    }
    
    func testFetchDataForRecord() {
        let mockHTTPManagerClient = MockHTTPManager()
        stub(mockHTTPManagerClient) { stub in
            when(stub.fetchData(with: "", page: 1)).thenDoNothing()
        }
        viewModel?.setClient(client: mockHTTPManagerClient)
        viewModel?.setRecordsArray(data: [TrackData(name: "test", artist: "", mbid: "", url: "", listeners: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        viewModel?.fetchData(selection: Selection.Track, searchText: "test")
        XCTAssertEqual(viewModel!.getSelectedOption(), Selection.Track)
    }
    
    func testFetchDataForUnknown() {
        let mockHTTPManagerClient = MockHTTPManager()
        stub(mockHTTPManagerClient) { stub in
            when(stub.fetchData(with: "", page: 1)).thenDoNothing()
        }
        viewModel?.setClient(client: mockHTTPManagerClient)
        viewModel?.setRecordsArray(data: [TrackData(name: "test", artist: "", mbid: "", url: "", listeners: "", streamable: "", image: [ImageData(imageUrl: "testurl", imageSize: "")])])
        viewModel?.fetchData(selection: Selection.Unknown, searchText: "test")
        XCTAssertEqual(viewModel!.getSelectedOption(), Selection.Unknown)
    }
    
    func testReset() {
        viewModel?.reset()
        XCTAssertEqual(viewModel?.currentCount, 0)
        XCTAssertEqual(viewModel?.totalCount, 0)
    }
}
