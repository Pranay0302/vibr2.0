//
//  Genre.swift
//  vibr2.0
//
//  Created by pranay andra on 25/04/20.
//  Copyright © 2020 pranay andra. All rights reserved.
//

import UIKit
import MediaPlayer

var nowPlayingItem: MPMediaItem?{get musicPlayer set MPMediaLibrary}

class Genre: UIViewController {
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Genretapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playgenre(genre: sender.currentTitle!)
            }
        }
    }
    @IBAction func Stoptapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    @IBAction func Nexttapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()    
    }
    
    func playgenre(genre: String) {
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
