//
//  JSONViewModel.swift
//  InstagramFeedLayout
//
//  Created by Maxim Macari on 31/12/20.
//

import SwiftUI

class JSONViewModel: ObservableObject {
    
    @Published var cards: [Card] = []
    
    //search
    @Published var search = ""
    
    //Composition layout array
    
    @Published var compositionalArray: [[Card]] = []
    
    init() {
        fetchJSON()
    }
    
    func fetchJSON(){
        //memory leaking-- above 100
        let urlString = "https://picsum.photos/v2/list?page=2&limit=19"
        
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: urlString) else {
            print("Bad url format")
            return
        }
        
        
        
        session.dataTask(with: url) { (data, res, err) in
            
            guard let json = data else {
                print("No data")
                return
            }
            
            let jsonData = try? JSONDecoder().decode([Card].self, from: json)
            
            guard let cards = jsonData else {
                print("Data decoded unproperly")
                return
            }
            
            DispatchQueue.main.async {
                self.cards = cards
                self.setCompositionalLayout()
                print("data: ", cards)
            }
            
        }
        .resume()
        
    }
    
    func setCompositionalLayout() {
        
        var currentArrayCards: [Card] = []
        
        cards.forEach { (card) in
            currentArrayCards.append(card)
            
            if currentArrayCards.count == 3 {
                //apending to main Array
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
                
            }
            
            // if not 3 or even no enough cards...
            if currentArrayCards.count != 3 && card.id == cards.last!.id {
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
            
        }
        
    }
    
}
