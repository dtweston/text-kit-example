//
//  UnderlineLayoutManager.swift
//  UnderlineStyles
//
//  Created by Dave Weston on 8/19/15.
//  Copyright © 2015 Binocracy. All rights reserved.
//

import UIKit

class UnderlineLayoutManager: NSLayoutManager {
    
    func drawFancyUnderlineForRect(rect: CGRect) {
        let left = CGRectGetMinX(rect)
        let bottom = CGRectGetMaxY(rect)
        let width = CGRectGetWidth(rect)
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(left, bottom))
        var x = left
        var y = bottom
        var i = 0
        while (x <= left + width) {
            path.addLineToPoint(CGPointMake(x, y))
            x += 2
            if i % 2 == 0 {
                y = bottom + 2.0
            }
            else {
                y = bottom
            }
            i++;
        }
        
        UIColor.greenColor().setStroke()
        path.stroke()
    }
    
    override func drawUnderlineForGlyphRange(glyphRange: NSRange, underlineType underlineVal: NSUnderlineStyle, baselineOffset: CGFloat, lineFragmentRect lineRect: CGRect, lineFragmentGlyphRange lineGlyphRange: NSRange, containerOrigin: CGPoint) {
        
        if let container = textContainerForGlyphAtIndex(glyphRange.location, effectiveRange: nil) {
            let boundingRect = boundingRectForGlyphRange(glyphRange, inTextContainer: container)
            let offsetRect = CGRectOffset(boundingRect, containerOrigin.x, containerOrigin.y)
            
            drawFancyUnderlineForRect(offsetRect)
        }
    }
}
