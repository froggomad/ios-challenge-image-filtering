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
    
    let imageFilterer = ImageFilterer()
    let context = CIContext(options: nil)
    
    static var filteredImageData: Data?
    
    override class func setUp() {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        // Fetch the pre-filtered image to use as a comparison to the filtered image from the student before beginning the test.
        fetchFilteredImage(completion: { (data) in
            
            filteredImageData = data
            
            semaphore.signal()
        })
        
        semaphore.wait()
    }
    
    func testImageFiltering() {
        
        guard let lionImage = UIImage(named: "Lion"),
            let filteredImage = imageFilterer.filterImage(lionImage),
            let base64FilteredImage = filteredImage.pngData()?.base64EncodedString(),
            let base64ComparisonImage = ImageFilteringTests.filteredImageData?.base64EncodedString() else {
                XCTFail("Image(s) are nil")
                return
        }
        
        let distance = hammingDistance(photoOne: base64FilteredImage, photoTwo: base64ComparisonImage)
        
        XCTAssertEqual(distance, 0)
    }
    
    private func filterImage(_ image: UIImage?) -> UIImage? {
        
        let filter = CIFilter(name: "CIPhotoEffectInstant")!
        
        guard let image = image else { return nil }
        
        let ciImage = CIImage(image: image)
        
        filter.setValue(ciImage, forKey: "inputImage")
        
        var filteredImage: UIImage? = nil
        
        if let outputImage = filter.outputImage,
            
            let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            
            filteredImage = UIImage(cgImage: cgImage)
        }
        
        return filteredImage
    }
    
    private func hammingDistance(photoOne: String, photoTwo: String) -> Int? {
        guard !photoOne.isEmpty, !photoTwo.isEmpty else {
            return nil
        }
        
        var w1Iterator = photoOne.makeIterator()
        var w2Iterator = photoTwo.makeIterator()
        
        var distance = 0;
        while let w1Char = w1Iterator.next(), let w2Char = w2Iterator.next()  {
            distance += (w1Char != w2Char) ? 1 : 0
        }
        return distance
    }
    
    static private func fetchFilteredImage(completion: @escaping (Data?) -> Void) {
        
        let imageURL = URL(string: "https://tk-assets.lambdaschool.com/d6b9da5c-24a3-43e0-96d1-3ffe83dc8161_lion.png")!
        
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            
            if let error = error {
                NSLog("Error fetching filtered image to compare: \(error)")
            }
            
            completion(data)
            
        }.resume()
    }
}
