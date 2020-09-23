//
//  VideoLessonsVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class VideoLessonsVC: UIViewController {

// MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
// MARK: Private properties
    
    private let videoCellID = "VideoCellID"
    private let videosData = DataLoader().videos
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: TableView DataSource and Delegate

extension VideoLessonsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(250)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let videoCell = tableView.dequeueReusableCell(withIdentifier: videoCellID) as! VideoCell
        let video = videosData[indexPath.row]
        videoCell.previewTitleLabel.text = video.title
        videoCell.previewImageView.image = UIImage(named: video.imageName)

        return videoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Set cell as selected
        
        let videoCell = tableView.dequeueReusableCell(withIdentifier: videoCellID) as! VideoCell
        videoCell.isSelected = true
        
        // Prepare data for PlayVideoVC
        
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "PlayVideoVC") as? PlayVideoVC else { return }
        
        let video = videosData[indexPath.row]
        targetVC.videoID = video.videoID
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    
}
