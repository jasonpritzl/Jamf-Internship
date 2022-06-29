//
//  ApiService.swift
//  Acme App
//
//  Created by Jason Pritzl on 2/7/22.
//
//  This class is dedicated to making the API request to the main website.

import Foundation

class ApiService {
    
    var task: URLSessionDataTask?
    
    //This function makes the API request to the main website and gets the data
    func getData(completion: @escaping(Result<AnimalSelect, Error>) -> Void) {
        let url = URL(string: "https://mcxlmpfy3k.execute-api.us-east-1.amazonaws.com/dev/animals")
        guard let requestURL = url else {fatalError()}
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            do {
                let decoder = JSONDecoder()
                let animal = try decoder.decode(AnimalSelect.self, from: data)
                completion(.success(animal))
                
            } catch {
                completion(.failure(error))
            }
            
        }
        task?.resume()
    }
}
