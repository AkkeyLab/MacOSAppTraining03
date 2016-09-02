//
//  ViewController.swift
//  Training
//
//  Created by Akkey on 2016/08/31.
//  Copyright © 2016年 AkkeyLab. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    private let task = NSTask()
    private let alert = NSAlert()
    private var homeDir: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        homeDir = NSHomeDirectory()
    }

    @IBAction func mkDir(sender: AnyObject) {
//        let outputDir: String = homeDir + "/Desktop/AkkeyLab"
        let outputDir: String = homeDir + "/AkkeyLab"
        NSLog("\(outputDir)")

        task.launchPath = "/bin/mkdir"
        task.arguments = [outputDir]

        task.launch()
    }

    @IBAction func cp(sender: AnyObject) {
        let panel = NSOpenPanel()
        // ファイル選択を許可させる
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = NSImage.imageTypes()
        panel.beginWithCompletionHandler({ (num) -> Void in
            if num == NSModalResponseOK {
                self.readItem((panel.URL?.path)!)
            }
        })
    }

    func readItem(url: String) {
        if (NSImage(contentsOfFile: url) != nil) {
            task.launchPath = "/bin/cp"
            task.arguments = [url, homeDir + "/AkkeyLab/sample.png"]

            task.launch()
        } else {
            alert.messageText = "Error"
            alert.informativeText = "Not find file"
            alert.runModal()
        }
    }

    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

