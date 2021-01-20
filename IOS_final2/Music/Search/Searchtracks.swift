//
//  Searchtracks.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import Foundation

struct SearchTracksrc: Codable {
    let tracks: SearchTrack
}

struct SearchTrack: Codable {
    let data: [SearchTrackInfo]
}

struct SearchTrackInfo: Codable, Identifiable {
    let id: String
    let name: String
    let isrc: String
    let url: URL
    let album: SearchTrackAlbum
}

struct SearchTrackAlbum: Codable {
    let images: [SearchTracksImage]
}

struct SearchTracksImage: Codable {
    let height: Int
    let width: Int
    let url: URL
}

class SearchTrackData: ObservableObject {
    @Published var SearchTrackData = [SearchTrackInfo]()
}

