//
//  ParserHelper.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/13/20.
//

import Foundation

//protocol Parsable {
//    static func parseObject(dictionary: [AnyObject]) -> Result<Self, ErrorResult>
//}
//
//final class ParserHelper {
//
//    static func parse<T: Parsable>(data: Data, completion : (Result<T, ErrorResult>) -> Void) {
//
//        do {
//
//            if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [AnyObject] {
//
//                // init final result
//                // check foreach dictionary if parseable
//                switch T.parseObject(dictionary: dictionary) {
//                case .failure(let error):
//                    completion(.failure(error))
//                    break
//                case .success(let newModel):
//                    completion(.success(newModel))
//                    break
//                }
//
//
//            } else {
//                NSLog("Json data is not an array")
//                completion(.failure(.parser(string:kAPIParseErrorMessgae)))
//            }
//        } catch {
//            // can't parse json
//            NSLog("Error while parsing json data")
//            completion(.failure(.parser(string:kAPIParseErrorMessgae)))
//        }
//    }
//}

protocol Parsable {
    static func parseObject(dictionary: [AnyObject]) -> Result<Self, ErrorResult>
}

final class ParserHelper {
    
    static func parse<T: Parsable>(data: Data, completion : (Result<T, ErrorResult>) -> Void) {
        
        do {
            
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [AnyObject] {
                
                // init final result
                // check foreach dictionary if parseable
                switch T.parseObject(dictionary: dictionary) {
                case .failure(let error):
                    completion(.failure(error))
                    break
                case .success(let newModel):
                    completion(.success(newModel))
                    break
                }
                
                
            } else {
                NSLog("Json data is not an array")
                completion(.failure(.parser(string:kAPIParseErrorMessgae)))
            }
        } catch {
            // can't parse json
            NSLog("Error while parsing json data")
            completion(.failure(.parser(string:kAPIParseErrorMessgae)))
        }
    }
}
