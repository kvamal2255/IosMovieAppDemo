//
//  RemoteImageView.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct RemoteImageView: View {
    private var url: URL?
    private var placeholder: Image
    private var contentMode: SwiftUI.ContentMode
    @StateObject private var viewModel = RemoteImageViewModel()
    private var size: CGSize
    @State private var isFailure: Bool = false

    init(url: URL?, size: CGSize, contentMode: SwiftUI.ContentMode = .fit, placeholder: Image = Image(.icMoviePlaceHolder)) {
        self.url = url
        self.placeholder = placeholder
        self.contentMode = contentMode
        self.size = size
    }

    var body: some View {
        if isFailure {
            placeholder
                .resizable()
                .frame(width: size.width, height: size.height)
        } else {
            WebImage(url: url, options: [.retryFailed])
                .resizable()
                .onSuccess { image, data, cacheType in
                    // Success
                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                    viewModel.success?(Image(uiImage: image))
                }
                .onFailure(perform: { error in
                    isFailure = true
                })
                .scaledToFill()
                .aspectRatio(contentMode: contentMode)
                .frame(width: size.width, height: size.height)
        }
    }
    
    public func onSuccess(perform action: @escaping (Image) -> ()) -> RemoteImageView {
        viewModel.success = action
        return self
    }
}

class RemoteImageViewModel: ObservableObject {
    var success: ((Image) -> ())?

}

