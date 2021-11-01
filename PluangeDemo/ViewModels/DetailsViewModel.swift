//
//  DetailsViewModel.swift
//  DetailsViewModel
//
//  Created by Sanjeev Kumar on 31/10/21.
//

import Foundation

enum ProfileCellType {
    case profileImage
    case trackName
    case description
    case collection
}
class DetailsViewModel: NSObject {
    var artist: Artist?
    var rows: [ProfileCellType] = [.profileImage, .trackName, .collection, .description]
    
    
    func getSections() -> Int {
        return 1
    }
    func getSectionRows(section: Int) -> Int {
        return rows.count
    }
    
}
