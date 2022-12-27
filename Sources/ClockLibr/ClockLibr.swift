#if canImport(UIKit)
import UIKit


class DateAndTimeViewController: UIViewController {
    
    let buttonReset = UIButton()
    let lableData = UILabel()
    let time = Data()
    var date: String = ""
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLable()
        setupButton()
        timer3000()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
        print("check")
    }
    
    func timer3000() {
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerReset), userInfo: nil, repeats: true)
        
    }
    
    func setupButton() {
        view.addSubview(buttonReset)
        
        if #available(iOS 15.0, *) {
            buttonReset.configuration = .borderless()
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 15.0, *) {
            buttonReset.configuration?.title = "Refresh"
        
        }
        if #available(iOS 15.0, *) {
            buttonReset.configuration?.baseBackgroundColor = .red
        } else {
            // Fallback on earlier versions
        }
        
        buttonReset.addTarget(self, action: #selector(timerReset), for: .touchUpInside)
        
        buttonReset.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonReset.topAnchor.constraint(equalTo: lableData.topAnchor, constant: 80),
            buttonReset.centerXAnchor.constraint(equalTo: lableData.centerXAnchor),
            buttonReset.widthAnchor.constraint(equalToConstant: 200),
            buttonReset.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func setupLable() {
        
        let currentDate = Date()
        let formatter = DateFormatter()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month,], from: currentDate)
        let compWeek = components.month
        var a: String
        print(components)
        
        
        switch compWeek {
            case 1: a = "Января"
            case 2: a = "Февраля"
            case 3: a = "Марта"
            case 4: a = "Апреля"
            case 5: a = "Мая"
            case 6: a = "Июня"
            case 7: a = "Июля"
            case 8: a = "Августа"
            case 9: a = "Сентября"
            case 10:a =  "Октября"
            case 11:a =  "Ноября"
                default: a = "Декабря"
            
        }
        formatter.dateFormat = "dd' \(a) 'yyyy 'г.,'HH:mm:ss"
        
        self.lableData.text = formatter.string(from: currentDate)
        

        view.addSubview(lableData)
        lableData.sizeToFit()
        
     
        lableData.backgroundColor = .white
        lableData.numberOfLines = 0
        lableData.font = UIFont.systemFont(ofSize: 25)
        
        lableData.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lableData.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lableData.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lableData.heightAnchor.constraint(equalToConstant: 50),
            lableData.widthAnchor.constraint(equalToConstant: 320)
            
        ])
        
    }
    @objc func timerReset() {
        setupLable()
        timer.invalidate()
        timer3000()
        
    }
  
}

#endif

