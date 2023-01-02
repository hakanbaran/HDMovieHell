//
//  DataPersistenceManager.swift
//  Netflix Clone
//
//  Created by Hakan Baran on 2.01.2023.
//

import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    
    enum DatabaseError: Error {
        case failedToSaveData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Title, completion: @escaping(Result<Void, Error>) -> ()) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_data = model.release_data
        item.vote_average = model.vote_average
        
        do {
            try context.save()
            completion(.success(()))
        }
        catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
        
    }
    
    
}