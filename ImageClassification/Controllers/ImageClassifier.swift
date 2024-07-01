//
//  ImageClassifier.swift
//  ImageClassification
//
//  Created by Akshit Harsola on 01/07/24.
//

import CoreML
import Vision
import UIKit

class ImageClassifier {
    static func classifyImage(_ image: UIImage, completion: @escaping (String, Float) -> Void) {
        guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else {
            print("Failed to load model")
            return
        }

        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                print("Classification error: \(error)")
                return
            }
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first else {
                print("No classification results")
                return
            }
            DispatchQueue.main.async {
                completion(topResult.identifier, topResult.confidence)
            }
        }

        guard let ciImage = CIImage(image: image) else {
            print("Failed to create CIImage")
            return
        }

        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([request])
                print("Handler performed successfully")
            } catch {
                print("Handler error: \(error)")
            }
        }
    }
}
