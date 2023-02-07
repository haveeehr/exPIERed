//
//  exPIERedApp.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 11/01/23.
//

import SwiftUI

@main
struct exPIERedApp: App {
    var body: some Scene {
        WindowGroup {
            HighlightsPage().onAppear {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
                    if success {
                        print("All set")
                    }
                    else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
