//
//  UserDetailsViewController.swift
//  TawkPractical
//
//  Created by Rushang Prajapati on 17/05/22.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    ///Variable Declration
    @IBOutlet weak var imgUserProfile: ImageLoading!
    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var lblFollwers: UILabel!
    @IBOutlet weak var lblBlog: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var txtNotes: UITextView!
    var objUserDetail: UserDetail = UserDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Data operation
        setupDataAndDesignTextViewBoder()
        // Do any additional setup after loading the view.
    }
    

    ///Button Save notes in CoreData
    @IBAction func btnSaveNotesforUser(_ sender: Any) {
        if DataHandler.sharedInstance().updateNotesforUser(strNotes:txtNotes.text ?? KEY.COREDATA.NO_NOTES_PATTERN , strLogin: objUserDetail.login!) {
            AppUtility.showAlert(message: KEY.MESSAGE.SAVED_SUCCESSFULLY)
        }
        else{
            AppUtility.showAlert(message: KEY.MESSAGE.SOMETHING_WENT_WRONG)
        }
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
extension UserDetailsViewController{
    
    func setupDataAndDesignTextViewBoder(){
        txtNotes.layer.cornerRadius = 5
        txtNotes.layer.borderColor = UIColor.black.cgColor
        txtNotes.layer.borderWidth = 1.0
        txtNotes.clipsToBounds = true
        imgUserProfile.downloadImageFrom(url: URL(string: objUserDetail.avatarUrl!)!, isConverted: false, imageMode: .scaleAspectFit)
        lblFollowing.text = "Followers: " + "\(String(describing: objUserDetail.followers!))"
        lblFollwers.text = "Following: " + "\(String(describing: objUserDetail.following!))"
        lblName.text = objUserDetail.name
        lblCompany.text = objUserDetail.nodeId
        lblBlog.text = objUserDetail.blog
        txtNotes.text = DataHandler.sharedInstance().getNotesforUser(strLogin: objUserDetail.login!)
    }
    
}
