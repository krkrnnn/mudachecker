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
    
    //目標金額
    var goalValue: Int = 0
    
    
    //目標金額を表示するラベル
    @IBOutlet var goalLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //目標金額登録ボタン
    @IBAction func registerButtontapped(sender: UIButton){
        
        //目標金額をInt型で取得
        let goalValue = Int(goalText.text!)
        
        goalLabel.numberOfLines = 2
        goalLabel.text = "今月のムダ遣いの上限は" + "\n" + "\(String(goalValue))" + "円です"
        
        
 
        goalText.text = nil
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
