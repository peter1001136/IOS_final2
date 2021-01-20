//
//  FeaturesRow.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct FeaturesRow: View {
    var features: FeatureInfo
    
    var body: some View {
        VStack {
            NetworkImage(url: features.images[0].url)
                .scaledToFill()
                .frame(width: 200, height: 200)
            Text(features.title)
                .bold()
        }
    }
}

struct FeaturesRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}

