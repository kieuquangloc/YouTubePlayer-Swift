//
//  ViewController.swift
//  YouTubePlayerExample
//
//  Created by Giles Van Gruisen on 1/31/15.
//  Copyright (c) 2015 Giles Van Gruisen. All rights reserved.
//

import UIKit
import YouTubePlayer

class ViewController: UIViewController {

    @IBOutlet var playerView: YouTubePlayerView!
    @IBOutlet var playButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func play(_ sender: UIButton) {
        if playerView.ready {
            if playerView.playerState != YouTubePlayerState.Playing {
                playerView.play()
                playButton.setTitle("Pause", for: UIControlState())
            } else {
                playerView.pause()
                playButton.setTitle("Play", for: UIControlState())
            }
        }
    }

    @IBAction func prev(_ sender: UIButton) {
        playerView.previousVideo()
    }

    @IBAction func next(_ sender: UIButton) {
        playerView.nextVideo()
    }

    @IBAction func loadVideo(_ sender: UIButton) {
        //https://developers.google.com/youtube/player_parameters
        playerView.playerVars = ["playsinline": 1 as AnyObject,
                                "showinfo": 0 as AnyObject,
                                "controls": 0 as AnyObject
        ]
        playerView.loadVideoID("4BCxqrhsjOw")
    }

    @IBAction func loadPlaylist(_ sender: UIButton) {
        playerView.loadPlaylistID("PLrL-Vo0sawkCnrzvUfbZGaPc9cuLY4fYd")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

