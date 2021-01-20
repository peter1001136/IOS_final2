//
//  NetworkImage.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct NetworkImage: View {
    var url: URL
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false
    
    func download() {
        if let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            image = Image(uiImage: uiImage)
            downloadImageOk = true
        }
        
    }
    
    var body: some View {
        image
            .resizable()
            .onAppear {
                if downloadImageOk == false {
                    download()
                }
            }
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(url: URL(string: "https://i.kfs.io/playlist/global/57039633v43/cropresize/300x300.jpg")!)
    }
}
