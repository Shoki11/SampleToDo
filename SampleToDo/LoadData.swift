//
//  LoadData.swift
//  SampleToDo
//
//  Created by cmStudent on 2021/06/21.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class LoadData {
    
    let db = Firestore.firestore()
    
    func loadData(completion: @escaping (Result<[ToDoData], Error>) -> Void) {
        
        self.db.collection("Users").whereField("userID", isEqualTo: Auth.auth().currentUser!.uid).addSnapshotListener { (snapshot, error) in
            
            if let error = error {
                
                print("Error getting documents: \(error)")
                
            } else {
                
                var ToDoArray: [ToDoData] = []
                snapshot?.documentChanges.forEach({ (documentChanges) in
                    switch documentChanges.type {
                    case .added:
                        let data = documentChanges.document.data()
                        
                        if let userID = data["userID"] as? String,
                           let userName = data["userName"] as? String,
                           let text = data["text"] as? String,
                           let date = data["date"] as? Double {
                            
                            let newToDoData = ToDoData(userName: userName, userID: userID, text: text, date: date)
                            
                            ToDoArray.append(newToDoData)
                        }
                    case .modified, .removed:
                        print("消されたときの処理")
                    }
                })
                
                completion(.success(ToDoArray))
                
            }
            
        }
        
    }
    
}
