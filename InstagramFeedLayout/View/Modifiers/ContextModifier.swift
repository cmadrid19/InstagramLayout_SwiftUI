//
//  ContextModifiere.swift
//  InstagramFeedLayout
//
//  Created by Maxim Macari on 31/12/20.
//

import SwiftUI

struct ContextModifier: ViewModifier {
    var card: Card
    func body(content: Content) -> some View {
        content
            .contextMenu(ContextMenu(menuItems: {
                
                Text("By \(card.author)")
                
            }))
            .contentShape(RoundedRectangle(cornerRadius: 5))
    }
}


