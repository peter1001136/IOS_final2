//
//  NewhitsView.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct NewhitsView: View {
    @StateObject var newhitsviewmodel = playlistViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(newhitsviewmodel.newhitplaylist) { index in
                        NavigationLink(
                            destination: NewhitplaylistWidget(song: index),
                            label: {
                                NewhitRow(newhits: index)
                            })
                    }
                }
            }
            .onAppear(perform: {
                newhitsviewmodel.fetchnewhit()
            })
            .navigationTitle("Discover")
        }
    }
}

struct NewhitsView_Previews: PreviewProvider {
    static var previews: some View {
        NewhitsView()
    }
}
