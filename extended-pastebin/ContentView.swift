//  ContentView.swift
//  extended-pastebin
//  Created by alx on 2/4/24.

import SwiftUI
import Foundation
import AppKit

struct ContentView: View {
    @State private var memoy: [String] = ["[Empty]","[Empty]","[Empty]","[Empty]","[Empty]","[Empty]","[Empty]","[Empty]","[Empty]","[Empty]"]
    var body: some View {
        VStack {
            Text("Extended Pastebin:")
                .padding(.top, 10)
            Divider()
                .frame(width: 175)
            ForEach(0..<memoy.count,id:\.self) { index in
                SavedPaste(
                    button: "\(FixLength(memoy[index]))",
                    onTap: {
                        if(memoy[index] != "[Empty]") { CopyToClip(memoy[index])
                        }
                    },
                    onCommandTap: {
                        let p = NSPasteboard.general
                        guard let s = p.string(forType: .string) else { return }
                        memoy[index] = s
                    }
                )
            }
                .frame(width: 200)
            Divider()
                .frame(width: 175)
                .padding(.top, 3)
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
                .padding(.bottom, 10)
                .buttonStyle(BorderlessButtonStyle())
        }
        .background(Color(nsColor: .windowBackgroundColor))
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: 200)
    }
    
    private func FixLength(_ string: String) -> String {
        if string.count > 25 {
            return String(string.prefix(25)) + "..."
        } else {
            return string
        }
    }
    
}

#Preview {
    ContentView()
}
