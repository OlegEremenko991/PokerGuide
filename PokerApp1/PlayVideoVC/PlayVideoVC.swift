//
//  PlayVideoVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

final class PlayVideoVC: UIViewController, YTPlayerViewDelegate {

// MARK: IBOutlets
    
    @IBOutlet private weak var playerView: YTPlayerView!
    
// MARK: Public properties
    
    var videoID = ""
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadVideo(id: videoID)
    }
    
// MARK: Private methods
    
    private func setupView() {
        playerView.delegate = self
    }
    
    private func loadVideo(id: String){
        DispatchQueue.main.async {
            self.playerView.load(withVideoId: id, playerVars: ["playsinline":1])
        }
    }

}
