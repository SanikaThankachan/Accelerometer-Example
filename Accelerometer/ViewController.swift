//
//  ViewController.swift
//  Accelerometer
//
//  Created by Zakkariya K.A on 12/12/22.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var circle: UIView!
    var manager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        circle = UIView(frame: CGRect(x: view.frame.width/2 - 50,y: view.frame.height/2-50,width: 100,height: 100))
        
        circle.layer.cornerRadius = 50
        circle.layer.backgroundColor = UIColor.systemRed.cgColor
        view.addSubview(circle)
        
        manager.startAccelerometerUpdates(to: .main) { [unowned self] (data, error) in
            guard error == nil else {return}
            guard let accelerometerData = data else{return}
            
            self.circle.center = CGPoint(x: self.circle.center.x + accelerometerData.acceleration.x,y : self.circle.center.y - accelerometerData.acceleration.y)
            
        }
    }


}

