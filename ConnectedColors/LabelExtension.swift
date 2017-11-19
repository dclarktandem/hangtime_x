//
//  LabelExtension.swift
//  Hangtime 0.8
//
//  Created by TandemSeven on 12/31/16.
//  Copyright © 2016 TandemSeven. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func fitFontForSize( minFontSize : CGFloat = 5.0, maxFontSize : CGFloat = 300.0, accuracy : CGFloat = 1.0) {
        var minFontSize = minFontSize
        var maxFontSize = maxFontSize
        assert(maxFontSize > minFontSize)
        layoutIfNeeded() // Can be removed at your own discretion
        let constrainedSize = bounds.size
        while maxFontSize - minFontSize > accuracy {
            let midFontSize : CGFloat = ((minFontSize + maxFontSize) / 2)
            font = font.withSize(midFontSize)
            sizeToFit()
            let checkSize : CGSize = bounds.size
            if  checkSize.height < constrainedSize.height && checkSize.width < constrainedSize.width {
                minFontSize = midFontSize
            } else {
                maxFontSize = midFontSize
            }
        }
        font = font.withSize(minFontSize - 0.8)
        sizeToFit()
        layoutIfNeeded() // Can be removed at your own discretion
    }
    
}
