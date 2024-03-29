//
//  NetworkWorker.swift


import Foundation

protocol NetworkWorkerProtocol{
    
    func getData(from url: String, networkHandler: @escaping (Result<Data, URLError>)->())
}

//Работа с данными из сети
final class NetworkWorker: NetworkWorkerProtocol {
    
    func getData(from url: String, networkHandler: @escaping (Result<Data, URLError>)->()){
        
        guard let localURL = URL(string: url) else {

            networkHandler(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: localURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                networkHandler(.failure(URLError(.unknown)))
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                
                networkHandler(.failure(URLError(.unknown)))
                return
            }
            
            if let data = data {
                
                networkHandler(.success(data))
            }
            else{
                networkHandler(.failure(URLError(.badURL)))
            }
        }.resume()
    }
}
