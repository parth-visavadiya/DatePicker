//
//  ViewController.swift
//  DatePicker
//
//  Created by parth visavadiya on 14/04/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var bookingDateTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureDataPicker()
    }
    
    private func setup() {
        bookingDateTextField.delegate = self
    }
    
    func configureDataPicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .day, value: -2 ,to: Date())
        datePicker.minimumDate = Date()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender)
        bookingDateTextField.text = sender.date.convertToString(format: "dd MMM yyyy")
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0{
            datePicker.isHidden = true
            return false
        }
        datePicker.isHidden = true
        return true
    }
}

extension String{
    func convertToDate(format: String) -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self) ?? Date()
    }
}

extension Date {
    func convertToString(format: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
