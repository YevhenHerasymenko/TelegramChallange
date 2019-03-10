//
//  TestView.swift
//  Telegram Coding Contest
//
//  Created by Yevhen Herasymenko on 3/9/19.
//  Copyright © 2019 YevhenHerasymenko. All rights reserved.
//

import UIKit

class TestView: UIView {

  let points: [CGPoint] = [
    CGPoint(x: 0, y: 1),
    CGPoint(x: 12, y: 3),
    CGPoint(x: 5, y: 4),
    CGPoint(x: 9, y: 20),
    CGPoint(x: 13, y: 2),
    CGPoint(x: 3, y: 11),
    CGPoint(x: 8, y: 11),
    CGPoint(x: 7, y: 2)
    ].sorted { $0.x < $1.x }

  var shapeLayer = CAShapeLayer()

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.gray.cgColor
    shapeLayer.lineWidth = 3

    Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { (timer) in
      self.draw()
    }
    let aPath = UIBezierPath()
    aPath.move(to: CGPoint(x: 0, y: 0))

    let randomInt = CGFloat.random(in: 10..<20)

    for point in points {
      aPath.addLine(to: CGPoint(x: point.x * 20, y: point.y * randomInt))
    }
    shapeLayer.path = aPath.cgPath
    layer.addSublayer(shapeLayer)
  }

  func draw() {
    let aPath = UIBezierPath()
    aPath.move(to: CGPoint(x: 0, y: 0))

    let randomInt = CGFloat.random(in: 5..<20)

    for point in points {
      aPath.addLine(to: CGPoint(x: point.x * 20, y: point.y * randomInt))
    }

    let animation = CABasicAnimation(keyPath: "path")
    animation.fromValue = shapeLayer.path
    animation.toValue = aPath.cgPath
    animation.duration = 2
    shapeLayer.path = aPath.cgPath
    shapeLayer.add(animation, forKey: "MyAnimation")
    //self.shapeLayer = shapeLayer
  }
}
