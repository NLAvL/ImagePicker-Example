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

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    @IBOutlet weak var testImageView: UIImageView!
    
    var testImage : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pickPhotoTapped(_ sender: UITapGestureRecognizer) {
        let presentImagePickerController: (UIImagePickerControllerSourceType) -> () = { source in
            let controller = UIImagePickerController()
            controller.delegate = self
            var sourceType = source
            if (!UIImagePickerController.isSourceTypeAvailable(sourceType)) {
                sourceType = .photoLibrary
                print("Fallback to camera roll as a source since the simulator doesn't support taking pictures")
            }
            controller.sourceType = sourceType
            
            self.present(controller, animated: true, completion: nil)
        }
        
        let controller = ImagePickerSheetController(mediaType: .image)
        
        //FIRST ACTION
        controller.addAction(ImagePickerAction(title: NSLocalizedString("Take Photo", comment: "Action Title"), secondaryTitle: NSLocalizedString("Add Review", comment: "Action Title"), handler: { _ in
            
            // TAKE A PHOTO
            presentImagePickerController(.camera)
            
        }, secondaryHandler: { _, numberOfPhotos in
            
            // ADD REVIEW (with selected image(s)
            print("Comment \(numberOfPhotos) photos")
            print("Segue to WRITE review controller with the selected image")
            
        }))
        
        //SECOND ACTION
        controller.addAction(ImagePickerAction(title: NSLocalizedString("Photo Library", comment: "Action Title"), secondaryTitle: { NSString.localizedStringWithFormat(NSLocalizedString("Use This Photo", comment: "Action Title") as NSString, $0) as String}, handler: { _ in
            
            //PHOTO LIBRARY
            presentImagePickerController(.photoLibrary)
            
        }, secondaryHandler: { _, numberOfPhotos in
            
            //USE THIS PHOTO
            print("Add the selected photo to the album")
            print("\(controller.selectedAssets)")
            //testImage.images = controller.selectedAssets[0]
            //testImage = controller.selectedAssets[0]

            self.convertPickedImage(asset: controller.selectedAssets[0])
            
        }))
        
        //THIRD / SEPERATE ACTION
        controller.addAction(ImagePickerAction(cancelTitle: NSLocalizedString("Cancel", comment: "Action Title")))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.sourceView = view
            controller.popoverPresentationController?.sourceRect = CGRect(origin: view.center, size: CGSize())
        }
        
        present(controller, animated: true, completion: nil)
        
    }
    
    
    
    func convertPickedImage(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        //var pickedImage = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 500, height: 500), contentMode: .aspectFill, options: option, resultHandler: {(result, info)->Void in
            //pickedImage = result!
            self.testImage = result!
            self.testImageView.image = self.testImage
        })
        //return pickedImage
        return testImage
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






