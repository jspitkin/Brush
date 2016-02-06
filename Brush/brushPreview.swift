//
//  brushPreview.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class brushPreview: UIView {
    private var _color: CGColor!
    private var _endCap: CGLineCap!
    private var _lineJoin: CGLineJoin!
    private var _width: Float!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _endCap = CGLineCap.Round
        _color = UIColor.whiteColor().CGColor
        _lineJoin = CGLineJoin.Round
        _width = 15.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, CGFloat(_width))
        CGContextSetStrokeColorWithColor(context, _color)
        CGContextSetLineCap(context, _endCap)
        CGContextSetLineJoin(context, _lineJoin)
        
        
        CGContextMoveToPoint(context, 0.0, 0.0)
        CGContextAddLineToPoint(context, 10.0, 10.0)
        CGContextStrokePath(context)
        
    }
    
    var color: CGColor {
        get { return _color }
        set {
            _color = newValue
            setNeedsDisplay()
        }
    }
    
    var endCap: CGLineCap {
        get { return _endCap }
        set {
            _endCap = newValue
            setNeedsDisplay()
        }
    }
    
    var lineJoin: CGLineJoin {
        get { return _lineJoin }
        set {
            _lineJoin = newValue
            setNeedsDisplay()
        }
    }
    
    var width: Float {
        get { return _width }
        set {
            _width = newValue
            setNeedsDisplay()
        }
    }
}
