//
//  ScanController.swift
//  atheneum
//
//  Created by Hendrik Louw on 2015/10/06.
//  Copyright © 2015 Thoughtworks. All rights reserved.
//

import UIKit
import AVFoundation

class ScanController: UIViewController {
    
    var previewLayer: AVCaptureVideoPreviewLayer?
      
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = Camera()
        previewLayer = camera.start()
        self.view.layer.addSublayer(previewLayer!)

        previewLayer!.frame = self.view.frame
        previewLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}