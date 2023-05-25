//
//  MicrophoneMonitor.swift
//  HearHere Watch App
//
//  Created by Monika Felicia on 23/05/23.
//


import Foundation
import AVFoundation

class MicrophoneMonitor: ObservableObject {
    
    // 1
    private var audioRecorder: AVAudioRecorder!
    private var timer: Timer?
    
    // 2
    @Published public var soundLevel: Float
    
    init() {
        self.soundLevel = .zero
    }
    
    // 6
    public func startMonitoring() {
        // 3
        let audioSession = AVAudioSession.sharedInstance()
        if audioSession.recordPermission != .granted {
            audioSession.requestRecordPermission { (isGranted) in
                if !isGranted {
                    fatalError("You must allow audio recording for this demo to work")
                }
            }
        }
        
        // 4
        let url = URL(fileURLWithPath: "/dev/null", isDirectory: true)
        let recorderSettings: [String:Any] = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
        ]
        
        // 5
        do {
            self.audioRecorder = try AVAudioRecorder(url: url, settings: recorderSettings)
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
        } catch {
            fatalError(error.localizedDescription)
        }
        
        audioRecorder.isMeteringEnabled = true
        audioRecorder.record()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            // 7
            self.audioRecorder.updateMeters()
            self.soundLevel = self.audioRecorder.averagePower(forChannel: 0)
            
        })
    }
    
    public func stopMonitoring() {
        timer?.invalidate()
        audioRecorder.stop()
    }
    
    // 8
    deinit {
        timer?.invalidate()
        audioRecorder.stop()
    }
    
    
}
