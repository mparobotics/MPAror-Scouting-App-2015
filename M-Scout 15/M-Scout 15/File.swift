//
//  File.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/18/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit
import Foundation

class File: NSObject {
    
    class func exists (path: String) -> Bool {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        return NSFileManager().fileExistsAtPath(String(format: "%@/%@", documentsPath, path))
    }
    
    class func remove (path: String) -> Bool {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        return NSFileManager().removeItemAtPath(String(format: "%@/%@", documentsPath, path), error: nil)
    }
    
    class func read (path: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        if File.exists(path) {
            let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
            return String(contentsOfFile: String(format: "%@/%@", documentsPath, path), encoding: encoding, error: nil)!
        }
        
        return nil
    }
    
    class func readImage (path: String) -> UIImage? {
        if File.exists(path) {
            let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
            let rawImage = UIImage(contentsOfFile: String(format: "%@/%@", documentsPath, path))
            
            let flippedImage = UIImage(CGImage: rawImage?.CGImage, scale: 1.0, orientation: .DownMirrored)
            
            return rawImage
        }
        
        return nil
    }
    
    class func write (path: String, content: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> Bool {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        return content.writeToFile(String(format: "%@/%@", documentsPath, path), atomically: true, encoding: encoding, error: nil)
    }
    
    class func writeImage (path: String, content: UIImage) -> Bool {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        return UIImagePNGRepresentation(content).writeToFile(String(format: "%@/%@", documentsPath, path), atomically: true)
    }
    
    class func listFileType (type: String) {
        let fileManager = NSFileManager.defaultManager()
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        let enumerator:NSDirectoryEnumerator = fileManager.enumeratorAtPath(documentsPath)!
        
        while let element = enumerator.nextObject() as? String {
            if element.hasSuffix(type) { // checks the extension
                println(element)
            }
        }
    }
   
}
