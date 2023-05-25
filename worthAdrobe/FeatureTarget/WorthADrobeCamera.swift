//
//  WorthADrobeCamera.swift
//  worthAdrobe
//
//  Created by Khadijah Rizqy on 24/05/23.
//

import Foundation
import SwiftUI

struct WorthADrobeCamera: View {
    
    let arView = WorthADrobeARView()
    
    func resetStack() {
        arView.removeAllClothes()
    }
    
    func undo(){
        arView.undo()
    }
    
    func capturePhoto() {
        arView.snapshot(saveToHDR: false) { (image) in
          
          // Compress the image
          let compressedImage = UIImage(data: (image?.pngData())!)
          // Save in the photo album
          UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
        }
    }
    
    var body: some View {
        WorthADrobeARViewRepresentable(arView: arView)
            .ignoresSafeArea()
            .overlay(alignment: .bottom) {
                HStack {
                    Button(action: {
                        resetStack()
                    }) {
                        Image(systemName: "trash.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                    }
                    
                    Button {
                        capturePhoto()
                    } label: {
                        Image(systemName: "circle.circle")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        undo()
                    }) {
                        Image(systemName: "arrow.uturn.backward.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                    }
                }
                .navigationTitle("Camera")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        WorthADrobeWardrobeView()
                    } label: {
                        Image(systemName: "cabinet.fill")
                            .font(.body)
                            .foregroundColor(.blue)
                    }
                }
            }
    }
}

struct WorthADrobeCamera_Previews: PreviewProvider {
    static var previews: some View {
        WorthADrobeCamera()
    }
}
