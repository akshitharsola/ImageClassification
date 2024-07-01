# Image Classification iOS App using Core ML

## Overview
This project is an iOS application that leverages Core ML to classify images using the MobileNetV2 model. The app allows users to upload an image, classify it, and view the results on a separate screen.


## Features
• Core ML Integration: Utilizes the MobileNetV2 model for image classification.
• Intuitive UI: Users can upload an image via a tap on an image view.
• Dynamic Classify Button: Button activates upon image upload, enhancing user interaction.
• Result Display: Shows resized image and predicted label on a separate screen.
• Navigation: Includes a back button to return to the main screen for new classifications.
• UI/UX Enhancements: Classify button changes color upon activation for better engagement.

## Screenshots
![Simulator Screenshot - iPhone 15 Pro - 2024-07-01 at 19 12 20](https://github.com/akshitharsola/ImageClassification/assets/84063850/3a25fce3-97e2-4af9-90fa-d1e90cc13b10)
![Simulator Screenshot - iPhone 15 Pro - 2024-07-01 at 19 12 13](https://github.com/akshitharsola/ImageClassification/assets/84063850/d0bc6a84-d298-4d25-9c5a-b35af9323805)



## Getting Started
### Prerequisites
• Xcode
• Swift
• iOS 12.0 or later

### Installation
• Clone the repository: https://github.com/akshitharsola/ImageClassification.git
• Open the project in Xcode.
• Build and run the project on your simulator or physical device.

### Usage
• Launch the app.
• Tap on the image view to upload an image from your library.
• Once the image is uploaded, the classify button will activate.
• Tap the classify button to get the classification result.
• View the result on the next screen and use the back button to return to the main screen for new classifications.

### Core ML Model
• Model: MobileNetV2
• Author: [Original Paper: Mark Sandler, Andrew Howard, Menglong Zhu, Andrey Zhmoginov, Liang-Chieh Chen.]
• License: [Please see https://github.com/tensorflow/tensorflow for license information, and https://github.com/tensorflow/models/tree/master/research/slim/nets/mobilenet for the original source of the model.]
• Details: [Detects the dominant objects present in an image from a set of 1001 categories such as trees, animals, food, vehicles, person etc. The top-1 accuracy from the original publication is 74.7%.]

### Technical Details

#### Core ML Integration
The MobileNetV2 model is integrated using Vision and Core ML to provide robust image classification.

#### UIImage Extensions
Extensions for UIImage are used to resize images and convert them to a format suitable for classification.

#### Swift
The app is developed in Swift, leveraging the power of this language for efficient and effective development.

#### Storyboards & Autolayout
The UI is designed using storyboards and autolayout for a responsive and adaptive user interface.

#### License
This project is licensed under the [License Name] - see the LICENSE.md file for details.

### Author
Your Name - Akshit Harsola
LinkedIn Profile - https://www.linkedin.com/in/akshit-harsola-17b478216
GitHub Profile - https://github.com/akshitharsola/ImageClassification

### Acknowledgments
MobileNetV2 for providing the model.

### Contributing
1. Fork the repository.
2. Create your feature branch: git checkout -b my-new-feature.
3. Commit your changes: git commit -m 'Add some feature'.
4. Push to the branch: git push origin my-new-feature.
5. Submit a pull request.

## Contact
Feel free to reach out for collaboration or questions:

Email: [harsolaakshit@gmail.com]
