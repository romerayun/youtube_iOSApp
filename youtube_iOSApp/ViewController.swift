//
//  ViewController.swift
//  youtube_iOSApp
//
//  Created by Роман Юн on 23.09.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getVideos()
    }
    
    // MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our video property
        self.videos = videos
        
        
        // Refresh the tavleView
        tableView.reloadData()
    }

    // MARK: TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return videos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // Configurate the cell with data
        
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}

