//
//  SendRequestVC.swift
//  Timer01
//
//  Created by Nick Rodriguez on 28/09/2024.
//

import UIKit

class SendRequestVC: TemplateVC {
    
    let btnSendReq = UIButton()
    let btnStopReq = UIButton()
    // Timer property to keep a reference to the timer
    var timer: Timer?
    var stopTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("- SendRequestVC viewDidLoad")
        strNameOfScreen = "Send Request First"
        setupViews()
        setup_btnSendReq()
        setup_btnStopReq()
    }

    func setup_btnSendReq(){
        btnSendReq.translatesAutoresizingMaskIntoConstraints=false
        btnSendReq.accessibilityIdentifier="btnSendReq"
        view.addSubview(btnSendReq)
        btnSendReq.setTitle(" Send Request to Hades ", for: .normal)
        btnSendReq.backgroundColor = .blue
        btnSendReq.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            btnSendReq.topAnchor.constraint(equalTo: lblScreenTitle.bottomAnchor, constant: 30),
            btnSendReq.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        btnSendReq.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        btnSendReq.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
    }

    func setup_btnStopReq(){
        btnStopReq.translatesAutoresizingMaskIntoConstraints=false
        btnStopReq.accessibilityIdentifier="btnStopReq"
        view.addSubview(btnStopReq)
        btnStopReq.setTitle(" Stop Request to Hades ", for: .normal)
        btnStopReq.backgroundColor = .gray
        btnStopReq.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            btnStopReq.topAnchor.constraint(equalTo: btnSendReq.bottomAnchor, constant: 30),
            btnStopReq.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        btnStopReq.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        btnStopReq.addTarget(self, action: #selector(touchUpInsideStop(_:)), for: .touchUpInside)
    }
    
    // Function to start the timer
    func startRepeatingTask() {
        
        print("🚀 start 🚀")
        // Invalidate the previous timer if it exists
        timer?.invalidate()
        
        // Schedule a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            print("send request")
            RequestFetcherStore.shared.callGateToHades { result in
                switch result{
                case .success(let dictObj):
                    print("---> success")
                    print(dictObj)
//                    print(self.timer?.fireDate)
                    if let apiResponse = dictObj["status"]{
                        print("The api reposne is : \(apiResponse)")
                    }
                case .failure(let err):
                    print("--> faile")
                    print(err)
                }
            }
        }
        
        // Start a timer to stop the repeating task after 2 minutes
       stopTimer = Timer.scheduledTimer(timeInterval: 12.0, target: self, selector: #selector(stopRepeatingTask), userInfo: nil, repeats: false)
    }
    
    /* Obj - C Functions */
    
    @objc func touchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
            sender.transform = .identity
        }, completion: nil)
        
        print("- touchUpInside")
//        startRepeatingTask()
        startRepeatingTask()
        
//        print("--- button comign back up 🎭")

    }
    
    
    @objc func touchUpInsideStop(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
            sender.transform = .identity
        }, completion: nil)
        
//        print("- stop loop")
//        timer?.invalidate()
//        timer = nil
        stopRepeatingTask()
    }
    
    // Function to stop the repeating task
    @objc func stopRepeatingTask() {
        print("🫷🥺🫸 StAwP ")
        timer?.invalidate()
        timer = nil
        
        // Invalidate the stop timer if it's still running
        stopTimer?.invalidate()
        stopTimer = nil
        
        print("Task stopped after 2 minutes or manually.")
    }
    
    
}
