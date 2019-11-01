import Foundation
import UIKit
import QuartzCore


enum LikeState {
    case liked
    case notLiked
    case inProgress
}

@IBDesignable
class LikeButton: UIControl {
    
    private var likeState: LikeState = LikeState.notLiked
    private var isIdle: Bool {
        get {
            return (likeState == .inProgress) ? false : true
        }
    }
    
    private let fillColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
    private let heartStrokeColor = UIColor(white: 0.7, alpha: 1.0)
    private let borderStrokeColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
    private let likedFillColor = #colorLiteral(red: 0.9960784314, green: 0.4901960784, blue: 0.6980392157, alpha: 1)
    private let notLikedFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    private func showInProgress(_ show: Bool = true) {
        if show {
            inProgressLayer.isHidden = false
            let pulseAnimation = CASpringAnimation(keyPath: "transform.scale")
            pulseAnimation.duration = 0.45
            pulseAnimation.fromValue = 1.0
            pulseAnimation.toValue = 1.15
            pulseAnimation.autoreverses = true
            pulseAnimation.repeatCount = 1
            pulseAnimation.initialVelocity = 0.5
            pulseAnimation.damping = 0.4

            let animationGroup = CAAnimationGroup()
            animationGroup.duration = 1.1
            animationGroup.repeatCount = .greatestFiniteMagnitude
            animationGroup.animations = [pulseAnimation]

            inProgressLayer.add(animationGroup, forKey: "pulse")
        } else {
            inProgressLayer.isHidden = true
            inProgressLayer.removeAnimation(forKey: "pulse")
        }
    }

    private func animateTo(_ state: LikeState) {
        switch state {
        case .inProgress:
            break
        case .liked:
            let fromPath =
                UIBezierPath(ovalIn: CGRect(x: 14.25, y: 13.25, width: 13, height: 13))
            let toPath = UIBezierPath(cgPath: Utils.pathForCircleThatContains(rect: self.frame))
            let animation = CABasicAnimation(keyPath: "path")
            activeBackgroundLayer.mask = borderLayer2
            animation.fromValue = fromPath.cgPath
            animation.toValue = toPath.cgPath
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            animation.duration = 0.6
            
            activeBackgroundLayer.add(animation, forKey: "pathAnimation")
            
            activeBackgroundLayer.path = toPath.cgPath
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.setNeedsLayout()
            break
        case .notLiked:
            let fromPath = UIBezierPath(cgPath: Utils.pathForCircleThatContains(rect: self.frame))
            let toPath =
                UIBezierPath(ovalIn: CGRect(x: 14.25, y: 13.25, width: 13, height: 13))
            let animation = CABasicAnimation(keyPath: "path")
            animation.fromValue = fromPath
            animation.toValue = toPath
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            animation.duration = 0.6
            
            activeBackgroundLayer.add(animation, forKey: "pathAnimation")
            activeBackgroundLayer.path = toPath.cgPath
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.setNeedsLayout()
            break
        }
    }

    private lazy var heartLayer: CAShapeLayer = {
        let heartPath = UIBezierPath()
        heartPath.move(to: CGPoint(x: 21.5, y: 32))
        heartPath.addLine(to: CGPoint(x: 20.03, y: 30.49))
        heartPath.addCurve(to: CGPoint(x: 11, y: 17.3), controlPoint1: CGPoint(x: 14.57, y: 25.21), controlPoint2: CGPoint(x: 11, y: 21.66))
        heartPath.addCurve(to: CGPoint(x: 16.77, y: 11), controlPoint1: CGPoint(x: 11, y: 13.75), controlPoint2: CGPoint(x: 13.52, y: 11))
        heartPath.addCurve(to: CGPoint(x: 21.5, y: 13.41), controlPoint1: CGPoint(x: 18.56, y: 11), controlPoint2: CGPoint(x: 20.34, y: 11.92))
        heartPath.addCurve(to: CGPoint(x: 26.22, y: 11), controlPoint1: CGPoint(x: 22.66, y: 11.92), controlPoint2: CGPoint(x: 24.44, y: 11))
        heartPath.addCurve(to: CGPoint(x: 32, y: 17.3), controlPoint1: CGPoint(x: 29.48, y: 11), controlPoint2: CGPoint(x: 32, y: 13.75))
        heartPath.addCurve(to: CGPoint(x: 22.97, y: 30.49), controlPoint1: CGPoint(x: 32, y: 21.66), controlPoint2: CGPoint(x: 28.43, y: 25.21))
        heartPath.addLine(to: CGPoint(x: 21.5, y: 32))
        heartPath.close()
        heartPath.lineCapStyle = .round

        let layer = CAShapeLayer()
        layer.path = heartPath.cgPath
        layer.fillColor = UIColor.white.cgColor
        layer.strokeColor = heartStrokeColor.cgColor
        layer.lineWidth = 1

        return layer
    }()
    
    private lazy var borderLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 1, y: 1, width: 93, height: 42), cornerRadius: 21)
        rectanglePath.lineCapStyle = .round
        rectanglePath.lineJoinStyle = .round
        UIColor.clear.setFill()
        rectanglePath.fill()

        layer.path = rectanglePath.cgPath
        layer.strokeColor = borderStrokeColor.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.lineWidth = 0.5
        
        layer.backgroundColor  = UIColor.clear.cgColor
        
        return layer
    }()
    
    private lazy var borderLayer2: CAShapeLayer = {
        let layer = CAShapeLayer()
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 1.5, y: 1.5, width: 92, height: 41), cornerRadius: 20.5)
        rectanglePath.lineCapStyle = .round
        rectanglePath.lineJoinStyle = .round
        UIColor.clear.setFill()
        rectanglePath.fill()

        layer.path = rectanglePath.cgPath
        layer.strokeColor = borderStrokeColor.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.lineWidth = 0.5
        
        layer.backgroundColor  = UIColor.clear.cgColor
        
        return layer
    }()

    
    
    
    private lazy var inProgressLayer: CALayer = {
        let inProgressLayer = CALayer()
        inProgressLayer.backgroundColor = likedFillColor.cgColor
        inProgressLayer.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
                
        let outerHeartLayer = CAShapeLayer()
        let outerHeartPath = UIBezierPath()
                
        outerHeartPath.move(to: CGPoint(x: 21.5, y: 33))
        outerHeartPath.addLine(to: CGPoint(x: 19.89, y: 31.34))
        outerHeartPath.addCurve(to: CGPoint(x: 10, y: 16.91), controlPoint1: CGPoint(x: 13.91, y: 25.57), controlPoint2: CGPoint(x: 10, y: 21.68))
        outerHeartPath.addCurve(to: CGPoint(x: 16.32, y: 10), controlPoint1: CGPoint(x: 10, y: 13.01), controlPoint2: CGPoint(x: 12.76, y: 10))
        outerHeartPath.addCurve(to: CGPoint(x: 21.5, y: 12.64), controlPoint1: CGPoint(x: 18.28, y: 10), controlPoint2: CGPoint(x: 20.23, y: 11))
        outerHeartPath.addCurve(to: CGPoint(x: 26.67, y: 10), controlPoint1: CGPoint(x: 22.77, y: 11), controlPoint2: CGPoint(x: 24.72, y: 10))
        outerHeartPath.addCurve(to: CGPoint(x: 33, y: 16.91), controlPoint1: CGPoint(x: 30.24, y: 10), controlPoint2: CGPoint(x: 33, y: 13.01))
        outerHeartPath.addCurve(to: CGPoint(x: 23.11, y: 31.34), controlPoint1: CGPoint(x: 33, y: 21.68), controlPoint2: CGPoint(x: 29.09, y: 25.57))
        outerHeartPath.addLine(to: CGPoint(x: 21.5, y: 33))
        
        outerHeartPath.close()
        outerHeartPath.lineWidth = 0.1
        outerHeartPath.lineCapStyle = .round
        
        outerHeartLayer.path = outerHeartPath.cgPath
        inProgressLayer.mask = outerHeartLayer
        inProgressLayer.isHidden = true
        
        return inProgressLayer
    }()
    
    private lazy var activeBackgroundLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        
        layer.path =
//            UIBezierPath(ovalIn: CGRect(x: 47.25, y: 21.25, width: 0, height: 0)).cgPath
            UIBezierPath(ovalIn: CGRect(x: 14.25, y: 13.25, width: 13, height: 13)).cgPath
        layer.fillColor = likedFillColor.cgColor
        layer.strokeColor = likedFillColor.cgColor
        layer.backgroundColor = likedFillColor.cgColor

        return layer
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.3, alpha: 1.0)
        label.text = "123"
        label.frame = CGRect(x: 42, y: 11, width: 41, height: 21)
        label.font = UIFont.systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private func addLayers() {
        [activeBackgroundLayer, borderLayer, borderLayer2, inProgressLayer, heartLayer].forEach { layer.addSublayer($0) }
        addSubview(countLabel)
    }
    
    private func removeLayersIfNeeded() {
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
    
    private func configureLayers() {
        removeLayersIfNeeded()
        borderLayer.backgroundColor = UIColor.clear.cgColor
        addLayers()
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLayers()
        backgroundColor = .clear
        
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addLayers()
        backgroundColor = .clear
        
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    public func setup(likesCount: Int, state: LikeState, animated: Bool) {
        self.likeState = state
        countLabel.text = "\(likesCount)"
        
        guard animated else { return }
        
        switch likeState {
        case .inProgress:
            showInProgress(true)
            break
        case .liked:
            animateTo(.liked)
            showInProgress(false)
        case .notLiked:
            animateTo(.notLiked)
            showInProgress(false)
            break
        }
    }

    @objc private func buttonPressed() {
        guard isIdle else { return }
        
        setup(likesCount: 92831, state: .inProgress, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.setup(likesCount: -2, state: .liked, animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.setup(likesCount: 32, state: .notLiked, animated: true)
            }
        }
            
//        switch likeState {
//        case .inProgress:
//            likeState = .liked
//            animateTo(.liked)
//            break
//        case .liked:
//            likeState = .notLiked
//            animateTo(.notLiked)
//            showInProgress(false)
//        case .notLiked:
//            likeState = .inProgress
//            showInProgress(true)
//            break
//        }
    }
}
