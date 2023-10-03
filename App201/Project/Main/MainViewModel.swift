//
//  MainViewModel.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI
import Alamofire

final class MainViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @AppStorage("viewed_videos") var viewed_videos: Int = 0
    @AppStorage("favorited") var favorited: [String] = []
    
    @Published var lessons: [VideoItem] = []
    
    @Published var selectedLesson: VideoItem = VideoItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    func getVideos() {
        
        isLoading = true
        
        self.fetchVideos() { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchVideos(completion: @escaping (Result<VideoModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "7d9244f5-ee45-4241-b0b4-733923dafed0",
        ]
        
        let request = AF.request("https://nederev.space/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: VideoModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
