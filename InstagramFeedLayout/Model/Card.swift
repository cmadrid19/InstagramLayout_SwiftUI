//
//  Card.swift
//  InstagramFeedLayout
//
//  Created by Maxim Macari on 31/12/20.
//

import SwiftUI

struct Card: Identifiable, Decodable, Hashable {
    var id: String
    var download_url: String
    var author: String
}

