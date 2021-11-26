//
//  APIService.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 22/11/21.
//

import Foundation

class APIService: ObservableObject {
  
  func getMarvelData(offset: Int, completion: @escaping (MarvelData)-> ()) {
    
    guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?offset=\(offset)&ts=1&apikey=22eb66442da39b2974a228c0c3e9a952&hash=bd1f6353be15df97ec811ab56f500e21") else {fatalError("missing URL")}
    
    let urlRequest = URLRequest(url: url)
    
    let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
      if let error = error {
        print("Request error", error)
        return
      }
      
      guard let response = response as? HTTPURLResponse else {return}
      
      if response.statusCode == 200 {
        guard let data = data else {return}
        DispatchQueue.main.async{
          let decoder = JSONDecoder()
          do{
            let decodedMarvel = try decoder.decode(MarvelData.self, from: data)
            completion(decodedMarvel)
          } catch let error {
            print("Error decoding->", error)
          }
        }
      }
    }
    dataTask.resume()
  }
}
