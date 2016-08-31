//
//  ViewController.swift
//  Training
//
//  Created by Akkey on 2016/08/31.
//  Copyright © 2016年 AkkeyLab. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let task = NSTask()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func mkDir(sender: AnyObject) {
        // let outputDir: String = NSHomeDirectory() + "/Desktop/AkkeyLab"
        let outputDir: String = NSHomeDirectory() + "/AkkeyLab"
        NSLog("\(outputDir)")

        task.launchPath = "/bin/mkdir"
        task.arguments = [outputDir]

        task.launch()
    }

    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

