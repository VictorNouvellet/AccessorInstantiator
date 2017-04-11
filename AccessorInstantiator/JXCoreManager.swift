//
//  JXCoreManager.swift
//  AccessorInstantiator
//
//  Created by Victor Nouvellet on 3/13/17.
//  Copyright © 2017 Victor Nouvellet. All rights reserved.
//

import UIKit

class JXCoreManager: NSObject {
    static let logUpdatedNotificationName: NSNotification.Name = NSNotification.Name("LogUpdated")
    
    static let shared = JXCoreManager()
    
    var isStarted: Bool = false
    var log: String = ""
    
    func start() {
        guard self.isStarted == false else {
            // do not initialize JXcore twice
            return
        }
        
        // makes JXcore instance running under it's own thread
        JXcore.useSubThreading()
        
        // start engine (main file will be JS/main.js. This is the initializer file)
        JXcore.startEngine("JS/main")
        
        // Create JS-Swift native blocks
        self.addNativeBlocks()
        
        // Start the application (app.js)
        let params = ["app.js"]
        JXcore.callEventCallback("StartApplication", withParams: params)
        
        self.isStarted = true
    }
    
    func callEventCallback(callbackName: String, params: [Any]?) {
        JXcore.callEventCallback(callbackName, withParams: params)
    }
    
    private func addNativeBlocks() {
        
        // Define ScreenBrightness method to JS side so we can call it from there (see app.js)
        JXcore.addNativeBlock({ (params:[Any]?, callbackId:String?) in
            let br = UIScreen.main.brightness
            
            JXcore.callEventCallback(callbackId, withJSON: "\(br)")
        }, withName: "ScreenBrightness")
        
        // Define log method to JS side so we can call it from there (see app.js)
        JXcore.addNativeBlock({ (params:[Any]?, callbackId:String?) in
            let logMessage: String = params![0] as! String
            DispatchQueue.main.async {
                self.log += logMessage + "\n"
                NotificationCenter.default.post(name: JXCoreManager.logUpdatedNotificationName, object: nil)
            }
        }, withName: "log")

        // Listen to Errors on the JS land
        JXcore.addNativeBlock({ (params:[Any]?, callbackId:String?) in
            let errorMessage: String = params![0] as! String
            let errorStack: String = params![1] as! String
            print("Error: \(errorMessage)\nStack:\(errorStack)\n")
        }, withName: "OnError")
        
        // Alert
        JXcore.addNativeBlock({ (params:[Any]?, callbackId:String?) in
            guard let rootVC = UIApplication.shared.windows.first?.rootViewController else {
                print("Alert could not be displayed: \(String(describing: params))")
                return
            }
            
            let title: String = params![0] as! String
            let message: String = params![1] as! String
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            })
            alert.addAction(defaultAction)
            
            rootVC.present(alert, animated: true, completion: { _ in })
            
        }, withName: "Alert")
    }
}
