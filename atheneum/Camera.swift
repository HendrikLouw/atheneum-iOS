//
//  Camera.swift
//  atheneum
//
//  Created by Hendrik Louw on 2015/10/07.
//  Copyright © 2015 Thoughtworks. All rights reserved.
//


import AVFoundation

class Camera {
    let captureSession = AVCaptureSession()
    var captureDevice: AVCaptureDevice!
    
    var previewLayer: AVCaptureVideoPreviewLayer?

    init() {
        captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        
        for device in AVCaptureDevice.devices() {
            if(device.hasMediaType(AVMediaTypeVideo)) {
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as! AVCaptureDevice
                }
            }
        }
        
        do {
            try captureSession.addInput(AVCaptureDeviceInput(device: captureDevice))
        } catch {
            print("Could not add the captureDevice to the captureSession")
        }

        
    }
    
    func start() -> AVCaptureVideoPreviewLayer {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        captureSession.startRunning()
        return previewLayer!
    }
}
