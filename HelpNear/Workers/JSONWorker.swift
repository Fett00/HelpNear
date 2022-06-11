//
//  JSONWorker.swift


import Foundation

protocol JSONDecoderWorkerProtocol{
    
    func decode<T: Decodable>(type: T.Type, data: Data) -> T?
    
}

protocol JSONEncoderWorkerProtocol{
    
    func encode<T: Encodable>(model: T) -> Data?
}

//Работа с данными json
final class JSONDecoderWorker: JSONDecoderWorkerProtocol{
    
    let decoder: JSONDecoder = {
        
        let dec = JSONDecoder()
        
        dec.keyDecodingStrategy = .convertFromSnakeCase
        
        return dec
    }()
    
    func decode<T: Decodable>(type: T.Type, data: Data) -> T?{
        
//        do {
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            
//            print(error.localizedDescription)
//            return nil
//        }
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
            return nil
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch {
            print("error: ", error)
            return nil
        }
    }
}

final class JSONEncoderWorker: JSONEncoderWorkerProtocol{
    //Не создаем инстанс энкодера, т.к. encode происходит не часто, смысла в памяти держать нет
    func encode<T: Encodable>(model: T) -> Data? {
        
        return try? JSONEncoder().encode(model)
    }
}
