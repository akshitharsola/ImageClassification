//
//  ResultViewController.swift
//  ImageClassification
//
//  Created by Akshit Harsola on 01/07/24.
//

import UIKit
import CoreML
import Vision

class ResultViewController: UIViewController {
    var image: UIImage?
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = image {
                   resultImage.image = image.resizeTo(size: CGSize(width: 224, height: 224)) // Using the resizeTo method from UIExtension.swift
                   classifyImage(image)
               } else {
                   print("Image is nil")
               }
    }
    func classifyImage(_ image: UIImage) {
        print("Starting image classification")
                ImageClassifier.classifyImage(image) { [weak self] identifier, confidence in
                    self?.resultLabel.text = "\(identifier) (\(confidence * 100)%)"
//                    self?.backButton.isHidden = false // Make sure the back button is visible
                    print("Classification result: \(identifier) (\(confidence * 100)%)")
                }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        // Perform segue to go back to MainViewController
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
