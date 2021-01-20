//
//  ImagePickerController.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct ImagePickerController: UIViewControllerRepresentable {
    @Binding var showSelectPhoto: Bool
    @Binding var selectImage: Image
    
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(imagePickerController: self)
        
    }
    
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        internal init(imagePickerController: ImagePickerController) {
            self.imagePickerController = imagePickerController
        }
        
        let imagePickerController: ImagePickerController
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
            if let uiImage = info[.originalImage] as? UIImage {
                imagePickerController.selectImage = Image(uiImage: uiImage)
            }
            imagePickerController.showSelectPhoto = false
        }
    }
    
    func updateUIViewController(_ uiViewController:
        UIImagePickerController, context: Context) {

    }

    func makeUIViewController(context: Context) ->
        UIImagePickerController {
        let controller = UIImagePickerController()
            controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }
}

struct ImagePickerController_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
