//
//  SegmentControlView.swift
//  SegmentControl
//
//  Created by Petar Ivanov on 12/3/17.
//  Copyright © 2017 Petar Ivanov. All rights reserved.
//

import UIKit

class SegmentControlView: UIView {
    
    private var scale: CGFloat = 0.6
    
    private var circleRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    private var circleCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private func pathForSingleSegment(startAngle: CGFloat, endAngle: CGFloat, color: UIColor) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        color.set()
        path.lineWidth = 60.0
        path.lineCapStyle = .round

        return path
    }
    
    private func calculateEndAngle(segmentSize: Int) -> Double {
        return Double((360 * segmentSize)) / 100.0
    }
    
    private func angleToRadians(angle: CGFloat) -> CGFloat {
        return angle * CGFloat.pi / 180
    }
    
    func getPointOnCircle(radius: CGFloat, center: CGPoint, angle: CGFloat) -> CGPoint {
        let theta = angle * CGFloat.pi / 180

        let x = radius * CGFloat(cos(theta)) + center.x
        let y = radius * CGFloat(sin(theta)) + center.y
        
        return CGPoint(x: x, y: y)
    }
    
    private func drawSegments() {
        
        // set initial settings for the drawing of the path
        let colors: [UIColor] = [.purple, .red, .orange, .blue, .green] // colors of the segments
        let numberOfSegments = 5
        let segments: [Int] = [22, 24, 14, 24, 16] // size of the segments, the sum should be 100
        
        var startAngle: CGFloat
        var endAngle: CGFloat
        var color: UIColor
        
        startAngle = 0
        
        for i in 0..<numberOfSegments {
            // calculate the new end angle of the path
            endAngle   = startAngle + CGFloat(calculateEndAngle(segmentSize: segments[i]))
            color = colors[i]
            
            let path = pathForSingleSegment(startAngle: angleToRadians(angle: startAngle), endAngle: angleToRadians(angle: endAngle), color: color)
            
//            let currentPoint = path.currentPoint
            
            // configure string with attributes
            let numberString = String(segments[i])
            let numberStringAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white,
                NSAttributedStringKey.font: UIFont(name: "Arial", size: 20.0)!
            ]
            let numberAttributeString = NSAttributedString(string: numberString, attributes: numberStringAttributes)
            
            // calculate the point where the string will be drawed
            let currentPoint = getPointOnCircle(radius: circleRadius, center: circleCenter, angle: endAngle-30)

            path.move(to: currentPoint)
            path.stroke()
            
            numberAttributeString.draw(at: currentPoint)
            
            // calculate the new start angle of the path
            startAngle = endAngle
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        drawSegments()
    }
    
}
