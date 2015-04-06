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
    }
    
    @IBAction func youtubeButtonTapped(sender: UIButton) {
    }
    
    @IBAction func googleplusButtonTapped(sender: UIButton) {
    }
    
    @IBAction func githubButtonTapped(sender: UIButton) {
    }
    
    @IBAction func linkedinButtonTapped(sender: UIButton) {
    }
    
    @IBAction func foursquareButtonTapped(sender: UIButton) {
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

            default:

            println("error")
            
        }

        //println(cred.objectForKey("oauth_token_secret"))
        // self.status_label.text = "Logged in with Twitter/Instagram"
        self.request_object = request
    }


    func didFailWithOAuthIOError(error: NSError!) {
        //self.status_label.text = "Could not login with Twitter/Instagram"
    }


    func didFailAuthenticationServerSide(body: String!, andResponse response: NSURLResponse!, andError error: NSError!) {

    }

    func didAuthenticateServerSide(body: String!, andResponse response: NSURLResponse!) {

    }

    func didReceiveOAuthIOCode(code: String!) {

    }



}

