//
//  Meal.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 27/10/2022.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mainFoods = try? newJSONDecoder().decode(MainFoods.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.mainFoodsTask(with: url) { mainFoods, response, error in
//     if let mainFoods = mainFoods {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Meals
struct Meal: Codable {
    let status, message: String
    let data: [Food]
}

struct Food: Codable {
    let foodID, foodTitle, foodDES, foodPrice: String
    let foodImagePath: String
    let foodSpecial, dayOfWeek: String
    var  qty: Int = 0

    enum CodingKeys: String, CodingKey {
        case foodID = "food_id"
        case foodTitle = "food_title"
        case foodDES = "food_des"
        case foodPrice = "food_price"
        case foodImagePath = "food_image_path"
        case foodSpecial = "food_special"
        case dayOfWeek = "day_of_week"
        case qty = "qty"
    }
}
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
//
//// MARK: - URLSession response handlers

//extension URLSession {
//    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completionHandler(nil, response, error)
//                return
//            }
//            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
//        }
//    }
//
//    func mainFoodsTask(with url: URL, completionHandler: @escaping (Meal?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.codableTask(with: url, completionHandler: completionHandler)
//    }
//}
//
