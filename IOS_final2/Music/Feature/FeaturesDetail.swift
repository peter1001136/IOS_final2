//
//  FeaturesDetail.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct FeaturesDetail: View {
    @StateObject var trackviewmodel = TrackViewModel()
    var featuresId: FeatureInfo
    
    @State private var showsheet = false
    
    var body: some View {
        NavigationView {
            List {
                ScrollView(.vertical) {
                    HStack {
                        Button(action: {
                            showsheet = true
                        }){
                            NetworkImage(url: featuresId.images[1].url)
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                            Text(featuresId.title)
                                .bold()
                        }.sheet(isPresented: $showsheet){
                            FeatureplaylistWidget(song: featuresId)
                        }
                    }
                    HStack {
                        ForEach (trackviewmodel.featuretracks) { index in
                            NavigationLink(
                                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                                label: {
                                    VStack {
                                        NetworkImage(url: index.album.images[0].url)
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                        Text(index.name)
                                            .bold()
                                    }
                                })
                        }
                    }
                }
            }
            .onAppear(perform: {
                trackviewmodel.fetchfeauretracks(id: featuresId.id)
            })
        }
    }
}

struct FeaturesDetail_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}



