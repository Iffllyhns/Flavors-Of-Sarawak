//
//  ARContainerView.swift
//  Flavors Of Sarawak
//
//  Created by Iffllyhns Azharri on 08/12/2023.
//

import SwiftUI
import RealityKit
import ARKit

struct ARContainerView: UIViewRepresentable {

    var arAssetName: String
    var recipeName: String

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        // Set up AR configuration
        let arConfiguration = ARWorldTrackingConfiguration()
        arConfiguration.planeDetection = [.horizontal, .vertical]
        arConfiguration.environmentTexturing = .automatic

        // Check if ARMesh is supported and enable scene reconstruction
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            arConfiguration.sceneReconstruction = .mesh
        }

        // Run AR session with the custom configuration
        arView.session.run(arConfiguration)

        // Load AR content based on arAssetName
        if let modelEntity = try? ModelEntity.loadModel(named: arAssetName) {
            // Place the model in the center of the screen
            let anchorEntity = AnchorEntity()
            anchorEntity.addChild(modelEntity)
            arView.scene.addAnchor(anchorEntity)

            modelEntity.generateCollisionShapes(recursive: true)

            arView.installGestures([.translation, .rotation, .scale], for: modelEntity)
        }

        // Add tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)

        // Add long press gesture recognizer
        let longPressGesture = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleLongPress(_:)))
        arView.addGestureRecognizer(longPressGesture)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Handle updates if needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator {
        var parent: ARContainerView

        init(_ parent: ARContainerView) {
            self.parent = parent
        }

        // Handle Tap
        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            guard let arView = gesture.view as? ARView else { return }
            let location = gesture.location(in: arView)

            // Perform a hit test to find the AR entity at the tapped location
            if let entity = arView.entity(at: location) {
                print("Tapped on entity: \(entity)")

                // Display recipe name as an annotation
                arView.showAnnotation(parent.recipeName, for: entity)
            }
        }

        // Handle Long Press
        @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
            guard let arView = gesture.view as? ARView else { return }
            let location = gesture.location(in: arView)

            if gesture.state == .began {
                if let entity = arView.entity(at: location) {
                    print("Long press on entity: \(entity)")
                    // Animate rotation slowly
                    self.animateSlowRotation(for: entity)
                }
            }
        }

        // Animate Rotation Slowly
        private func animateSlowRotation(for entity: Entity) {
            let duration = 10.0
            let rotation = simd_quatf(angle: Float.pi * 2, axis: [0, 1, 0]) // Rotate 360 degrees around the Y-axis

            // Create a transform with the desired rotation
            let rotatedTransform = Transform(rotation: rotation)

            // Animate the rotation
            entity.move(to: rotatedTransform, relativeTo: nil, duration: duration, timingFunction: .easeInOut)
        }
    }
}

extension ARView {
    func showAnnotation(_ text: String, for entity: Entity) {
        // Create a text entity
        let textMesh = MeshResource.generateText(text, extrusionDepth: 0.01, font: .systemFont(ofSize: 0.01))
        let textMaterial = SimpleMaterial(color: .white, isMetallic: false)
        let textEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])

        // Attach the text entity as a child to the tapped entity
        entity.addChild(textEntity)
    }
}
