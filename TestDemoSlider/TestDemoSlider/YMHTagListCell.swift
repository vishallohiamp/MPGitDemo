//
//  YMHTagListCell.swift
//  TestDemoSlider
//
//  Created by Vishal Lohia on 12/28/17.
//  Copyright © 2017 Vishal Lohia. All rights reserved.
//

import Foundation
import UIKit

class YMHTagListCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitleCell:UILabel?
    @IBOutlet var labelWidthLayoutConstraint: NSLayoutConstraint!

    class func fromNib() -> YMHTagListCell?
    {
        var cell: YMHTagListCell?
        let nibViews = Bundle.main.loadNibNamed("YMHTagLabelCell", owner: nil, options: nil) as! [YMHTagListCell]
        cell = nibViews.last!
        
//        for nibView in nibViews {
//            if let cellView = nibView as? YMHTagListCell {
//                cell = cellView
//            }
//        }
        return cell
    }
    
    func configureCell() {
        self.lblTitleCell?.preferredMaxLayoutWidth = 50.0
    }
}
