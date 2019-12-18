//
//  ImageFilteringTests.swift
//  ImageFilteringTests
//
//  Created by Spencer Curtis on 12/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import ImageFiltering

class ImageFilteringTests: XCTestCase {
    
    func testImageFiltering() {
        let imageFilterer = ImageFilterer()
        
        let bundle = Bundle(for: type(of: self))
        
        guard let lionImage = UIImage(named: "Lion", in: bundle, compatibleWith: nil),
            let comparisonFilteredImage = filterImage(lionImage),
            let filteredImage = imageFilterer.filterImage(lionImage) else {
                XCTFail("Image(s) are nil")
                return
        }
        
        XCTAssertEqual(comparisonFilteredImage.pngData(), filteredImage.pngData())
    }
    
    private func filterImage(_ image: UIImage?) -> UIImage? {
        guard let image = image else { return nil }
        
        let ciImage = CIImage(image: image)
        let filter = CIFilter(name: "CIPhotoEffectInstant")!
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        
        let context = CIContext(options: nil)
        guard let outputImage = filter.outputImage,
            let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
                return nil
        }
        return UIImage(cgImage: cgImage)
    }
}
