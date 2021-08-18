//
//  DetailViewController.swift
//  Core Data
//
//  Created by Sharetrip-iOS on 16/08/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var person = [Person]()
    
    static let identifier  = "DetailViewController"
    var delegate : DataPassing!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        person = CoreDataHandler.coreDataInstance.retriveData()
        

    }
    


}
extension DetailViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell : TableViewCell  = self.table.dequeueReusableCell(withIdentifier:TableViewCell.identifier) as! TableViewCell
        cell.nameLbl.text = person[indexPath.row].name
        cell.addressLbl.text = person[indexPath.row].address
        
        
        cell.selectionStyle = .none
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            self.person.remove(at: indexPath.row)
            CoreDataHandler.coreDataInstance.deleteData(index: indexPath.row)
            self.table.deleteRows(at: [indexPath], with: .automatic)
            
            
        }
        let config = UISwipeActionsConfiguration(actions: [delete])
        config.performsFirstActionWithFullSwipe = false
        return config
        
        
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view , nil) in
            self.delegate.passData(name: self.person[indexPath.row].name!, address: self.person[indexPath.row].address!, index: indexPath.row, isUpdate: true)
            
            self.navigationController?.popViewController(animated: true)
        }
        edit.backgroundColor = .orange
        
        let config = UISwipeActionsConfiguration(actions: [edit])
        config.performsFirstActionWithFullSwipe = false
        
        return config
        
        
    }
    
    
    
    
    
}

protocol DataPassing{
    func passData(name :String,address : String,index : Int,isUpdate : Bool)
}
