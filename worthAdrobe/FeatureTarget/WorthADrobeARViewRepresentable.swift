//
//  WorthADrobeARViewRepresentable.swift
//  worthAdrobe
//
//  Created by Khadijah Rizqy on 23/05/23.
//

import SwiftUI

struct WorthADrobeARViewRepresentable: UIViewRepresentable {
    
    var arView: WorthADrobeARView
    
    func makeUIView(context: Context) -> WorthADrobeARView {
        arView.enableTapGesture()
        return arView
    }
    
    func updateUIView(_ uiView: WorthADrobeARView, context: Context) { }

}
