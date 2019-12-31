//
//  ResultModel.swift
//  BEKPersianSpeechToText
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
struct ResultModel: Decodable {
    
    let result: [ResultItemModel]
    
    struct ResultItemModel: Decodable {
        let alternative: [AlternativeModel]
        let final: Bool
    }
    struct AlternativeModel: Decodable {
        let transcript: String
    }
}
