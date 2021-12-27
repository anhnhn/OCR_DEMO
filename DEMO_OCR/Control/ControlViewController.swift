//
//  ControlViewController.swift
//  DEMO_OCR
//
//  Created by Nguyen Anh on 27/12/2021.
//

import UIKit
import SwiftyTesseract

class ControlViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startOcr(image: UIImage?) {
        guard let imageCheck = image else {
            return
        }
        Utils.showLoadingIndicator()
        let tesseract = SwiftyTesseract(languages: [.english, .vietnamese, .japanese])
        tesseract.performOCR(on: imageCheck) {value in
            self.result.text = value
            print("====", value)
            Utils.hideLoadingIndicator()
        }
    }

    @IBAction func selectImageButton(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
            imagePickerController.allowsEditing = false //If you want edit option set "true"
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image.image = tempImage
        Utils.showLoadingIndicator()
        self.dismiss(animated: true, completion: {
            self.startOcr(image: tempImage)
        })
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
