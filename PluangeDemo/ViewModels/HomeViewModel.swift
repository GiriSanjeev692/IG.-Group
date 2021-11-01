//
//  HomeViewModel.swift
//  HomeViewModel
//
//  Created by Sanjeev Kumar on 31/10/21.
//

import Foundation

class HomeViewModel : NSObject {
    var networkManager = NetworkManager()
    var repoList: [Artist] = []
    var selectedObject: Artist? = nil
    
    func fetchRepoList(completionHandler: @escaping((Result<ResultData, Error>) -> Swift.Void)) {
        let urlStr = "https://itunes.apple.com/search?term=adele"
        networkManager.makeServerRequest(responseType: ResultData.self, urlStr: urlStr) {[weak self] result in
            switch result {
            case .success(let data):
                print("bxbbn")
                self?.repoList = data.results ?? []
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
        return repoList.count
    }
    
   
}
