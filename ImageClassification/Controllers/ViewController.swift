//
//  ViewController.swift
//  ImageClassification
//
//  Created by Akshit Harsola on 30/06/24.
//

import UIKit
import CoreML

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
//    let model = MobileNetV2()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classifyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classifyButton.isEnabled = false
        classifyButton.alpha = 0.5
        classifyButton.layer.cornerRadius = 8
        setupImageViewTapGesture()
    }
    
    func setupImageViewTapGesture(){
        let tapGestureRecognizer =
        UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func imageViewTapped(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                imageView.image = selectedImage
                classifyButton.isEnabled = true
                classifyButton.alpha = 1.0
//                startBlinkingButton()
            }
            dismiss(animated: true, completion: nil)
        }
    
    
    
//    func startBlinkingButton() {
//            UIView.animate(withDuration: 0.8,
//                           delay: 0.0,
//                           options: [.repeat, .autoreverse],
//                           animations: { self.classifyButton.alpha = 0.1 },
//                           completion: nil)
//        }
    
 /*   func setupButtonHighlight() {
            classifyButton.addTarget(self, action: #selector(highlightButton(_:)), for: [.touchDown, .touchDragEnter])
            classifyButton.addTarget(self, action: #selector(unhighlightButton(_:)), for: [.touchUpInside, .touchDragExit, .touchCancel, .touchUpOutside])
        }

    @IBAction func highlightButton(_ sender: UIButton) {
        // Generate a random color
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1.0)
        sender.backgroundColor = randomColor
    }

    @IBAction func unhighlightButton(_ sender: UIButton) {
        // Generate a random color
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1.0)
        sender.backgroundColor = randomColor
    }
*/
    @IBAction func classifyButtonTapped(_ sender: UIButton) {
        print("Classify Button Tapped..")
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToResult" {
               let destinationVC = segue.destination as! ResultViewController
               destinationVC.image = imageView.image
           }
       }
}

