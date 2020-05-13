//
//  ShareViewController.swift
//  ConverterExtension
//
//  Created by Vitaliy Voronok on 13.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {
    
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }
    
    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        
        guard let text = textView.text else { return }
        
        if let userDefaults = UserDefaults(suiteName: "group.com.kneo82.homeWork6") {
            userDefaults.set(text, forKey: "shareText")
        }
        
        if let url = URL(string: "HomeWork6://") {
            let selectorOpenURL = sel_registerName("openURL:")
            var responder: UIResponder? = self

            while responder != nil {
                if responder?.responds(to: selectorOpenURL) == true {
                    responder?.perform(selectorOpenURL, with: url)
                }
                responder = responder?.next
            }
        }

        dismiss(animated: false) {
            self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        }
    }
    
    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
}
