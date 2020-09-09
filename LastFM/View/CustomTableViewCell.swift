//
//  CustomTableViewCell.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var artWorkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(title: String, url:String) {
        titleLabel.text = title
        
        var cellFrame = self.frame.size
        cellFrame.height =  cellFrame.height - 15
        cellFrame.width =  cellFrame.width - 15
        self.artWorkImageView.sd_setImage(with: URL(string: url), placeholderImage: nil, options: [], completed: { [weak self] (theImage, error, cache, url) in
            guard let downloadedImage = theImage else {
                self?.heightConstraint.constant = 0.0
                return
            }
            self?.heightConstraint.constant = self?.getAspectRatioAccordingToiPhones(cellImageFrame: cellFrame,downloadedImage: downloadedImage) ?? 0.0
        })
    }
    
    private func getAspectRatioAccordingToiPhones(cellImageFrame:CGSize,downloadedImage: UIImage)->CGFloat {
        let widthOffset = downloadedImage.size.width - cellImageFrame.width
        let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
        let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
        let effectiveHeight = downloadedImage.size.height - heightOffset
        return(effectiveHeight)
    }
}
