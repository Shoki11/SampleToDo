//
//  LoadData.swift
//  SampleToDo
//
//  Created by cmStudent on 2021/06/21.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

protocol GetDataProtocol {
    
    func getData(dataArray:[ToDoData])
    
}

class LoadData {
    
    let db = Firestore.firestore()
    
    var dataArray = [ToDoData]()
    
    var getDataProtocol: GetDataProtocol?
    
    func loadData(date: String) {
        
        db.collection("Users").document(date).addSnapshotListener { (snapShot, error) in
            
            self.dataArray = []
            
            if error != nil {
                
                return
                
            }
            
//            if let snapshotDoc = snapShot?.documents {
//
//                for doc in snapshotDoc {
//
//                    let data = doc.data()
//
//                    if let userID = data["userID"] as? String,
//                       let userName = data["userName"] as? String,
//                       let text = data["text"] as? String,
//                       let date = data["date"] as? Double {
//
//                        let newToDoData = ToDoData(userName: userName, userID: userID, text: text, date: date)
//
//                        self.dataArray.append(newToDoData)
//
//                    }
//
//                }
//
//            }
            
            self.getDataProtocol?.getData(dataArray: self.dataArray)
            
        }
        
    }
    
}
