//
//  TestAsyncAwaitApp.swift
//  TestAsyncAwait
//
//  Created by Natalia  Stele on 09/06/2021.
//

import SwiftUI

@main
struct TestAsyncAwaitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
