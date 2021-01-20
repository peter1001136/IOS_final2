//
//  SearchTrackRow.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct SearchTrackRow: View {
    var searchtracks: SearchTrackInfo
    
    var body: some View {
        VStack {
            NetworkImage(url: searchtracks.album.images[0].url)
                .scaledToFill()
                .frame(width: 150, height: 150)
            Text(searchtracks.name)
                .bold()
        }
    }
}

struct SearchTrackRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
