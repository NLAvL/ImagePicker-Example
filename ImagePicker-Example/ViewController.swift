//
//  ViewController.swift
//  ImagePicker-Example
//
//  Created by Arthur Loo on 02-11-16.
//  Copyright © 2016 Arthur van Loo. All rights reserved.
//

import UIKit
import Photos
import ImagePickerSheetController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pickPhotoTapped(_ sender: UITapGestureRecognizer) {
        
        
    }

}




/*
 let authorization = PHPhotoLibrary.authorizationStatus()
 
 if authorization == .notDetermined {
 PHPhotoLibrary.requestAuthorization({ (status) -> Void in
 DispatchQueue.main.async(execute: { () -> Void in
 self.pickPhotoTapped(sender)
 })
 })
 }
 
 if authorization == .authorized {
 
 let controller = ImagePickerSheetController(mediaType: .image)
 
 controller.addAction(ImagePickerAction(title: NSLocalizedString("Take a Photo", comment: "Action Title"), secondaryTitle: NSLocalizedString("Use this one", comment: "Action Title"), handler: { (_) in
 
 //Primary handler
 
 
 }, secondaryHandler: { (ImagePickerAction, numberOfPhotos) in
 
 //controller.getSelectedImagesWithCompletion
 // https://www.youtube.com/watch?v=-YJLBztknY4
 // gebleven bij 10.38
 
 
 
 
 })
 
 }))
 
 } // end if authorization
 
 
 
 */






