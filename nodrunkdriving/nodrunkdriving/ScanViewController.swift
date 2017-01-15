//
//  ScanViewController.swift
//  nodrunkdriving
//
//  Created by Pankaj Khillon on 1/14/17.
//  Copyright © 2017 Sarthak Khillon. All rights reserved.
//

import UIKit
import AVFoundation

class ScanViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    // MARK: Properties
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    var foundInfo: String!

    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if (metadataObjects == nil || metadataObjects.first == nil) {
            qrCodeFrameView?.frame = CGRect.zero
            print("No QR Code detected")
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        print(metadataObj.stringValue)
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            let barcodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            
            qrCodeFrameView?.frame = barcodeObject.bounds
            
            // notify user of success/failure
            var controller: UIAlertController?
        
            let successAction = UIAlertAction(title: "Done", style: .default, handler: { _ -> Void in
                let rewardsVC = self.storyboard!.instantiateViewController(withIdentifier: "rewardsVC") as! RewardsViewController
                self.present(rewardsVC, animated: true, completion: nil)
            })
            
            let failAction = UIAlertAction(title: "Done", style: .default, handler: nil)
            
            if metadataObj.stringValue == nil {
                controller = UIAlertController(title: "Uh oh!", message: "This code couldn't be scanned", preferredStyle: .alert)
                controller?.addAction(failAction)
                self.present(controller!, animated: true, completion: nil)
            } else {
                controller = UIAlertController(title: "Scan Complete!", message: nil, preferredStyle: .alert)
                controller?.addAction(successAction)
                self.present(controller!, animated: true, completion: nil)
                self.foundInfo = metadataObj.stringValue
            }
        
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // --------QR code reading----------
        
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let deviceInput = try AVCaptureDeviceInput.init(device: captureDevice)
            
            captureSession = AVCaptureSession()
            captureSession?.addInput(deviceInput as AVCaptureInput)
        } catch {
            print(error)
        }
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        // Video preview layer
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        captureSession?.startRunning()
        
        // ------ making the frame for the QR code
        qrCodeFrameView = UIView()
        qrCodeFrameView?.layer.borderColor = UIColor.green.cgColor
        qrCodeFrameView?.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView!)
        view.bringSubview(toFront: qrCodeFrameView!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let nextVC = segue.destination as! RewardsViewController
        
        if let found = self.foundInfo {
        }
    }
 

}
