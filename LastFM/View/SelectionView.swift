//
//  SelectionView.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import UIKit

protocol SelectionViewDelegate {
    func buttonSelected(selection:Selection)
}


class SelectionView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var artistButton: RadioButton!
    @IBOutlet weak var albumButton: RadioButton!
    @IBOutlet weak var trackButton: RadioButton!
    
    var delegate:SelectionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(FileNameIdentifiers.SelectionView, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        buildSelectionView()
    }
    
    private func buildSelectionView() {
        artistButton.tag = Selection.Artist.rawValue
        albumButton.tag = Selection.Album.rawValue
        trackButton.tag = Selection.Track.rawValue
        
        artistButton.isSelected = true
        albumButton.isSelected = false
        trackButton.isSelected = false
        
        artistButton?.alternateButton = [albumButton!, trackButton!]
        albumButton?.alternateButton = [artistButton!, trackButton!]
        trackButton?.alternateButton = [artistButton!, albumButton!]
    }
    
    func setDelegate(delegate: SelectionViewDelegate) {
        self.delegate = delegate
    }
    
    func getSelectedOption() -> Selection {
        var selectedButton:UIButton?
        if artistButton.isSelected {
            selectedButton = artistButton
        }
        else if albumButton.isSelected {
            selectedButton = albumButton
        }
        else if trackButton.isSelected {
            selectedButton = trackButton
        }
        return Selection(rawValue: selectedButton?.tag ?? Selection.Unknown.rawValue) ?? Selection.Unknown
    }
    
    @IBAction func buttonSelected(_ sender: UIButton) {
        delegate?.buttonSelected(selection: Selection(rawValue: sender.tag) ?? Selection.Unknown)
    }
}
