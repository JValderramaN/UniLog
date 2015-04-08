//
//  ViewController.swift
//  UniLog
//
//  Created by uppersky04 on 3/31/15.
//  Copyright (c) 2015 uppersky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OAuthIODelegate {

    var objectSocial = SocialConnection()

    var oauth_modal: OAuthIOModal? = nil
    var request_object: OAuthIORequest? = nil


    override func viewDidLoad() {
        super.viewDidLoad()

        /* Config modal for connect with OAuthIO */
        self.oauth_modal = OAuthIOModal(key: "J_-8OVQiQ3Jk80OYvbYKRn0TFL0", delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Buttons
        Action buttons, each social network have to own button
    */
    @IBAction func twitterButtonTapped(sender: UIButton) {
        var options = NSMutableDictionary()
        options.setValue("true", forKey: "cache")
        self.oauth_modal?.showWithProvider(objectSocial.socialNet.objectForKey("Twitter") as String, options: options)
    }

    @IBAction func instagramButtonTapped(sender: UIButton) {
        var options = NSMutableDictionary()
        options.setValue("true", forKey: "cache")
        self.oauth_modal?.showWithProvider(objectSocial.socialNet.objectForKey("Instagram") as String, options: options)
    }
    
    @IBAction func facebookButtonTapped(sender: UIButton) {
        var options = NSMutableDictionary()
        options.setValue("true", forKey: "cache")
        self.oauth_modal?.showWithProvider(objectSocial.socialNet.objectForKey("Facebook") as String, options: options)

    }
    
    @IBAction func youtubeButtonTapped(sender: UIButton) {
        var options = NSMutableDictionary()
        options.setValue("true", forKey: "cache")
        self.oauth_modal?.showWithProvider(objectSocial.socialNet.objectForKey("Youtube") as String, options: options)
    }
    
    @IBAction func googleplusButtonTapped(sender: UIButton) {
        var options = NSMutableDictionary()
        options.setValue("true", forKey: "cache")
        self.oauth_modal?.showWithProvider(objectSocial.socialNet.objectForKey("GooglePlus") as String, options: options)
    }
    
    
    @IBAction func linkedinButtonTapped(sender: UIButton) {
        var options = NSMutableDictionary()
        options.setValue("true", forKey: "cache")
        self.oauth_modal?.showWithProvider(objectSocial.socialNet.objectForKey("LinkedIn") as String, options: options)
    }
    
    @IBAction func foursquareButtonTapped(sender: UIButton) {
        var options = NSMutableDictionary()
        options.setValue("true", forKey: "cache")
        self.oauth_modal?.showWithProvider(objectSocial.socialNet.objectForKey("Foursquare") as String, options: options)
    }


    /* oAuth
        Receive the answer of OAuthIO, it's going to save a token depending on the social network you connect to
    */
    func didReceiveOAuthIOResponse(request: OAuthIORequest!) {

        var cred: NSDictionary = request.getCredentials()

        switch cred.objectForKey("provider")! as String {

            case "twitter":

                println("Twitter")
                objectSocial.accessToken = cred.objectForKey("oauth_token")! as String
                println(cred.objectForKey("oauth_token")!)

            case "instagram":

                println("Instagram")
                objectSocial.accessToken = cred.objectForKey("access_token")! as String
                println(cred.objectForKey("access_token")!)
            
            case "foursquare":
            
                println("foursquare")
                objectSocial.accessToken = cred.objectForKey("access_token")! as String
                println(cred.objectForKey("access_token")!)
            
            case "youtube":
            
                println("youtube")
                objectSocial.accessToken = cred.objectForKey("access_token")! as String
                println(cred.objectForKey("access_token")!)
            
            case "facebook":
            
                println("facebook")
                objectSocial.accessToken = cred.objectForKey("access_token")! as String
                println(cred.objectForKey("access_token")!)

            case "google_plus":
                
                println("google_plus")
                objectSocial.accessToken = cred.objectForKey("access_token")! as String
                println(cred.objectForKey("access_token")!)
            
            case "linkedin":
            
                println("linkedin")
                objectSocial.accessToken = cred.objectForKey("oauth_token")! as String
                println(cred.objectForKey("oauth_token")!)
            
            default:

                println("Not recognized provider")
            
        }

        //println(cred.objectForKey("oauth_token_secret"))
        // self.status_label.text = "Logged in with Twitter/Instagram"
        self.request_object = request
    }


    func didFailWithOAuthIOError(error: NSError!) {
            var alert = UIAlertController(title: "Could not login !",
                message: error.localizedDescription + " . ",//+error.localizedFailureReason!
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
    }


    func didFailAuthenticationServerSide(body: String!, andResponse response: NSURLResponse!, andError error: NSError!) {

    }

    func didAuthenticateServerSide(body: String!, andResponse response: NSURLResponse!) {
    }

    func didReceiveOAuthIOCode(code: String!) {

    }



}

