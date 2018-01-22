//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by Karan Sheth on 13/12/17.
//  Copyright © 2017 Karan Sheth. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

//    MARK: Variables
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordButton.isEnabled = false
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordLabel.text = "Record in Progress"
        stopRecordButton.isEnabled = true
        RecordButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.delegate = self
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    @IBAction func stopRecording(_ sender: Any) {
        recordLabel.text = "Tap to Record"
        stopRecordButton.isEnabled = false
        RecordButton.isEnabled = true
        
        audioRecorder.stop()
        let audiosession =  AVAudioSession.sharedInstance()
        try! audiosession.setActive(false)
        
    }
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
        performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
        else{
        print("Error in Audio Recording")}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let PlayVC = segue.destination as! PlaySoundsViewController
            let recordURL = sender as! URL
            PlayVC.recordedAudioURL = recordURL
        }
    }

}

