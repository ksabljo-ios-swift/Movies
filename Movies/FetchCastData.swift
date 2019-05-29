//
//  FetchCastData.swift
//  Movies
//
//  Created by Krešimir Sabljo on 29/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import Foundation

/*
let movieID = String.init( movie!.id)
let something = "/credits?api_key="

let request = NSMutableURLRequest(url: URL(string: apiPath(movieID: movieID, something: something) )!,

*/


func fetchCastData(movieID: Int, completion: @escaping (CastResult)->()) {
    
    let movieID = String.init( movieID)
    let something = "/credits?api_key="
    
    
    let url = URL(string: ( newbase + movieID + something + apiKey))
    print("fetchCastData -> baseImageURL:  \(url!)")
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
                let responseDictionary = try decoder.decode(CastResult.self, from: data)
                completion(responseDictionary)
            }
                
            catch(let err)
            {
                print(err)
                print("Message.......: fetchCastData  Catch blok...!")
            }
        }
    })
    dataTask.resume()
    
}
