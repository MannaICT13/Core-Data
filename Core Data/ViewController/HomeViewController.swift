//
//  HomeViewController.swift
//  Core Data
//
//  Created by Sharetrip-iOS on 16/08/2021.
//

import UIKit

class HomeViewController: UIViewController,DataPassing {
 
   
 

    //MARK:- Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var saveBtnOutlet: UIButton!
    
    var i = Int()
    var isUpdate = false

    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
       
        if isUpdate{
            saveBtnOutlet.setTitle("Update", for: .normal)
        }
    }
    
    
    //MARK:- Handlers
    @IBAction func saveBtnAction(_ sender: Any) {
        
        
        guard let name = nameTextField.text,let address = addressTextField.text else {
            return
        }
        
        let dic : [String : String] = ["name":name,"address" : address]
        
        if isUpdate{
            CoreDataHandler.coreDataInstance.editData(data: dic, index: i)
        }else{
            CoreDataHandler.coreDataInstance.saveData(data: dic)
        }
       
        nameTextField.text?.removeAll()
        addressTextField.text?.removeAll()
        
    }
    
    @IBAction func showBtnAction(_ sender: Any) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        detailVC.delegate = self
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func passData(name: String, address: String, index: Int, isUpdate: Bool) {
      
        nameTextField.text = name
        addressTextField.text = address
        self.isUpdate = isUpdate
        self.i = index
        
        
    }
    
    
    
    
}
