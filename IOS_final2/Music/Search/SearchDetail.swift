//
//  SearchDetail.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct SearchDetail: View {
    @Binding var name:String
    @StateObject var searchviewmodel = playlistViewModel()
    @State private var showsheet = false
    
    var num: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                Text(">Search:" + name)
                    .fontWeight(.heavy)
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
                
                NavigationView {
                    List {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(searchviewmodel.tracks) { index in
                                   NavigationLink(
                                    destination: SearchtrackWidget(tracksong: index),
                                    label: {
                                        SearchTrackRow(searchtracks: index)
                                    })
                                }
                            }
                        }
                    }
                    .onAppear(perform: {
                        searchviewmodel.fetchtracks(name: name, type: "track")
                    })
                    .navigationTitle("Songs")
                }
                
//                NavigationView {
//                    List {
//                        ScrollView(.horizontal) {
//                            HStack {
//                                ForEach(searchviewmodel.playlists) { index in
//                                   NavigationLink(
//                                    destination: SearchplaylistWidget(playlistsong: index),
//                                    label: {
//                                        SearchRow(searchitems: index)
//                                    })
//                                }
//                            }
//                        }
//                    }
//                    .onAppear(perform: {
//                        searchviewmodel.fetchplaylist(name: name, type: "playlist")
//                    })
//                    .navigationTitle("Playlists")
//                }
                
                Spacer()
                
            }
            
        
        }
    }
}

struct SearchDetail_Previews: PreviewProvider {
    static var previews: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

