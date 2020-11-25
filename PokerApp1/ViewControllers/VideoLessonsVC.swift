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
    
    @IBOutlet private weak var tableView: UITableView!
    
// MARK: Private properties

    private var videosData = [Video]()
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideos()
    }

    // MARK: Private methods

    private func loadVideos() {
        DataLoader.loadData(decodingType: [Video].self, resourceName: "Videos") { result in
            switch result {
            case .success(let videos):
                videosData = videos.sorted(by: { $0.id < $1.id })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

// MARK: TableView DataSource and Delegate

extension VideoLessonsVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { CGFloat(250) }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { videosData.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let videoCell = tableView.dequeueReusableCell(withIdentifier: VideoCell.cellID) as! VideoCell
        let video = videosData[indexPath.row]
        videoCell.setupCellWith(title: video.title,
                                imageName: video.imageName)
        return videoCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Set cell as selected
        let videoCell = tableView.dequeueReusableCell(withIdentifier: VideoCell.cellID) as! VideoCell
        videoCell.isSelected = true

        // Prepare data for PlayVideoVC
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "PlayVideoVC") as? PlayVideoVC else { return }

        let video = videosData[indexPath.row]
        targetVC.videoID = video.videoID

        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(targetVC, animated: true)
    }

}
