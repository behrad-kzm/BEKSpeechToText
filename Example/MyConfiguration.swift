//
//  MyConfiguration.swift
//  Example
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
import AVFoundation
import BEKPersianSpeechToText
struct MyConfiguration: BEKSpeechConfigType {
    let audioFormatString = "flac"
    let keyRate = 16000
    let audioFormat = kAudioFormatFLAC
    let contentType = "audio/x-flac"
    let language = "fa-IR" //For persian Translation
    let quality = AVAudioQuality.high
}
