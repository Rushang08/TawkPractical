//
//  UserListViewController.swift
//  TawkPractical
//
//  Created by Rushang Prajapati on 16/05/22.
//

import UIKit
import Reachability
import SVProgressHUD

class UserListViewController: UIViewController {
    
    ///Variable Declration
    @IBOutlet weak var searchUser: UISearchBar!
    @IBOutlet weak var tblViewUserList: UITableView!
    @IBOutlet weak var btnNoInternet: UIBarButtonItem!
    let reachability = try! Reachability()
    
    var lastPage: Int = 0
    lazy var userListVM: UserListViewModel = {
        return UserListViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyThereachibility()
        // Do any additional setup after loading the view.
        
    }
    
}

extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListVM.arrUserList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objUser = userListVM.arrUserList[indexPath.row]
        
        if (indexPath.row % 4 == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InvertedColorTableViewCell") as! InvertedColorTableViewCell
            cell.setupData(objUser: objUser)
            return cell
            
        } else {
            if  DataHandler.sharedInstance().getNotesforUser(strLogin: objUser.login!) != KEY.COREDATA.NO_NOTES_PATTERN {
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserNoteIndicatorTableViewCell") as! UserNoteIndicatorTableViewCell
                cell.setupData(objUser: objUser)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell") as! UserListTableViewCell
                cell.setupData(objUser: objUser)
                return cell
            }
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.00
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if reachability.connection == .unavailable{
            AppUtility.showAlert(message: "Internet not available")
            return
        }
        userListVM.getUserDetails(strName: userListVM.arrUserList[indexPath.row].login ?? "") { [weak self] success in
            //Navigation
            DispatchQueue.main.async {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserDetailsViewController") as? UserDetailsViewController
                vc?.objUserDetail = self!.userListVM.objUserDetail
                self?.navigationController?.pushViewController(vc!, animated: true)
            }
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            // print("this is the last cell")
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            if searchUser.text?.count == 0{
                self.tblViewUserList.tableFooterView = spinner
            }
            else{
                self.tblViewUserList.tableFooterView = nil
            }
            
        }
    }
    
    
}
extension UserListViewController {
    
    
    /// IF INTERNET IS NOT AVAILABLE THEN SHOW COREDATA WITH NOTES
    /// Reachability methods
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            btnNoInternet.image = UIImage(named: " ")
            print("Reachable via WiFi")
        case .cellular:
            btnNoInternet.image = UIImage(named: " ")
            print("Reachable via Cellular")
        case .unavailable:
            getofflineData()
            print("Network not reachable")
        case .none:
            getofflineData()
            break
        }
    }
    
    /// Fetch Data from Coredata if not internet
    func getofflineData(){
        btnNoInternet.image = UIImage(named: "NoInternet")
        self.userListVM.getOfflineUserData { succeess in
            if !succeess{
                AppUtility.showAlert(message: "We don't have stored Data. You might have to re-connect the internet!!!")
            }
            else{
                DispatchQueue.main.async {
                    self.tblViewUserList.reloadData()
                }
            }
        }
    }
    
    /// Fetch Data from server if internet connected
    func fetchUserDataFromServer(){
        btnNoInternet.image = UIImage(named: " ")
        self.userListVM.getUserData(page: "0") { succeess in
            DispatchQueue.main.async {
                self.tblViewUserList.reloadData()
                self.navigationItem.title = "Users: " + "\(self.userListVM.arrUserList.count)"
            }
        }
    }
    
    ///Reachability setup
    func notifyThereachibility(){
        let reachability = try! Reachability()
        if reachability.connection == .wifi || reachability.connection == .cellular{
            fetchUserDataFromServer()
        }
        else {
            getofflineData()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}

extension UserListViewController : UIScrollViewDelegate{
    
    ///Scrollview method used for position with contentSize logic
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        /// last cell
        if position > (self.tblViewUserList.contentSize.height - 100 - scrollView.frame.size.height) { // last cell
            guard !userListVM.isPaginaating else{
                return
            }
            lastPage += 1
            userListVM.getUserData(page: "\(lastPage)") { succeess in
                DispatchQueue.main.async {
                    self.tblViewUserList.reloadData()
                    self.navigationItem.title = "Users: " + "\(self.userListVM.arrUserList.count)"
                }
            }
        }
    }
    
}

extension UserListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            let tmpArrUser = userListVM.arrUserList.filter { $0.login!.range(of: searchText, options: .caseInsensitive) != nil }
            userListVM.arrUserList = tmpArrUser
        } else {
            userListVM.arrUserList = userListVM.arrTmpUserList
            self.view.endEditing(true)
        }
        self.tblViewUserList.reloadData()
    }
    
    
    
    
}
