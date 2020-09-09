//
//  SearchView.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import UIKit

protocol SearchViewDelegate: UITextFieldDelegate {
    func searchButtonTapped(with searchText:String)
}

class SearchView: UIView {
    
    @IBOutlet var contentView:UIView!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var delegate: SearchViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(FileNameIdentifiers.SearchView, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func setDelegate(delegate: SearchViewDelegate) {
        self.delegate = delegate
        searchTextfield.delegate = delegate
    }
    
    func getSearchText() -> String {
        return searchTextfield.text ?? ""
    }
    
    func resignResponder() {
        searchTextfield.resignFirstResponder()
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        resignResponder()
        delegate?.searchButtonTapped(with: searchTextfield.text ?? "")
    }
}
