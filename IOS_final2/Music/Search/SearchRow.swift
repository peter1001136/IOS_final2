//
//  SearchRow.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct SearchRow: View {
    var searchitems: PlaylistInfo
    
    var body: some View {
        VStack {
            NetworkImage(url: searchitems.images[0].url)
                .scaledToFill()
                .frame(width: 150, height: 150)
            Text(searchitems.title)
                .bold()
        }
        
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}

