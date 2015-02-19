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
        return NSFileManager().fileExistsAtPath(path)
    }
    
    class func remove (path: String) -> Bool {
        return NSFileManager().removeItemAtPath(path, error: nil)
    }
    
    class func read (path: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        if File.exists(path) {
            return String(contentsOfFile: path, encoding: encoding, error: nil)!
        }
        
        return nil
    }
    
    class func write (path: String, content: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> Bool {
        return content.writeToFile(path, atomically: true, encoding: encoding, error: nil)
    }
   
}
