//
//  CameraViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2021/5/19.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    private var captureSession = AVCaptureSession()
    private var mainCamera: AVCaptureDevice?
    private var innnerCamera: AVCaptureDevice?
    private var currentCamera: AVCaptureDevice?
    private var photoOutput: AVCapturePhotoOutput?
    private var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCaptureSession()
        self.setDevice()
        self.setInputOutput()
        self.setPreviewLayer()
        self.captureSession.startRunning()
    }
}
// MARK: - Privaate
extension CameraViewController {
    private func setCaptureSession() {
        self.captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    private func setDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                self.mainCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                self.innnerCamera = device
            }
        }
        self.currentCamera = self.mainCamera
    }
    private func setInputOutput() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: self.currentCamera!)
            self.captureSession.addInput(captureDeviceInput)
            self.photoOutput = AVCapturePhotoOutput()
            self.photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
        } catch {
            print(error)
        }
    }
    private func setPreviewLayer() {
        self.cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        self.cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(self.cameraPreviewLayer!, at: 0)
    }
}
