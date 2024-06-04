//
//  ImageUploadView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { (image, error) in
                    DispatchQueue.main.async {
                        self.parent.selectedImage = image as? UIImage
                    }
                }
            }
        }
    }
}

import SwiftUI
 
struct ImageUploadView: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding()
                } else {
                    Text("No Image Selected")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                Button(action: {
                    isShowingImagePicker = true
                }) {
                    Text("Upload Image")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .sheet(isPresented: $isShowingImagePicker, onDismiss: addSelectedImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
            }
        }
    }
    
    private func addSelectedImage() {
        // The image is already set in the binding, so no additional logic is needed here.
    }
}



#Preview {
    ImageUploadView()
}
