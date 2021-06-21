//
//  sendToFireBase.swift
//  SampleToDo
//
//  Created by cmStudent on 2021/06/20.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class sendToFireBase {
    
    // コレクションを開始のとこまでのパス
    let db = Firestore.firestore()
    
    // 登録したToDoをデータベースに送る
    func sendToDo(userName: String, text: String) {
        
        // 現在時刻を取得
        var date = GetDate.getTodayDate(slash: true)
        
        // 現在の年月をcollectionIDとして
        for _ in 0 ... 3 {
            
            // dateの中に/があったら""に置き換える
            if let slash = date.range(of: "/") {
                
                date.replaceSubrange(slash, with: "")
                
                print(date)
                
            }
            
        }
        
        // 200101230408 前から8つ 200101をcollectionIDに
        let collectionID = date.prefix(8)
        
        // 200101230408 後ろから4つ 23をdocumentIDnに
        let documentID = date.suffix(4)
        
        db.collection("Users").document(Auth.auth().currentUser!.uid)
            .collection(String(collectionID))
            .document(String(documentID))
            .setData(
            
                ["userName": userName, "userID": Auth.auth().currentUser!.uid, "text": text, "Date": Date().timeIntervalSince1970]
                
            )
       
        
    }
    
}
