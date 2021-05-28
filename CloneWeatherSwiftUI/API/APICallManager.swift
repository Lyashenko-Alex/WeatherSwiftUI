//
//  APICallManager.swift
//  CloneWeatherSwiftUI
//
//  Created by RX on 5/28/21.
//

import Foundation
import Alamofire
import SwiftyJSON

let apiBaseUrl = "https://www.metaweather.com/api"

class APICallManager {
    static let shared = APICallManager()

    func createRequest(
        _ url: String,
        method: HTTPMethod,
        headers: [String: String]?,
        parameters: AnyObject?,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
    ) {
        AF.request(url, method: method).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let callback = successCallback {
                    callback(json)
                }
            case .failure(let error):
                if let callback = failureCallback {
                    callback(error.localizedDescription)
                }
            }
        }
    }
    
}
