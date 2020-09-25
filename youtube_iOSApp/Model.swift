//
//  Model.swift
//  youtube_iOSApp
//
//  Created by Роман Юн on 23.09.2020.
//

import Foundation

class Model {
 
    func getVideos() {
        
        // Create a URL oject
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get URLSession object
        let session = URLSession.shared
        
        // Get a data from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil && data != nil {
                return
            }
            
            // Parsing the datainto video object
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
                
                
            } catch {
                
            }
            
           
            
            
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
    
}
