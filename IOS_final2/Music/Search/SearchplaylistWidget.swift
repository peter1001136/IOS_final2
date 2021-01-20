//
//  SearchplaylistWidget.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI
import WebKit

struct SearchplaylistWidget: UIViewRepresentable {
    var playlistsong: PlaylistInfo
    func makeUIView(context: Context) -> WKWebView {
        let widgetView = WKWebView()
        if let url = URL(string: "https://widget.kkbox.com/v1/?id=\(playlistsong.id)&type=playlist&terr=TW&lang=TC") {
            let request = URLRequest(url: url)
            widgetView.load(request)
        }
        return widgetView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    
    typealias UIViewType = WKWebView
    
    
    
}

struct SearchplaylistWidget_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}

