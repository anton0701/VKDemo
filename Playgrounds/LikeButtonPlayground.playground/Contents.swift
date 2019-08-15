import PlaygroundSupport
import UIKit

var str = "Hello, playground"
#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//// Present the view controller in the Live View window

class LikeButton: UIButton {
    //// Color Declarations
    private let fillColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)

    
    
    private lazy var heartLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }
        
        //// Subframes
        let group: CGRect = CGRect(x: frame.minX + 72, y: frame.minY + fastFloor((frame.height - 56) * 0.10784 + 0.5), width: fastFloor((frame.width - 72) * 0.74149 + 0.5), height: frame.height - 56 - fastFloor((frame.height - 56) * 0.10784 + 0.5))
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group.minX + 0.27104 * group.width, y: group.minY + 1.00000 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.23309 * group.width, y: group.minY + 0.92797 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.30023 * group.height), controlPoint1: CGPoint(x: group.minX + 0.09215 * group.width, y: group.minY + 0.67688 * group.height), controlPoint2: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.50766 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.14907 * group.width, y: group.minY + 0.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.13101 * group.height), controlPoint2: CGPoint(x: group.minX + 0.06505 * group.width, y: group.minY + 0.00000 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.27104 * group.width, y: group.minY + 0.11463 * group.height), controlPoint1: CGPoint(x: group.minX + 0.19515 * group.width, y: group.minY + 0.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.24122 * group.width, y: group.minY + 0.04367 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.39301 * group.width, y: group.minY + 0.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.30085 * group.width, y: group.minY + 0.04367 * group.height), controlPoint2: CGPoint(x: group.minX + 0.34693 * group.width, y: group.minY + 0.00000 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.54208 * group.width, y: group.minY + 0.30023 * group.height), controlPoint1: CGPoint(x: group.minX + 0.47703 * group.width, y: group.minY + 0.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.54208 * group.width, y: group.minY + 0.13101 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.30898 * group.width, y: group.minY + 0.92797 * group.height), controlPoint1: CGPoint(x: group.minX + 0.54208 * group.width, y: group.minY + 0.50766 * group.height), controlPoint2: CGPoint(x: group.minX + 0.44992 * group.width, y: group.minY + 0.67688 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.27104 * group.width, y: group.minY + 1.00000 * group.height))
        bezierPath.close()
        UIColor.white.setFill()
        bezierPath.fill()
        UIColor.lightGray.setStroke()
        bezierPath.lineWidth = 6.5
        bezierPath.miterLimit = 4
        bezierPath.stroke()

        layer.path = bezierPath.cgPath
        return layer
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      configureLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      configureLayers()
    }
    
    private func configureLayers() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.addSublayer(heartLayer)
    }
}

let likeButton = LikeButton(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
PlaygroundPage.current.liveView = likeButton
