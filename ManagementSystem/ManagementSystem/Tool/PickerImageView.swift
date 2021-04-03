//
//  PickerImageView.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/3.
//

import UIKit
import PhotosUI

class PickerImageView: UIViewController{
    let selectType = "image"
    
    var image: UIImage?
    
    @available(iOS 14, *)
    func setPHPicker() {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        config.preferredAssetRepresentationMode = .current
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
}

extension PickerImageView: PHPickerViewControllerDelegate {
    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        if selectType == "image" {
            if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    NSLog("一张图片\(String(describing: image))")
                    DispatchQueue.main.async {
                        self.image = image as? UIImage
                    }
                }
            }
        }
    }
}
