//
//  InformationSettingViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/21.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

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
    
    //Login to Facebook by btn
    func onClickLoginWithFacebook(_ sender: Any) {
        let fbLoginManager = FBSDKLoginManager()
        // 使用FB登入的SDK，並請求可以讀取用戶的基本資料和取得用戶email的權限
        fbLoginManager.logOut()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            
            // 登入失敗
            if error != nil {
                print("Failed to login: \(error?.localizedDescription)")
                return
            }
            
            // 取得登入者的token失敗
            if FBSDKAccessToken.current() == nil {
                print("Failed to get access token")
                return
            }
            
            print("tokenString: \(FBSDKAccessToken.current().tokenString)")
            
            // 擷取用戶的access token，並通過調用將其轉換為Firebase的憑證
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            
            // 呼叫Firebase的API處理登入的動作
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                
                if error != nil {
                    print((error?.localizedDescription)!)
                    return
                }
                
                // 使用FB登入成功
                print("使用FB登入成功")
            })
            
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
