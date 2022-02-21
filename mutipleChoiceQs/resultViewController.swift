//
//  resultViewController.swift
//  mutipleChoiceQs
//
//  Created by Judy chen on 2022/1/28.
//

import UIKit

class resultViewController: UITableViewController {

    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var lastTimeLabel: UILabel!
    
    @IBOutlet weak var scoredLabel: UILabel!
    @IBOutlet weak var lastScoredLabel: UILabel!
    
    
    @IBOutlet weak var answerdLabel: UILabel!
    @IBOutlet weak var lastAnsweredLabel: UILabel!
    

    
    var resultData = ResultDetail()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        timeLabel.text = "\(resultData.time!)"
        lastTimeLabel.text = "\(results[0].time!)"
        
        scoredLabel.text = "\(resultData.score!)"
        lastScoredLabel.text = "\(results[0].score!)"
        
        answerdLabel.text = "\(resultData.answeredCount!)"
        lastAnsweredLabel.text = "\(results[0].answeredCount!)"
        

    

        results.append(resultData)
        
        results.removeFirst()
        print("results",results)
 
    }
    


        

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
