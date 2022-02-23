//
//  exampleQAController.swift
//  mutipleChoiceQs
//
//  Created by judy on 2022/2/22.
//

import UIKit

class exampleQAViewController: UIViewController {

    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var lowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDetail()
        lowView.layer.cornerRadius = 20
        
    }
    

        
    
    
    var index = 1
    
    func updateDetail(){
        topicLabel.text = questionData[index].topic
        descriptionLabel.text = questionData[index].description
        exampleLabel.text = questionData[index].example
        answerLabel.text = questionData[index].answer
        imageView.image = UIImage(named: questionData[index].image)
        imageView.contentMode = .scaleAspectFill
        answerLabel.isHidden = true
        imageView.isHidden = true
        nextButton.isHidden = true
        nextButton.alpha = 0
        
        
        
    }
    
    /*@objc func showNextButton(){
        nextButton.isHidden = false
        UIView.transition(with: answerButton, duration: 2, options: .transitionCrossDissolve, animations: { self.nextButton.isHidden = false}, completion: nil)
        
    }*/
    
    func showNextButton(){
        UIView.animate(withDuration: 0.5, animations: {
            self.nextButton.isHidden = false
            self.nextButton.alpha = 1
            
        }, completion: nil)
        
    }
    
    func showAnswerButton(){
        UIView.animate(withDuration: 0.5, animations: {
            self.answerButton.isHidden = false
            self.answerButton.alpha = 1
            
        }, completion: nil)
        
    }
    
    func hideNextButton(){
        UIView.animate(withDuration: 0.5, animations: {
            self.nextButton.alpha = 0
            self.nextButton.isHidden = true
            
        }, completion: nil)
    }
    
    func hideAnswerButton(){
        UIView.animate(withDuration: 0.5, animations: {
            self.answerButton.alpha = 0
            self.answerButton.isHidden = true
            self.nextButton.alpha = 0
            self.nextButton.isHidden = true
            
        }, completion: nil)
        
    }
    
    @IBAction func answerButtonTapped(_ sender: Any) {
        answerLabel.isHidden = false
        imageView.isHidden = false
        //answerButton.isHidden = true
        //nextButton.isHidden = false
        /*answerButton.addTarget(answerButton, action: #selector(self.showNextButton), for: .touchUpInside)*/
        hideAnswerButton()
        showNextButton()
        
    }

        
    @IBAction func nextButtonTapped(_ sender: Any) {
        hideNextButton()
        showAnswerButton()
        index = index + 1
        if index == questionData.count{
            index = 0
        }
        updateDetail()
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
