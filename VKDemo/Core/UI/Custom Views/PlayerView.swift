//
//  PlayerView.swift
//  VKDemo
//
//  Created by Anton Krylov on 25/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

protocol PlayerViewDelegate: class {
    func videoTapped(videoUrl: String, formTime: CMTime?)
}

class PlayerView: UIView {
    private var playerLayer: AVPlayerLayer?
    private var url: String?
    private weak var delegate: PlayerViewDelegate?
    private var statusObservation: NSKeyValueObservation?
    private let loadingView = UIView()
    private let activityIndicator = UIActivityIndicatorView(frame: CGRect.zero)

    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        let player = AVPlayer()
        player.isMuted = true

        if #available(iOS 12.0, *) {
            player.preventsDisplaySleepDuringVideoPlayback = false
        }
        
        let playerLayer = AVPlayerLayer(player: player)
        self.playerLayer = playerLayer
        self.layer.addSublayer(playerLayer)

        playerLayer.frame = self.bounds

        let videoButton = UIButton()

        videoButton.addTarget(self, action: #selector(videoButtonTapped), for: .touchUpInside)
        self.addSubviewOnBorders(videoButton)

        loadingView.addSubviewOnCenter(activityIndicator)

        activityIndicator.startAnimating()

        self.addSubviewOnBorders(loadingView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = self.bounds
    }

    func playVideo(urlString: String, delegate: PlayerViewDelegate) {
        if playerLayer?.player?.currentItem != nil,
            url == urlString {
            playerLayer?.player?.play()
            return
        }

        guard let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let videoURL = URL(string: encodedUrlString) else {
            return
        }

        self.url = urlString
        self.delegate = delegate

        let videoPlayerItem = AVPlayerItem(url: videoURL)

        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                               object: videoPlayerItem,
                                               queue: .main) { [weak self] _ in
                                                self?.playerLayer?.player?.seek(to: kCMTimeZero)
                                                self?.playerLayer?.player?.play()
        }

        playerLayer?.player?.replaceCurrentItem(with: videoPlayerItem)
        playerLayer?.player?.seek(to: kCMTimeZero)

        playerLayer?.player?.play()
        showLoading()

        statusObservation?.invalidate()
        statusObservation = videoPlayerItem.observe(\.status, options: [.new]) { [weak self] (_, _) in
            if videoPlayerItem.status == .readyToPlay {
                self?.loadingView.isHidden = true
            }
        }
    }

    func showLoading() {
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }

    func stopPlaying() {
        playerLayer?.player?.pause()
    }

    @objc func videoButtonTapped() {
        guard let url = url else {
            return
        }

        delegate?.videoTapped(videoUrl: url, formTime: playerLayer?.player?.currentTime())
    }

    deinit {
        playerLayer?.player?.replaceCurrentItem(with: nil)
        playerLayer?.removeFromSuperlayer()
        statusObservation?.invalidate()
        statusObservation = nil
        NotificationCenter.default.removeObserver(self)
    }
}
