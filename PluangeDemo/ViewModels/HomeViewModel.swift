//
//  HomeViewModel.swift
//  HomeViewModel
//
//  Created by Sanjeev Kumar on 31/11/09.
//

import Foundation

class HomeViewModel : NSObject {
    var networkManager = NetworkManager()
    var topNews: [SpecialReport] = []
    var selectedObject: Artist? = nil
    var selectedIndexPath: IndexPath?
    
    func fetchRepoList(completionHandler: @escaping((Result<News, ErrorDetails>) -> Swift.Void)) {
        networkManager.makeServerRequest(responseType: News.self, urlStr: APIEndpoints.dashboard) {[weak self] result in
            switch result {
            case .success(let data):
                print("bxbbn")
                self?.topNews = data.specialReport ?? []
            case .failure(let error):
                print("Error")
            }
             completionHandler(result)
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsForSection(section: Int) -> Int {
        return topNews.count
    }
    
   
}
