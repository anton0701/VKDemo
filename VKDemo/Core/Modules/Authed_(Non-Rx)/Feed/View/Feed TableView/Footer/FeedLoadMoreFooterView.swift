//
//  FeedLoadMoreFooterView.swift
//  VKDemo
//
//  Created by Anton Krylov on 05.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class FeedLoadMoreFooterView: UIView {
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var copyLoadingLabel: UILabel!
    
    @IBOutlet weak var borderView: UIView! {
        didSet {
            borderView.layer.cornerRadius = borderView.frame.size.height / 2.0
            borderView.layer.borderColor = UIColor.blueMain.withAlphaComponent(0.6).cgColor
            borderView.layer.borderWidth = CGFloat(1)
        }
    }
    
    override func didMoveToSuperview() {
        startAnimating()
    }
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = copyLoadingLabel.frame
        
        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        return gradientLayer
    }()
    
    private func startAnimating() {
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 3
        animation.fromValue = -2*loadingLabel.frame.width
        animation.toValue = loadingLabel.frame.width
        animation.repeatCount = Float.infinity
        
        gradientLayer.add(animation, forKey: "transform.x")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadingLabel.layer.mask = gradientLayer
    }
    
    override init(frame: CGRect) {
        fatalError("Not for initializng in code")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
