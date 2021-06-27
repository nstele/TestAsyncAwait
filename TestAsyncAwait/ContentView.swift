//
//  ContentView.swift
//  TestAsyncAwait
//
//  Created by Natalia  Stele on 09/06/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var image: UIImage?
    var body: some View {
        if let placeholder  = UIImage(named: "placeholder") {
            Image(uiImage: self.image ?? placeholder).onAppear {
                if #available(iOS 15.0, *) {
                    async {
                        self.image = try! await self.viewModel.fetchThumbnail(for: "")
                    }
                } else {
                    self.image = placeholder
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
