//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Paul Richardson on 03.09.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import UIKit

class ImageSaver: NSObject {
	
	var successHandler: (() -> Void)?
	var errorHandler: ((Error) -> Void)?
	
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
	}
	
	@objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		if let error = error {
			errorHandler?(error)
		} else {
			successHandler?()
		}
	}
}
