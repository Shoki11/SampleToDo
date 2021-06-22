//
//  LoadData.swift
//  SampleToDo
//
//  Created by cmStudent on 2021/06/21.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

//protocol GetDataProtocol {
//
//    func getData(dataArray:[ToDoData])
//
//}

class LoadData {
    
    let db = Firestore.firestore()
    
    //var dataArray = [ToDoData]()
    
    //var getDataProtocol: GetDataProtocol?
    
    var ToDoArray : [String] = []
    
    func loadData() -> [String] {
        
        self.db.collection("Users").whereField("userID", isEqualTo: Auth.auth().currentUser!.uid).getDocuments() { (snapshot, error) in
                
                if let error = error {
                    
                    print("Error getting documents: \(error)")
                    
                } else {
                    
                    for document in snapshot!.documents {
                        
                        print("aaaaaaaaaa\(document.data())")
                        
                        let data = document.data()

                        if let userID = data["userID"] as? String,
                           let userName = data["userName"] as? String,
                            let text = data["text"] as? String,
                            let date = data["date"] as? Double {

                            let newToDoData = ToDoData(userName: userName, userID: userID, text: text, date: date)
                            
                            self.ToDoArray.append(newToDoData.text)
                            
                            print("abbbb\(self.ToDoArray)")
                            
                        }

                    }
                }
            }
        
        return self.ToDoArray
        
    }
    
}
