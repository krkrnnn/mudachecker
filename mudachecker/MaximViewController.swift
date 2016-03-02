//
//  MaximViewController.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/03/01.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

class MaximViewController: UIViewController {
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ランダムでムダ遣いに関する格言を表示する
        let maxim: [String] = ["財布が軽ければ心は重い。", "欲しいと思うものを買うな。\n必要なものだけ買え。",
         "いらぬ物を買えば、\nいるものを売るに至る。", "カネだけが人生ではないが、\nカネのない人生も、\nまた人生とは言えない。\n十分なカネがなければ人生の可能性の半分は閉め出されてしまう。", "「貧困は恥ではない」というのは、\nすべての人間が口にしながら、 誰一人、\n心では納得していない諺である。", "遣うのは簡単、\n溜めるのは100倍苦労する。", "若いときの自分は、\n金こそ人生でもっとも大切なものだ\nと思っていた。 \n今、歳をとってみると、\nその通りだと知った。", "節約せずに誰も金持ちにはなれない。\nそして、節約する者で貧しい者はいない。", "お金で成功する秘訣は、\n使った残りを貯金するのではなく、\n貯金した残りを使うことである。", " 僅少の出費をつつしめ。\n水のもる小さな穴が巨船を沈める。"]
        
        let index = (Int)(arc4random_uniform(10))
        
        //配列から格言をランダムに表示
        self.view.addSubview(label)
        label.font = UIFont(name: "HiraKakuProN-W3", size: 15)
        label.text = maxim[index]
        // 行数無制限
        label.numberOfLines = 0;
        // サイズを自動調整
        label.sizeToFit()
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
