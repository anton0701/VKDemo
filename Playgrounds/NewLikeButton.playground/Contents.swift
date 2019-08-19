import PlaygroundSupport
import Foundation
import UIKit

@IBDesignable
class LikeButton: UIControl {
    
    private let fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    private let likedFillColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    private let notLikedFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)
    
    override var frame: CGRect {
        didSet {
            configureAppearance()
        }
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
                
        for layer in [
          borderLayer,
          heartLayer
        ] {
          layer.bounds = bounds
          layer.position = center
        }
        configureAppearance()
    }
    
    private lazy var heartLayer: CAShapeLayer = {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 50, y: 81))
        bezierPath.addLine(to: CGPoint(x: 45.66, y: 76.97))
        bezierPath.addCurve(to: CGPoint(x: 19, y: 41.81), controlPoint1: CGPoint(x: 29.54, y: 62.91), controlPoint2: CGPoint(x: 19, y: 53.43))
        bezierPath.addCurve(to: CGPoint(x: 36.05, y: 25), controlPoint1: CGPoint(x: 19, y: 32.34), controlPoint2: CGPoint(x: 26.44, y: 25))
        bezierPath.addCurve(to: CGPoint(x: 50, y: 31.42), controlPoint1: CGPoint(x: 41.32, y: 25), controlPoint2: CGPoint(x: 46.59, y: 27.45))
        bezierPath.addCurve(to: CGPoint(x: 63.95, y: 25), controlPoint1: CGPoint(x: 53.41, y: 27.45), controlPoint2: CGPoint(x: 58.68, y: 25))
        bezierPath.addCurve(to: CGPoint(x: 81, y: 41.81), controlPoint1: CGPoint(x: 73.56, y: 25), controlPoint2: CGPoint(x: 81, y: 32.34))
        bezierPath.addCurve(to: CGPoint(x: 54.34, y: 76.97), controlPoint1: CGPoint(x: 81, y: 53.43), controlPoint2: CGPoint(x: 70.46, y: 62.91))
        bezierPath.addLine(to: CGPoint(x: 50, y: 81))
        bezierPath.close()
        UIColor.white.setFill()
        bezierPath.fill()
        UIColor.lightGray.setStroke()
        bezierPath.lineWidth = 6.5
        bezierPath.miterLimit = 4
        bezierPath.stroke()

        let layer = CAShapeLayer()
        layer.path = bezierPath.cgPath
        layer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        layer.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        
        return layer
    }()
    
    private lazy var borderLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 4, y: 7, width: 201.5, height: 91.5), cornerRadius: 39)
        fillColor.setStroke()
        rectanglePath.lineWidth = 3
        rectanglePath.lineCapStyle = .round
        rectanglePath.lineJoinStyle = .round
        rectanglePath.stroke()

        layer.path = rectanglePath.cgPath
        layer.strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        layer.fillColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        
        return layer
    }()
            
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureAppearance()
    }
    
    private func configureAppearance() {
        configureLayers()
        configOther()
    }
    
    private func configureLayers() {
            layer.addSublayer(borderLayer)
            layer.addSublayer(heartLayer)
    }
    
    private func configOther() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        configureAppearance()
    }
}


let likeButton = LikeButton(frame: CGRect(x: 0, y: 0, width: 210, height: 105))
PlaygroundPage.current.liveView = likeButton
