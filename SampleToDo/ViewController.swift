//
//  ViewController.swift
//  SampleToDo
//
//  Created by cmStudent on 2021/06/20.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let db = Firestore.firestore()
    
    var label = UILabel()
    
    var sendDB = sendToFireBase()
    
    var loaData = LoadData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionViewFlowLayout.estimatedItemSize = CGSize(width: 160, height: 220)
        
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top:20, left: 30, bottom: 20, right: 30)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 現在時刻でデータを取得
        //let date = GetDate.getTodayDate(slash: true)
        
        //dateArray = date.components(separatedBy: "/")
        
        //loaData.loadData(userID: Auth.auth().currentUser!.uid, minute: dateArray[0] + dateArray[1] + dateArray[2],
                         //second: dateArray[3] + dateArray[4])
        
    }
    
    @IBAction func addToDo(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        // alertTitle
        alert.title = "ToDoを追加"
        
        // alertTextField
        alert.addTextField(configurationHandler: { (textFiled) -> Void in
            
            textFiled.delegate = self
            
        })
        
        //追加ボタン
        alert.addAction(UIAlertAction(title: "追加", style: .default, handler: { (action) -> Void in
            
            let textField = alert.textFields![0]
            
            self.sendDB.sendToDo(userName: UserDefaults.standard.object(forKey: "userName") as! String, text: textField.text!)

            print("登録完了")
                        
            })
        )
        
        //アラートが表示されるごとにprint
        self.present(alert, animated: true, completion: {
            
            print("アラートが表示された")
            
            })
        }
    
        
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }

    // データの個数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return loaData.loadData().count
        
    }

    // データを返す
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todoCell", for: indexPath)
        
        label = cell.contentView.viewWithTag(1) as! UILabel
        
        label.text = "te"
    
        return cell
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    // returnでキーボードを閉じる
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
            return true
        
    }
    
}
