//
//  NetworkMoniteringApp.swift
//  NetworkMonitering
//
//  Created by kazunori.aoki on 2022/07/06.
//

import SwiftUI

@main
struct NetworkMoniteringApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NetworkMonitoring())
        }
    }
}
