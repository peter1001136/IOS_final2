//
//  Search.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import Foundation

struct Searchsrc: Codable {
    let playlists: Playlists
}

struct Playlists: Codable {
    let data: [PlaylistInfo]
}

struct PlaylistInfo: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let url: URL
    let images: [PlaylistImage]
}

struct PlaylistImage: Codable {
    let height: Int
    let width: Int
    let url: URL
}

class PlaylistData: ObservableObject {
    @Published var playlistData = [PlaylistInfo]()
}
