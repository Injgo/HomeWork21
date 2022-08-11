//
//  APICaller.swift
//  HomeWork21
//
//  Created by Dato on 11.08.22.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    
    func getData(completion: @escaping(Result<[Country], Error>)-> Void){
        let urlString = "https://restcountries.com/v2/all"
        let url = URL(string: urlString)
        guard let apiURL = url else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: apiURL)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                
                
                let result = try JSONDecoder().decode([Country].self, from: data)
                completion(.success(result))
                
//                let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print(result)
                
            }
            catch{
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
}
