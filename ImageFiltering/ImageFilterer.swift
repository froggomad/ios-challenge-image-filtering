//
//  ImageFilterer.swift
//  ImageFilteringResourcefulnessAssessment
//
//  Created by Spencer Curtis on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ImageFilterer {
    
    let context = CIContext(options: nil)
    func filterImage(_ image: UIImage?) -> UIImage? {
        let ciImage = CIImage(image: image!)
        let filter = CIFilter(name: "CIPhotoEffectInstant")
        filter?.setValue(ciImage, forKey: "inputImage")
        let ciOutput = filter?.outputImage
        let cgImage = context.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
        return UIImage(cgImage: cgImage!)
    }
}
