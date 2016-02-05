//
//  ViewController.swift
//  Brush
//
//  Created by Jake Pitkin on 2/4/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

// A container of all the subviews. This containers role is to position the subviews it contains.
class ControlPanelView: UIView {
    private var _colorWheel: ColorWheel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        _colorWheel = ColorWheel()
        _colorWheel!.backgroundColor = UIColor.redColor()
        
        addSubview(_colorWheel!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var r: CGRect = bounds
        (_colorWheel!.frame, r) = r.divide(r.height, fromEdge: .MinYEdge)
    }
    
    var colorWheel: ColorWheel { return _colorWheel }
}