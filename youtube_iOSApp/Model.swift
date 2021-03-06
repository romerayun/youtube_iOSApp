//
//  Model.swift
//  youtube_iOSApp
//
//  Created by Роман Юн on 23.09.2020.
//
protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}


import Foundation

class Model {
    
    var delegate:ModelDelegate?
 
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
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                
//                dump(response)
                
                
            } catch {
                
            }
            
           
            
            
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
    
}
