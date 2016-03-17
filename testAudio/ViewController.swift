//
//  ViewController.swift
//  testAudio
//
//  Created by jmayfield37 on 2/22/16.
//  Copyright © 2016 Joe Mayfield. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    var audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("burn", ofType: "mp3")!)
    
    var playPauseBtn = UIBarButtonItem()
    
    var musicPaused: Bool = false
    

    @IBOutlet weak var toolbar: UIToolbar!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOfURL: audioPath)
        }
        catch
        {
            print("Audio file not found...")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func playPause(sender: UIBarButtonItem) {
        
        var items = toolbar.items!
        
        if musicPaused == false
        {
            playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "playPause:")
            
            items[0] = playPauseBtn
            toolbar.setItems(items, animated: true)
            
            audioPlayer.play()
            musicPaused = true
        }
        else
        {
            var items = toolbar.items!
            playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playPause:")
            items[0] = playPauseBtn
            toolbar.setItems(items, animated: true)
            
            audioPlayer.pause()
            musicPaused = false
            
        }
        
    }
    

    @IBAction func stopMusic(sender: UIBarButtonItem) {
        
        
        var items = toolbar.items!
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playPause:")
        items[0] = playPauseBtn
        toolbar.setItems(items, animated: true)
        musicPaused = false
    }
    
    @IBOutlet weak var volumeController: UISlider!
    
    @IBAction func controlVolume(sender: AnyObject) {
        
        audioPlayer.volume = volumeController.value
        
    }
    

}

