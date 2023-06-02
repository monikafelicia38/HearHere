//
//  MicrophoneMonitor.swift
//  HearHere Watch App
//
//  Created by Monika Felicia on 23/05/23.
//


import Foundation
import AVFoundation

class MicrophoneMonitor: ObservableObject {
    
    private var audioRecorder: AVAudioRecorder!
    private var timer: Timer?
    
    @Published public var soundLevel: Float
    init() {
        self.soundLevel = .zero
    }
    
    //MARK: Function Start Monitoring Microphone
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
        
        //MARK: AVAudio Recorder Setting
        let url = URL(fileURLWithPath: "/dev/null", isDirectory: true)
        let recorderSettings: [String:Any] = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
        ]
        
        //MARK: Catch Error
        do {
            self.audioRecorder = try AVAudioRecorder(url: url, settings: recorderSettings)
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
        } catch {
            fatalError(error.localizedDescription)
        }
        
        //MARK: Time Interval to Update the Sound
        audioRecorder.isMeteringEnabled = true
        audioRecorder.record()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.audioRecorder.updateMeters()
            self.soundLevel = self.audioRecorder.averagePower(forChannel: 0)
            
        })
    }
    //MARK: Function Stop Monitoring Microphone
    public func stopMonitoring() {
        timer?.invalidate()
        audioRecorder.stop()
    }
    
    deinit {
        timer?.invalidate()
        audioRecorder.stop()
    }
}
