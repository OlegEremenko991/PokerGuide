//
//  PlayVideoVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class PlayVideoVC: UIViewController, YTPlayerViewDelegate {

    @IBOutlet weak var playerView: YTPlayerView!
    var videoID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        loadVideo(id: videoID)
    }
    
    func loadVideo(id: String){
        DispatchQueue.main.async {
            self.playerView.load(withVideoId: id, playerVars: ["playsinline":1])
        }
    }


}
