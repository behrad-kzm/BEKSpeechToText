//
//  BEKSpeech.swift
//  BEKSpeechToText
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation

public final class BEKSpeech {
    /**
     `apiKey` is your Google API key that allows you to use Speech-To-Text services.
     */
    public func setAPIKey(string: String) {
        apiHandler.apiKey = string
    }
    
    /**
     `delegate` will receive Goolge API responses .
     */
    public var delegate: BEKSpeechDelegate?
    
    /**
     `configuration` will change settings of APIHandler and AudioRecorder.
     */
    public var configuration: BEKSpeechConfigType = BEKDefaultConfiguration() {
        didSet{
            self.apiHandler = APIHandler(configuration: configuration)
            self.recorder = AudioRecorder(configuration: configuration)
        }
    }
    
    private var isRecording = false
    private var apiHandler: APIHandler
    private var recorder: AudioRecorder
    
    public init() {
        self.apiHandler = APIHandler(configuration: configuration)
        self.recorder = AudioRecorder(configuration: configuration)
    }
    
    public func requestPermission(handler: ((Bool) -> Void)?){
        recorder.requestPermission { (allowed) in
            if let safeHandler = handler {
                safeHandler(allowed)
            }
        }
    }
    
    public func startRecording(){
        isRecording = true
        recorder.startRecording()
    }
    
    public func stopRecording(){
        
        if let data = recorder.finishRecording(), isRecording == true {
            
            parse(voiceFromAudioData: data, withRateKey: configuration.keyRate)
        }
        
        isRecording = false
    }
    
    private func parse(voiceFromAudioData audio: Data, withRateKey rate: Int){
        assert(apiHandler.apiKey != nil)
        apiHandler.requestText(forData: audio, withRate: rate) { [delegate](data, response, error) in
            
            DispatchQueue.main.async {
                if let safeError = error {
                    delegate?.speech(didReceiveError: safeError)
                    return
                }
                let emptyResult = "{\"result\":[]}"
                if let safeData = data, let purgeResult = String(data: safeData, encoding: .utf8)?.replacingOccurrences(of: emptyResult, with: ""), let jsonData = purgeResult.data(using: .utf8), let resultModel = try? JSONDecoder().decode(ResultModel.self, from: jsonData), let content = resultModel.result.first?.alternative.first?.transcript {
                    delegate?.speech(didReceiveContectText: content)
                }
            }
        }
    }
}
