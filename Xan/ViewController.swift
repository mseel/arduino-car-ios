//
//  ViewController.swift
//  Xan
//
//  Created by Marcus Seel on 03.02.15.
//  Copyright (c) 2015 Marcus Seel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nrfManager: NRFManager!
    var timer = dispatch_source_t()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nrfManager = NRFManager(
            onConnect: {
                println("Connected")
            },
            onDisconnect: {
                println("Disconnected")
            },
            onData: {
                (data:NSData?, string:String?)->() in
                println("Received data - String: \(string) - Data: \(data)")
            }
        )

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moveBackward(sender: AnyObject) {
        sendData("2")
    }
    
    @IBAction func moveLeft(sender: AnyObject) {
        sendData("3")
    }
    
    @IBAction func startForward(sender: AnyObject) {
        sendData("1")
    }
    
    @IBAction func stopMoving(sender: AnyObject) {
        sendData("5")
    }
    
    @IBAction func moveRight(sender: AnyObject) {
        sendData("4")
    }

    func sendData(direction: String)
    {
        let result = self.nrfManager.writeString(direction)
    }

}

