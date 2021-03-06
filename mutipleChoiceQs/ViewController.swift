//
//  ViewController.swift
//  mutipleChoiceQs
//
//  Created by Judy chen on 2022/1/17.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var clockStackView: UIStackView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var scoredLabel: UILabel!
    @IBOutlet weak var answeredLabel: UILabel!
    
    @IBOutlet weak var scoredView: UIView!
    @IBOutlet weak var answeredView: UIView!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet var optionButtons: [UIButton]!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var clockImageView: UIImageView!
    

    var index = 0

    var resultArray = [ResultDetail(rightAnswer: "", answeredCount: 0, score: 0, time: nil)]

    
    
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToResultPage"{
            let resultVC = segue.destination as? resultViewController
            resultVC!.resultData = resultArray[0]
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        // Do any additional setup after loading the view.
     
        //questionData.shuffle()
        startGame()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        remindTimeSetting()
        resultArray[0].answeredCount = 0
        resultArray[0].score = 0
        answeredLabel.text = "0"
        scoredLabel.text = "0"


        
        
    }
    

    
    
    let circleLayer = CAShapeLayer()
    
    func addClock(){
        let radius: CGFloat = 9
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: clockStackView.frame.minX + clockStackView.bounds.midX, y: clockStackView.frame.minY + clockStackView.bounds.midX+4), radius: radius, startAngle: .pi/180*270, endAngle: .pi/180*270 + .pi/180*360, clockwise: true)
        
        circleLayer.path = circlePath.cgPath
        circleLayer.lineWidth = radius * 2
        circleLayer.strokeColor = UIColor.green.cgColor
        circleLayer.fillColor = nil
        view.layer.addSublayer(circleLayer)
        view.addSubview(clockStackView)
        
        
    }
    
    
    
    //????????????????????????????????????
    func countDown(duration: Double){
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.alertTimesUp()
        }
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration * 60
        circleLayer.add(animation, forKey: nil)
        
        CATransaction.commit()
    }
    

    //?????????????????????????????????????????????????????????????????????????????????????????????; ?????????????????????????????????????????????
    @IBAction func answerClicked(_ sender: UIButton) {
        if sender.currentTitle == resultArray[0].rightAnswer{
            showAnswer()
            resultArray[0].score += 10
            scoredLabel.text = "\(resultArray[0].score!)"
            resultArray[0].answeredCount += 1
            answeredLabel.text = "\(resultArray[0].answeredCount!)"
            print("correct:",resultArray[0].score!)
            print("correct:",resultArray[0].answeredCount!)
        }else if sender.currentTitle != resultArray[0].rightAnswer{
            resultArray[0].score -= 10
            scoredLabel.text = "\(resultArray[0].score!)"
            print("wrong:",resultArray[0].score!)
        }
        
    }
    
    

    
    
    //??????????????????????????????????????????; ?????????????????????????????????0, ?????????????????????????????? (???????????????????????????)
    func startGame(){
        topicLabel.text = questionData[index].topic
        questionLabel.text = questionData[index].description
        
        //????????????????????????????????????????????????
        questionLabel.backgroundColor = .clear
        questionLabel.textColor = .white
        questionLabel.textAlignment = .center
        scoredView.frame.size = scoredLabel.frame.size
        scoredView.layer.cornerRadius = 5
        answeredView.frame.size = answeredLabel.frame.size
        answeredView.layer.cornerRadius = 5
        
        
        
        
        imageView.image = UIImage(named: questionData[index].image)
        imageView.contentMode = .scaleAspectFill
        
        
        resultArray[0].rightAnswer = questionData[index].answer
        questionData[index].options.shuffle()
        for i in 0...3{
            optionButtons[i].setTitle(questionData[index].options[i], for: .normal)
            
        }
        
        
        
    }
    

    
    func showAnswer(){
        
        let alertController = UIAlertController(title: resultArray[0].rightAnswer, message: questionData[index].example, preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "next", style: .default, handler: {(_)in
            questionData.shuffle()
            self.startGame()
            
        })
        
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func remindTimeSetting(){
        let alertController = UIAlertController(title: "??????", message: "?????????????????????\n(??????1??????)", preferredStyle: .alert)
        alertController.addTextField { UITextField in
            UITextField.placeholder = "?????????"
            UITextField.keyboardType = .decimalPad
        }
        
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [self, unowned alertController] _ in
            
            self.resultArray[0].time = alertController.textFields?[0].text
            print("?????????\(self.resultArray[0].time!) ??????")
            print("??????\(self.resultArray[0].time!)")
            questionData.shuffle()
            self.startGame()
            self.addClock()
         
            if (alertController.textFields?[0].text) != ""{
                self.countDown(duration: Double(self.resultArray[0].time)!) //??????
            }else if (alertController.textFields?[0].text) == ""{
                self.resultArray[0].time = "1"
                self.countDown(duration: Double(self.resultArray[0].time)!)
            }
            
        }
        let backAction = UIAlertAction(title: "Back", style: .default, handler:{ _ in
            self.navigationController?.popViewController(animated: true)
        })
        
        alertController.addAction(backAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    func alertTimesUp(){
        
        let alertController = UIAlertController(title: "????????????", message: "????????????", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: { [self](_)in
            self.performSegue(withIdentifier: "ToResultPage", sender: self)
   
        })
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }


}


