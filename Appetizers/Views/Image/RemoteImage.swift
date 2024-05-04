//
//  remoteImage.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-03.
//

import SwiftUI

final class ImageLoader:ObservableObject{
    @Published var image: Image? = nil
    
    func loadFromUrlString(fromUrlString :String){
        NetworkManager.shared.downloadImage(fromURLString: fromUrlString) { [self] uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    var image:Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder")
    }
}


struct AppetizerRemoteImage:View {
    @StateObject var imageLoader = ImageLoader()
    let urlString:String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear(perform: {
                imageLoader.loadFromUrlString(fromUrlString: urlString)
            })
    }
}
