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
    private var _colorPicker: ColorPicker!
    private var _endCapChooser: strokeEndCapChooser!
    private var _joinChooser: strokeJoinChooser!
    private var _widthChooser: strokeWidthChooser!
    private var _brushPreview: brushPreview!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        _colorPicker = ColorPicker()
        _colorPicker.backgroundColor = UIColor.clearColor()
        _colorPicker.translatesAutoresizingMaskIntoConstraints = false
        _colorPicker.addTarget(self, action: "colorChanged", forControlEvents: .ValueChanged)
        addSubview(_colorPicker)
        
        _endCapChooser = strokeEndCapChooser()
        _endCapChooser.backgroundColor = UIColor.clearColor()
        _endCapChooser.translatesAutoresizingMaskIntoConstraints = false
        _endCapChooser.addTarget(self, action: "endCapChanged", forControlEvents: .ValueChanged)
        addSubview(_endCapChooser)
        
        _joinChooser = strokeJoinChooser()
        _joinChooser.backgroundColor = UIColor.clearColor()
        _joinChooser.translatesAutoresizingMaskIntoConstraints = false
        _joinChooser.addTarget(self, action: "joinChanged", forControlEvents: .ValueChanged)
        addSubview(_joinChooser)
        
        _widthChooser = strokeWidthChooser()
        _widthChooser.backgroundColor = UIColor.clearColor()
        _widthChooser.translatesAutoresizingMaskIntoConstraints = false
        _widthChooser.addTarget(self, action: "widthChanged", forControlEvents: .ValueChanged)
        addSubview(_widthChooser)
        
        _brushPreview = brushPreview()
        _brushPreview.backgroundColor = UIColor.clearColor()
        _brushPreview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_brushPreview)
        
        let views: [String:UIView] = ["wheel":_colorPicker, "cap":_endCapChooser, "join":_joinChooser, "width":_widthChooser, "preview":_brushPreview]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[wheel]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[cap]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[join]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[width]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[preview]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[wheel]-[cap]-[join]-[width]-[preview]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraint(NSLayoutConstraint(item: _colorPicker, attribute: .Height, relatedBy: .Equal, toItem: _joinChooser, attribute: .Height, multiplier: 5.0,constant: 0.0))
        addConstraint(NSLayoutConstraint(item: _endCapChooser, attribute: .Height, relatedBy: .Equal, toItem: _widthChooser, attribute: .Height, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: _joinChooser, attribute: .Height, relatedBy: .Equal, toItem: _widthChooser, attribute: .Height, multiplier: 1.75, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: _brushPreview, attribute: .Height, relatedBy: .Equal, toItem: _joinChooser, attribute: .Height, multiplier: 1.0, constant: 0.0))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func colorChanged() {
        print("Color changed to: \(_colorPicker.color)")
        _brushPreview.color = _colorPicker.color.CGColor
    }
    
    func endCapChanged() {
        print("End cap changed to: \(_endCapChooser.endCap)")
        _brushPreview.endCap = _endCapChooser.endCap
    }
    
    func widthChanged() {
        print("Width changed to: \(_widthChooser.width)")
        _brushPreview.width = _widthChooser.width
    }
    
    func joinChanged() {
        print("Join changed: \(_joinChooser.join)")
        _brushPreview.lineJoin = _joinChooser.join
        
    }
    
    var colorPicker: ColorPicker { return _colorPicker }
    var endCapChooser: strokeEndCapChooser { return _endCapChooser }
    var joinChooser: strokeJoinChooser { return _joinChooser }
    var widthChooser: strokeWidthChooser { return _widthChooser }
    var preview: brushPreview { return _brushPreview }
}