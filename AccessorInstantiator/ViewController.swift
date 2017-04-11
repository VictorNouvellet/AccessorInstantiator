//
//  ViewController.swift
//  AccessorInstantiator
//
//  Created by Victor Nouvellet on 3/13/17.
//  Copyright © 2017 Victor Nouvellet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textViewLog: UITextView!
    @IBOutlet var labelTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textViewLog.text = ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(logChanged(_ :)), name: JXCoreManager.logUpdatedNotificationName, object: nil)
        JXCoreManager.shared.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func logChanged(_ notification: NSNotification) {
        self.changeEphemeralStatus(ephemeralStatus: "Working...")
        self.textViewLog.text = JXCoreManager.shared.log
    }

    func changeEphemeralStatus(ephemeralStatus: String) {
        self.labelTitle.text = ephemeralStatus
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.labelTitle.text = "Accessor Host"
        }
    }
}
