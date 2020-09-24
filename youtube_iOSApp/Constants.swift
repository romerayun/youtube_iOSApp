//
//  Constants.swift
//  youtube_iOSApp
//
//  Created by Роман Юн on 23.09.2020.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyB2uRehvQaxYn9BQZcssAiQG9vrEzw-lXA"
    static var PLAYLIST_ID = "UUt7sv-NKh44rHAEb-qCCxvA"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
