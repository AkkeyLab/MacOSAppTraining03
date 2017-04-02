//
//  ViewController.swift
//  Training
//
//  Created by Akkey on 2016/08/31.
//  Copyright © 2016年 AkkeyLab. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    fileprivate let task = Process()
    fileprivate let alert = NSAlert()
    fileprivate var homeDir: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        homeDir = NSHomeDirectory()
    }

    @IBAction func mkDir(_ sender: AnyObject) {
//        let outputDir: String = homeDir + "/Desktop/AkkeyLab"
        let outputDir: String = homeDir + "/AkkeyLab"
        NSLog("\(outputDir)")

        task.launchPath = "/bin/mkdir"
        task.arguments = [outputDir]

        task.launch()
    }

    @IBAction func cp(_ sender: AnyObject) {
        let panel = NSOpenPanel()
        // ファイル選択を許可させる
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = NSImage.imageTypes()
        panel.begin(completionHandler: { (num) -> Void in
            if num == NSModalResponseOK {
                self.readItem((panel.url?.path)!)
            }
        })
    }

    func readItem(_ url: String) {
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

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

