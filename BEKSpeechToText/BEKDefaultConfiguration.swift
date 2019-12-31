//
//  BEKDefaultConfiguration.swift
//  BEKPersianSpeechToText
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
import AVFoundation
struct BEKDefaultConfiguration: BEKSpeechConfigType {
    let audioFormatString = "flac"
    let keyRate = 16000
    let audioFormat = kAudioFormatFLAC
    let contentType = "audio/x-flac"
    let language = "fa-IR"
    let quality = AVAudioQuality.high
}
