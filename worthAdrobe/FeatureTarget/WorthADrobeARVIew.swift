//
//  CustomARVIew.swift
//  worthAdrobe
//
//  Created by Khadijah Rizqy on 23/05/23.
//

import ARKit
import SwiftUI
import RealityKit

class WorthADrobeARView: ARView {
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    
    func enableTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))

        self.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let tapLocation = recognizer.location(in: self)
        
        guard let rayResult = self.ray(through: tapLocation) else { return }
        
        let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)

        if let firstResult = results.first {
            var position = firstResult.position
            position.y += 0.35/2
            
            placeClothes(at: position)
        } else {
            let results = self.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
            if let firstResult = results.first {
                let position = simd_make_float3(firstResult.worldTransform.columns.3)
                placeClothes(at: position)
                UserDefaults.standard.set(false, forKey: "emptyAnchors")
            }
        }
    }
    
    func placeClothes(at position: SIMD3<Float>) {
        let redShirtEntity = try! ModelEntity.loadModel(named: "folded-red-shirt.usdz")
        
        var redShirtScale : Float = 0.0085
        
        if UserDefaults.standard.float(forKey: "scale") != 0.0 {
            redShirtScale = UserDefaults.standard.float(forKey: "scale")
        }
        redShirtEntity.scale = SIMD3<Float>(repeating: redShirtScale)
        redShirtEntity.generateCollisionShapes(recursive: true)
        
        let anchor = AnchorEntity(world: position)
        anchor.addChild(redShirtEntity)
        
        self.scene.addAnchor(anchor)
    }
    
    func removeAllClothes() {
        self.scene.anchors.removeAll()
    }
    
    func undo() {
        if self.scene.anchors.isEmpty {
            UserDefaults.standard.set(true, forKey: "emptyAnchors")
        } else {
            UserDefaults.standard.set(false, forKey: "emptyAnchors")
            self.scene.anchors.remove(at:self.scene.anchors.count - 1)
        }
    }

}
