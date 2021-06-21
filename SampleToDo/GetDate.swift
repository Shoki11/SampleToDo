//
//  GetDate.swift
//  SampleToDo
//
//  Created by cmStudent on 2021/06/20.
//

import Foundation

class GetDate {
    
    // 今日の日付を取得して返す
    static func getTodayDate(slash : Bool) -> String {
        
        let format = DateFormatter()
        
        // 時間出さない
        format.timeStyle = .none
        
        // 日付全部出す
        format.dateStyle = .full
        
        if slash == true {
            
            format.dateFormat = "yyyy/MM/dd/hh/mm/ss"
            
        }
        
        // ロケール(言語や地域的な)
        format.locale = Locale(identifier: "ja_JP")
        
        // 現在の日付
        let now = Date()
        
        // formatの設定で値nowを返す
        return format.string(from: now)
        
    }
    
}
