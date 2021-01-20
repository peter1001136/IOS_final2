//
//  NewhitRow.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct NewhitRow: View {
    var newhits: NewhitInfo
    
    var body: some View {
        VStack {
            NetworkImage(url: newhits.images[0].url)
                .scaledToFill()
                .frame(width: 200, height: 200)
            Text(newhits.title)
                .bold()
        }
    }
}

struct NewhitRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}

