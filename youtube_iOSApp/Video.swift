//
//  Video.swift
//  youtube_iOSApp
//
//  Created by Роман Юн on 23.09.2020.
//

import Foundation


struct Video : Decodable {

    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys : String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)

        // Parse thumbnails
//        self.thumbnail = try snippetContainer..decode(String.self, forKey: .snippet)
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highThumbnailsContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highThumbnailsContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse videoId
        let resourceContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
    }
    
}
