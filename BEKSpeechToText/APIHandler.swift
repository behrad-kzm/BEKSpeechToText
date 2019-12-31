//
//  APIHandler.swift
//  BEKPersianSpeechToText
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation

struct APIHandler {
    
    let config: BEKSpeechConfigType
    
    init(configuration: BEKSpeechConfigType) {
        self.config = configuration
    }
    
    var apiKey: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: "com.bekapps.googleapi.key")
        }
        get {
            return UserDefaults.standard.string(forKey: "com.bekapps.googleapi.key")
        }
    }
    
    private let session = URLSession.shared
    
    private var apiURLPath: String {
        return "https://www.google.com/speech-api/v2/recognize?xjerr=1&maxresults=1&pFilter=0&output=json&client=chromium&lang=\(config.language)&key=" + (apiKey ?? "")
    }
    
    func requestText(forData data: Data, withRate rate: Int, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        if let url = URL(string: apiURLPath){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("\(config.contentType); rate=\(rate)", forHTTPHeaderField: "Content-Type")
            request.timeoutInterval = 15
            let task = session.dataTask(with: request as URLRequest, completionHandler: completion)
            task.resume()
            return
        }
        let error = NSError(domain: "URL is not valid", code: -1, userInfo: nil)
        completion(nil, nil, error)
    }
}
