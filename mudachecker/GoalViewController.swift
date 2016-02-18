//
//  GoalViewController.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/02/16.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController {
    
    //設定する目標金額を入力するフィールド
    @IBOutlet var goalText: UITextField!
    

    
    
    //目標金額を表示するラベル
    @IBOutlet var goalLabel: UILabel!
    
    
    //目標金額の保存に使用
    //NSUerDefaultsインスタンスの生成
    let saveData = NSUserDefaults.standardUserDefaults()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var loadInt: Int = saveData.integerForKey("GOAL")
        var goal: String = String(loadInt)
        
        goalLabel.numberOfLines = 2
        goalLabel.text = "今月のムダ遣いの上限は" + "\n" + "\(goal)" + "円です"


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //目標金額登録ボタン
    @IBAction func registerButtontapped(sender: UIButton){
        
        var loadInt: Int = 0
        //目標金額をInt型で取得
        let goalValue = Int(goalText.text!)
        
        
        //目標金額を保存
        saveData.setObject(goalValue, forKey: "GOAL")

        
        loadInt = saveData.integerForKey("GOAL")
        var goal: String = String(loadInt)
        
        goalLabel.numberOfLines = 2
        goalLabel.text = "今月のムダ遣いの上限は" + "\n" + "\(goal)" + "円です"
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
