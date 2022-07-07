//
//  ContentView.swift
//  NetworkMonitering
//
//  Created by kazunori.aoki on 2022/07/06.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var monitor: NetworkMonitoring

    var body: some View {
        switch monitor.monitoringState {
        case .unsatisfied:
            Text("unsatisfied")
                .font(.largeTitle)
        case .satisfied:
            Text("satisfied")
                .font(.largeTitle)

        case .requiresConnection:
            Text("requiresConnection")
                .font(.largeTitle)
        @unknown default:
            fatalError()
        }
    }
}
