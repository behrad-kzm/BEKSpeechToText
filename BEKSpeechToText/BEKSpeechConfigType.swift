//
//  BEKSpeechConfigType.swift
//  BEKPersianSpeechToText
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
import AVFoundation
public protocol BEKSpeechConfigType {
    var audioFormatString: String { get }
    var keyRate: Int { get }
    var audioFormat: AudioFormatID { get }
    var contentType: String { get }
    var language: String { get }
    var quality: AVAudioQuality { get }
}
