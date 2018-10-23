//
//  InformationSettingViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/21.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class InformationSettingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var PersonalPhotoImage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonalPhotoImage.layer.cornerRadius = PersonalPhotoImage.frame.size.width/2
        PersonalPhotoImage.clipsToBounds = true
    }
    
    @IBAction func setHeaderImage(_ sender: Any) {
        showActionSheet()
    }
    
    //弹出底部警告框
    func showActionSheet(){
        let alert = UIAlertController(title:nil ,message: nil ,preferredStyle: UIAlertController.Style.actionSheet)
        let openImagesAction = UIAlertAction(title:"从本地获取",style:UIAlertAction.Style.default,handler: {(alerts:UIAlertAction)-> Void in print("你点击了打开相册按钮")})
        let openCameraAction = UIAlertAction(title:"拍照",style:UIAlertAction.Style.destructive,handler: {(alerts:UIAlertAction)-> Void in print("你点击了打开相机按钮")})
        
        let cancleAction = UIAlertAction(title:"取消",style: UIAlertAction.Style.cancel,handler:{(alerts:UIAlertAction)->Void in print("你点击了取消按钮")})
        
        
        alert.addAction(openCameraAction)
        alert.addAction(openImagesAction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true, completion: nil)
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
