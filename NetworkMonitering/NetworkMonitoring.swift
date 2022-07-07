//
//  NetworkMonitoring.swift
//  NetworkMonitering
//
//  Created by kazunori.aoki on 2022/07/06.
//

import Foundation
import Network

final class NetworkMonitoring: ObservableObject {
    @Published var monitoringState: NWPath.Status = .unsatisfied

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "com.network.monitoring.queue")

    init() {
        monitoring()
    }

    // Network全体の監視をする場合
    private func monitoring() {

        // Interfaceを指定する場合
//        let wifiMonitor = NWPathMonitor(requiredInterfaceType: .wifi)

        // 利用可能なネットワーク
        print("usable network:", monitor.currentPath)

        // iOS16から？
//        print("ethernet channel:", monitor.ethenetChannel)

        monitor.pathUpdateHandler = { [unowned self] path in
            // 特定のインターフェースか
            print("uses:", path.usesInterfaceType(.wifi))

            // 使えるインターフェースリスト
            print("available", path.availableInterfaces)

            // 使用可能なインターフェースのgatewayのリスト
            print("gateway:", path.gateways)

            // サポートしているか
            print("IPv4:", path.supportsIPv4)
            print("IPv6:", path.supportsIPv6)
            print("DNS:", path.supportsDNS)

            // 低データモードでも使用するか
            print("constrained:", path.isConstrained)

            // CellularやPersonalHotspotなどでも使うか
            print("cellular:", path.isExpensive)

            // ネットワークパスの説明
            print("debug:", path.debugDescription)

            // ローカルエンドポイント
            print("local endpoint:", path.localEndpoint)

            // リモートエンドポイント
            print("remote endpoint:", path.remoteEndpoint)


            DispatchQueue.main.async {
                self.monitoringState = path.status
            }
        }

        // 監視の開始
        monitor.start(queue: queue)

        // 監視の停止
//        monitor.cancel()
    }
}
