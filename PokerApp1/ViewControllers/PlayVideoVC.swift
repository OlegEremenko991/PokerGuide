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

    // MARK: - IBOutlets
    
    @IBOutlet private weak var playerView: YTPlayerView! {
        didSet { playerView.delegate = self }
    }
    
    // MARK: - Public properties
    
    var videoID = ""
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo(id: videoID)
    }
    
    // MARK: - Private methods

    private func loadVideo(id: String){
        DispatchQueue.main.async {
            self.playerView.load(withVideoId: id, playerVars: ["playsinline": 1])
        }
    }

}
