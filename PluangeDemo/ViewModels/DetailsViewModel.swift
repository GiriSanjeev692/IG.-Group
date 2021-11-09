//
//  DetailsViewModel.swift
//  DetailsViewModel
//
//  Created by Sanjeev Kumar on 31/11/09.
//

import Foundation

enum ProfileCellType {
    case newsImage
    case profileImage
    case trackName
    case description
    case collection
}
class DetailsViewModel: NSObject {
    var newReport: SpecialReport?
    var rows: [ProfileCellType] = [.newsImage, .description]
    
    
    func getSections() -> Int {
        return 1
    }
    func getSectionRows(section: Int) -> Int {
        return rows.count
    }
    
}
