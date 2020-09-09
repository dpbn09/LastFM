//
//  FMDetailViewController.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import UIKit

class FMDetailViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var mbidLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var listenersLbl: UILabel!
    @IBOutlet weak var streamableLbl: UILabel!
    
    private var viewModel: DetailViewModel!
    
    var data:Any?
    var selectedOption:Selection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard viewModel.fetchData() else {
            debugPrint("some error occurred while fetching data from viewmodel")
            return
        }
    }
    
    private func initializeController() {
        viewModel = DetailViewModel(delegate: self, selectedOption: selectedOption!, record: data!)
    }
}


extension FMDetailViewController: DetailViewModelDelegate {
    func populateData(name: String, artist: String, mbid: String, url: String, listner: String, streamable: String) {
        if name.isEmpty {
            nameLbl.isHidden = true
            nameLbl.alpha = 0.0
        }
        else {
            title = name
            nameLbl.text = name
        }
        if artist.isEmpty {
            artistLbl.isHidden = true
            artistLbl.alpha = 0.0
        }
        else {
            artistLbl.text = artist
        }
        if mbid.isEmpty {
            mbidLbl.isHidden = true
            mbidLbl.alpha = 0.0
        }
        else {
            mbidLbl.text = mbid
        }
        if url.isEmpty {
            urlLbl.isHidden = true
            urlLbl.alpha = 0.0
        }
        else {
            urlLbl.text = url
        }
        if listner.isEmpty {
            listenersLbl.isHidden = true
            listenersLbl.alpha = 0.0
        }
        else {
            listenersLbl.text = listner
        }
        if streamable.isEmpty {
            streamableLbl.isHidden = true
            streamableLbl.alpha = 0.0
        }
        else {
            streamableLbl.text = streamable
        }
    }
}
