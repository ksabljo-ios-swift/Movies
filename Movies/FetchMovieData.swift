//
//  FetchMovieData.swift
//  Movies
//
//  Created by Krešimir Sabljo on 29/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import Foundation

func fetchMovieData(page: Int, completion: @escaping (MovieResult)->()) {
    
    let url = URL(string: ( baseMovieURL + apiKey))
    print("fetchMovies -> baseMovieURL:  \(url!)")
    let request = NSMutableURLRequest(url: url! ,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    
    request.httpMethod = httpMethod.get.rawValue
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { ( data, response, error) -> Void in
        
        if error != nil{
            print("Error: dataOrNil: \(String(describing: error))")
            
        }
        
        if let data = data
        {
            do
            {
                let decoder = JSONDecoder()
                let responseDictionary = try decoder.decode(MovieResult.self, from: data)
                completion(responseDictionary)
            }

            catch(let err)
            {
                print(err)
                print("Message.......:fetchMovieData  Catch blok...!")
            }
        }
    })
    dataTask.resume()
    
}
