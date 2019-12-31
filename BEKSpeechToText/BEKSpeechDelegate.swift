//
//  BEKSpeechDelegate.swift
//  BEKPersianSpeechToText
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
public protocol BEKSpeechDelegate {
    func speech(didReceiveContectText text: String)
    func speech(didReceiveError error: Error)
}
