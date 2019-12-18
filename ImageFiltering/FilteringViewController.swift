//
//  ViewController.swift
//  ImageFiltering
//
//  Created by Spencer Curtis on 12/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FilteringViewController: UIViewController {
    
    @IBOutlet weak var inputImageView: UIImageView!
    @IBOutlet weak var outputImageView: UIImageView!
    
    let imageFilterer = ImageFilterer()
    
    @IBAction func performFilter(_ sender: Any) {
        let filteredImage = imageFilterer.filterImage(UIImage(named: "Lion"))
        outputImageView.image = filteredImage
    }
}

