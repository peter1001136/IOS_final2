//
//  FeaturesView.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct FeaturesView: View {
    @StateObject var featureviewmodel = playlistViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(featureviewmodel.featureplaylist) { index in
                        NavigationLink(
                            destination: FeatureplaylistWidget(song: index),
                            label: {
                                FeaturesRow(features: index)
                            })
                    }
                }
            }
            .onAppear(perform: {
                featureviewmodel.fetchfeature()
            })
            .navigationTitle("Popular")
        }
    }
}

struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView()
    }
}

extension String: Identifiable {
    public var id: String {
        self
    }
    
}

