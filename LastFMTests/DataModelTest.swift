//
//  DataModelTest.swift
//  LastFMTests
//
//  Created by Deepanshu Bansal on 09/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import XCTest

class DataModelTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDecodeModelWithAlbumData() {
        let path = Bundle(for: type(of: self)).path(forResource: "sampleAlbum", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        if let jsonData = data {
            guard let decodedResponse = try? JSONDecoder().decode(DataModel.self, from: jsonData)
                else {
                    XCTAssert(false, "Error occurred while decoding")
                    return
            }
            XCTAssertTrue(decodedResponse.results?.albums?.count != 0)
            XCTAssertNil(decodedResponse.results?.artists)
            XCTAssertNil(decodedResponse.results?.tracks)
        }
    }
    
    func testDecodeModelWithArtistData() {
        let path = Bundle(for: type(of: self)).path(forResource: "sampleArtist", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        if let jsonData = data {
            guard let decodedResponse = try? JSONDecoder().decode(DataModel.self, from: jsonData)
                else {
                    XCTAssert(false, "Error occurred while decoding")
                    return
            }
            XCTAssertTrue(decodedResponse.results?.artists?.count != 0)
            XCTAssertNil(decodedResponse.results?.albums)
            XCTAssertNil(decodedResponse.results?.tracks)
        }
    }
    
    func testDecodeModelWithTrackData() {
        let path = Bundle(for: type(of: self)).path(forResource: "sampleTrack", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        if let jsonData = data {
            guard let decodedResponse = try? JSONDecoder().decode(DataModel.self, from: jsonData)
                else {
                    XCTAssert(false, "Error occurred while decoding")
                    return
            }
            XCTAssertTrue(decodedResponse.results?.tracks?.count != 0)
            XCTAssertNil(decodedResponse.results?.artists)
            XCTAssertNil(decodedResponse.results?.albums)
        }
    }
}
