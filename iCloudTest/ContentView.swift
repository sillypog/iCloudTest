//
//  ContentView.swift
//  iCloudTest
//
//  Created by Peter Hastie on 5/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var doc: CloudDocument
    
    var body: some View {
        VStack {
            TextField("Enter text", text: $doc.text)
            HStack {
                Button("Load from iCloud") {
                    doc.loadFromiCloud()
                }
                .buttonStyle(.borderedProminent)
                Button("Save to iCloud") {
                    doc.saveToiCloud()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(doc: CloudDocument())
    }
}
