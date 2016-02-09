//
//  ColorWheel.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class ColorPicker: UIControl {
    private var _color: UIColor!
    private var _redValue: Float!
    private var _greenValue: Float!
    private var _blueValue: Float!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _redValue = 127
        _greenValue = 127
        _blueValue = 127
        _color = UIColor(red: CGFloat(_redValue/255), green: CGFloat(_greenValue/255), blue: CGFloat(_blueValue/255), alpha: 1.0)
        
        
        let redSlider: UISlider = UISlider(frame: CGRectMake(15, 310, 370, 30))
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 255.0
        redSlider.value = 127
        redSlider.minimumTrackTintColor = UIColor.redColor()
        redSlider.thumbTintColor = UIColor.redColor()
        redSlider.addTarget(self, action: "redChanged:", forControlEvents: UIControlEvents.ValueChanged)
        addSubview(redSlider)
        
        let greenSlider: UISlider = UISlider(frame: CGRectMake(15, 350, 370, 30))
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 255.0
        greenSlider.value = 127
        greenSlider.minimumTrackTintColor = UIColor.greenColor()
        greenSlider.thumbTintColor = UIColor.greenColor()
        greenSlider.addTarget(self, action: "greenChanged:", forControlEvents: UIControlEvents.ValueChanged)
        addSubview(greenSlider)
        
        let blueSlider: UISlider = UISlider(frame: CGRectMake(15, 390, 370, 30))
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 255.0
        blueSlider.value = 127
        blueSlider.minimumTrackTintColor = UIColor.blueColor()
        blueSlider.thumbTintColor = UIColor.blueColor()
        blueSlider.addTarget(self, action: "blueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        addSubview(blueSlider)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        CGContextAddRect(context, CGRectMake(bounds.width * 0.05, 10, bounds.width * 0.9, bounds.height * 0.65))
        CGContextSetFillColorWithColor(context, _color.CGColor)
        CGContextFillPath(context)
        
    }
    
    func redChanged(sender: UISlider) {
        _redValue = sender.value
        _color = UIColor(red: CGFloat(_redValue/255), green: CGFloat(_greenValue/255), blue: CGFloat(_blueValue/255), alpha: 1.0)
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
        setNeedsDisplay()
    }
    
    func greenChanged(sender: UISlider) {
        _greenValue = sender.value
        _color = UIColor(red: CGFloat(_redValue/255), green: CGFloat(_greenValue/255), blue: CGFloat(_blueValue/255), alpha: 1.0)
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
        setNeedsDisplay()
    }
    
    func blueChanged(sender: UISlider) {
        _blueValue = sender.value
        _color = UIColor(red: CGFloat(_redValue/255), green: CGFloat(_greenValue/255), blue: CGFloat(_blueValue/255), alpha: 1.0)
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
        setNeedsDisplay()
    }
    
    
    var color: UIColor { return _color }
}
