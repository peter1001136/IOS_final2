//
//  FeatureTracks.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import Foundation

struct Tracksrc: Codable {
    let data: [TrackInfo]
}

struct TrackInfo: Codable, Identifiable {
    let id: String
    let name: String
    let isrc: String
    let url: URL
    let album: TrackAlbum
}

struct TrackAlbum: Codable {
    let images: [TrackImages]
    let artist: TrackArtist
}

struct TrackImages: Codable {
    let height: Int
    let width: Int
    let url: URL
}

struct TrackArtist: Codable {
    let name: String
}

class TrackData: ObservableObject {
    @Published var TrackData = [TrackInfo]()
}

