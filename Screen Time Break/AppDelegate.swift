//
//  AppDelegate.swift
//  Screen Time Break
//
//  Created by Pieter Yoshua Natanael on 18/03/24.
//


import UIKit
import AVFoundation


class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Request audio background permission
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set audio session category.")
        }

        return true
    }
}

/*
import UIKit
import AVFoundation

class AppDelegate: UIResponder, UIApplicationDelegate {
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize audio session
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .spokenAudio)
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session category.")
        }
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        startBackgroundTask()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        endBackgroundTask()
    }

    func startBackgroundTask() {
        endBackgroundTask()
        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "MyAppBackgroundTask") {
            // End the task if time expires.
            self.endBackgroundTask()
        }
    }

    func endBackgroundTask() {
        if backgroundTask != .invalid {
            UIApplication.shared.endBackgroundTask(backgroundTask)
            backgroundTask = .invalid
        }
    }
}


*/
