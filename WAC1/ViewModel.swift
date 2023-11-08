//
//  ViewModel.swift
//  WAC1
//
//  Created by Irine on 07/11/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var mainData: [MainData] = []
    @Published var category : [Category]
    
    @Published var banner : [ Category] = []
    
    init(){
        category = []
        //        fetch()
        
    }
    //    func fetch () {
    //        guard let url = URL (string: "https://run.mocky.io/v3/17db81c4-f48e-408a-bf06-c289ee825e06") else {
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, _,error in
    //
    //            do {
    //                let mainData = try JSONDecoder().decode( [MainData].self, from: data!)
    //                DispatchQueue.main.async {
    //                    self.category = mainData[0].data
    //                    self.banner = mainData[1].data
    //                }
    //            }
    //            catch {
    //                print (error)
    //            }
    //        }
    //        task.resume()
    //    }
    //}
    
    
    func fetchCategory(completionHandler: @escaping ([Category]) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/17db81c4-f48e-408a-bf06-c289ee825e06")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error : \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
            }
            
            if let data = data,
               let category = try? JSONDecoder().decode([MainData].self, from: data) {
                completionHandler(category[0].data )
            }
        })
        task.resume()
    }
    
    
    
    func fetchBanners(completionHandler: @escaping ([Category]) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/17db81c4-f48e-408a-bf06-c289ee825e06")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error : \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
            }
            
            if let data = data,
               let bannerData = try? JSONDecoder().decode([MainData].self, from: data) {
                completionHandler(bannerData[1].data )
            }
        })
        task.resume()
    }
    
}
