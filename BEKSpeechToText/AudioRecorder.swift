//
//  AudioRecorder.swift
//  BEKPersianSpeechToText
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
import AVFoundation

class AudioRecorder: NSObject {
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var config: BEKSpeechConfigType!
    override private init() {
        super.init()
    }
    convenience init(configuration: BEKSpeechConfigType) {
        self.init()
        self.config = configuration
        self.recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            // failed to record!
        }
        
        let settings: [String: Any] = [
            /// Format Flac
            AVFormatIDKey: Int(configuration.audioFormat),
            AVSampleRateKey: configuration.keyRate,
            AVNumberOfChannelsKey: 1,
            AVLinearPCMBitDepthKey: 16,
            AVEncoderAudioQualityKey: configuration.quality.rawValue,
            AVLinearPCMIsBigEndianKey: false,
            AVLinearPCMIsFloatKey: false,
        ]
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.\(configuration.audioFormatString)")
        audioRecorder = try! AVAudioRecorder(url: audioFilename, settings: settings)
        audioRecorder.isMeteringEnabled = true
//        audioRecorder.delegate = self
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func requestPermission(handler: @escaping (Bool) -> Void){
        recordingSession.requestRecordPermission { (allowed) in
            handler(allowed)
        }
    }
    func startRecording(){
        audioRecorder.record()
    }
    func finishRecording() -> Data? {
        audioRecorder.stop()
        return try? Data(contentsOf: getDocumentsDirectory().appendingPathComponent("recording.\(config.audioFormatString)"))
    }
}

//extension AudioRecorder: AVAudioRecorderDelegate{
//    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
//        if !flag {
//            finishRecording()
//        }
//    }
//}
