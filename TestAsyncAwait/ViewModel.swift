//
//  ImageReques.swift
//  TestAsyncAwait
//
//  Created by Natalia  Stele on 09/06/2021.
//

import Foundation
import UIKit


class ViewModel: ObservableObject {

    enum FetchError: Error {
        case badImage
        case badId
    }

    @available(iOS 15.0, *)
    func fetchThumbnail(for id: String) async throws -> UIImage {
        let request = URLRequest(url: URL(string:"https://i.pinimg.com/originals/1c/21/12/1c2112b5ba5588f468fb5f59bdfd3be2.jpg")!)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badId }
        let maybeImage = UIImage(data: data)
        guard let thumbnail = await maybeImage?.thumbnail else { throw FetchError.badImage }
        return thumbnail
    }
}


extension UIImage {
    var thumbnail: UIImage? {
        get async {
            let size = CGSize(width: 100, height: 100)
            if #available(iOS 15.0, *) {
                return await self.byPreparingThumbnail(ofSize: size)
            } else {
               return UIImage()
            }
        }
    }
}
