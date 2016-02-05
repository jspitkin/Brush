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
    private var _endCapChooser: strokeEndCapChooser!
    private var _joinChooser: strokeJoinChooser!
    private var _widthChooser: strokeWidthChooser!
    private var _brushPreview: brushPreview!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        _colorWheel = ColorWheel()
        _colorWheel.backgroundColor = UIColor.redColor()
        _colorWheel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_colorWheel)
        
        _endCapChooser = strokeEndCapChooser()
        _endCapChooser.backgroundColor = UIColor.whiteColor()
        _endCapChooser.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_endCapChooser)
        
        _joinChooser = strokeJoinChooser()
        _joinChooser.backgroundColor = UIColor.purpleColor()
        _joinChooser.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_joinChooser)
        
        _widthChooser = strokeWidthChooser()
        _widthChooser.backgroundColor = UIColor.yellowColor()
        _widthChooser.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_widthChooser)
        
        _brushPreview = brushPreview()
        _brushPreview.backgroundColor = UIColor.blueColor()
        _brushPreview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_brushPreview)
        
        let views: [String:UIView] = ["wheel":_colorWheel, "cap":_endCapChooser, "join":_joinChooser, "width":_widthChooser, "preview":_brushPreview]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[wheel]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[cap]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[join]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[width]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[preview]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[wheel]-[cap]-[join]-[width]-[preview]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        addConstraint(NSLayoutConstraint(item: _colorWheel, attribute: .Height, relatedBy: .Equal, toItem: _endCapChooser, attribute: .Height, multiplier: 5.0, constant: 0.0))
        
        addConstraint(NSLayoutConstraint(item: _endCapChooser, attribute: .Height, relatedBy: .Equal, toItem: _joinChooser, attribute: .Height, multiplier: 1.0, constant: 0.0))
        
        addConstraint(NSLayoutConstraint(item: _joinChooser, attribute: .Height, relatedBy: .Equal, toItem: _widthChooser, attribute: .Height, multiplier: 1.0, constant: 0.0))
        
        addConstraint(NSLayoutConstraint(item: _widthChooser, attribute: .Height, relatedBy: .Equal, toItem: _brushPreview, attribute: .Height, multiplier: 1.0, constant: 0.0))
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var colorWheel: ColorWheel { return _colorWheel }
    var endCapChooser: strokeEndCapChooser { return _endCapChooser }
    var joinChooser: strokeJoinChooser { return _joinChooser }
    var widthChooser: strokeWidthChooser { return _widthChooser }
    var preview: brushPreview { return _brushPreview }
}