//
//  ViewController.swift
//  MemeMe
//
//  Created by Hung Truong on 10/9/23.
//

import UIKit

class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnCamera: UIButton!
    @IBOutlet var btnAlbum: UIButton!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Done with an image")
    }
    
    @IBAction func showAlbum() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func showCamera() {
        
    }
}

