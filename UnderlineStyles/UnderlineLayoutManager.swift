//
//  UnderlineLayoutManager.swift
//  UnderlineStyles
//
//  Created by Dave Weston on 8/19/15.
//  Copyright © 2015 Binocracy. All rights reserved.
//

import UIKit

class UnderlineLayoutManager: NSLayoutManager {
    override func drawUnderlineForGlyphRange(glyphRange: NSRange, underlineType underlineVal: NSUnderlineStyle, baselineOffset: CGFloat, lineFragmentRect lineRect: CGRect, lineFragmentGlyphRange lineGlyphRange: NSRange, containerOrigin: CGPoint) {
        
        if let container = textContainerForGlyphAtIndex(glyphRange.location, effectiveRange: nil) {
            let boundingRect = boundingRectForGlyphRange(glyphRange, inTextContainer: container)
            let offsetRect = CGRectOffset(boundingRect, containerOrigin.x, containerOrigin.y)
            CGContextStrokeRect(UIGraphicsGetCurrentContext(), offsetRect)
        }
    }
}
