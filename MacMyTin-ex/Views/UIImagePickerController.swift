//
//  UIImagePickerController.swift
//  MacOS
//
//  Created by MacBook Pro on 07/06/24.
//

import Foundation
import SwiftUI
import AppKit

struct ImagePicker: NSViewRepresentable {
    @Binding var image: NSImage?

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        context.coordinator.selectImage()
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func selectImage() {
            let openPanel = NSOpenPanel()
            openPanel.allowsMultipleSelection = false
            openPanel.canChooseDirectories = false
            openPanel.canCreateDirectories = false
            openPanel.canChooseFiles = true
            openPanel.allowedFileTypes = ["png", "jpg", "jpeg", "tiff", "gif", "bmp"]

            openPanel.begin { (result) in
                if result == .OK, let url = openPanel.url, let image = NSImage(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.parent.image = image
                    }
                }
            }
        }
    }
}
