//
//  MonthMudaViewController.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/02/16.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

class MonthMudaViewController: UIViewController {
    
    
    //オーバー額を表示するラベル
    @IBOutlet var mudaLabel: UILabel!
    
    //無駄金額
    var mudaTotal :Int = 0
    
    
    //NSUerDefaultsインスタンスの生成
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //var spArray = saveData.integerForKey("spArray")
        //var spArrar[0]
        
        
        //ムダ金額を取得
        mudaTotal = saveData.integerForKey("MUDA")
        
        mudaLabel.numberOfLines = 2
        //目標をオーバーした出費の額を表示
        mudaLabel.text = String(mudaTotal) + "円" + "\n" + "ムダ遣いしています"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ResetButtonTapped(){
        mudaTotal = 0
        saveData.removeObjectForKey("MUDA")
        mudaLabel.numberOfLines = 2
        //目標をオーバーした出費の額を表示
        mudaLabel.text = String(mudaTotal) + "円" + "\n" + "ムダ遣いしています"
        
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
