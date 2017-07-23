//
//  UserDefaults+FirstLaunch.swift
//  SwiftKick
//
//  Created by Jason Dudash on 11/6/16.
//  Copyright © 2016 Jason Dudash. All rights reserved.
//

#if !(SK_IGNORE_USERDEFAULTS)
    
import Foundation
    
extension UserDefaults {
  
    private static let FIRST_LAUNCH_FLAG = "FirstLaunchFlag"
    
    // After initial run in your app this will get set to true and remain in the UserDefaults.
    // so you can use it to check for first launch of the app after install
    public static func isFirstLaunch() -> Bool {
        let isFirstLaunch = UserDefaults.standard.string(forKey: FIRST_LAUNCH_FLAG) == nil
        if (isFirstLaunch) {
            UserDefaults.standard.set("false", forKey: FIRST_LAUNCH_FLAG)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }

}

#endif
