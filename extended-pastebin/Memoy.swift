//  Memoy.swift
//  extended-pastebin
//  Created by alx on 2/4/24.

import Foundation
import Cocoa
import SwiftUI
import AppKit

struct SavedPaste: View {
    var button: String
    var onTap: () -> Void
    var onCommandTap: () -> Void
    var body: some View {
        Button(action: {
            if CommandKeyPressed() {
                onCommandTap()
            } else  {
                onTap()
            }
        }) { HStack {
                Text(button)
                
            }
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

func CommandKeyPressed() -> Bool {
    return NSEvent.modifierFlags.contains(.command)
}

func CopyToClip(_ text: String) {
    let p = NSPasteboard.general
    p.clearContents()
    p.setString(text, forType: .string)
}
