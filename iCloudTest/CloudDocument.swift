//
//  CloudDocument.swift
//  iCloudTest
//
//  Created by Peter Hastie on 5/3/23.
//

import Foundation

class CloudDocument: ObservableObject {
    @Published var text: String = ""
    
    let containerURL: URL?
    var documentURL: URL?
    
    init() {
        containerURL = FileManager.default.url(forUbiquityContainerIdentifier: nil)?.appendingPathComponent("Documents")
        documentURL = containerURL?.appendingPathComponent("Gumgrumle.txt")
    }
    
    
    func loadFromiCloud() {
        if let documentPath = documentURL?.path {
            print("Attempting to load data from \(documentPath)")
            if FileManager.default.fileExists(atPath: documentPath, isDirectory: nil) {
                if let databuffer = FileManager.default.contents(atPath: documentPath) {
                    if let dataString = NSString(data: databuffer, encoding: String.Encoding.utf8.rawValue) {
                        print("Loaded data: \(dataString)")
                        text = dataString as String
                    } else {
                        print("Could not decode document content to string")
                    }
                } else {
                    print("Unable to read document")
                }
            } else {
                print("Document doesn't exist")
            }
        } else {
            print("Unable to get documentPath")
        }
        
    }
    
    func saveToiCloud() {
        // Create the Documents directory if it doesn't exist
        if let containerPath = containerURL?.path {
            var isDir: ObjCBool = false
            if !FileManager.default.fileExists(atPath: containerPath, isDirectory: &isDir) {
                print("Container path doesn't exist, will create it. Directory? \(isDir)")
                do {
                    try FileManager.default.createDirectory(atPath: containerPath, withIntermediateDirectories: true)
                } catch {
                    print("Failed to create Documents directory at \(containerPath)")
                }
            } else {
                print("Container path exists. Directory? \(isDir)")
            }
        } else {
            print("Unable to get containerPath for saving")
        }
        
        // Save the document in Documents directory
        if let docURL = documentURL {
            do {
                print("Saving document to iCloud at \(docURL)")
                try text.write(to: docURL, atomically: true, encoding: .utf8)
            } catch {
                print("Failed to create iCloud file \(error)")
            }
        } else {
            print("Document URL not set for saving")
        }
    }
}
