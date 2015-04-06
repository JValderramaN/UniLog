//
//  ViewController.swift
//  UniLog
//
//  Created by uppersky04 on 3/31/15.
//  Copyright (c) 2015 uppersky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OAuthIODelegate {
    

    var oauth_modal: OAuthIOModal? = nil
    var request_object: OAuthIORequest? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.oauth_modal = OAuthIOModal(key: "sny9pWwsI6LghavyM_hT7Oo2hOw", delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //buttons action

    @IBAction func twitterButtonTapped(sender: UIButton) {


    }

    @IBAction func instagramButtonTapped(sender: UIButton) {
        var options = NSMutableDictionary()
        options.setValue("true", forKey: "cache")
        self.oauth_modal?.showWithProvider("instagram", options: options)

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


    //oAuth
    func didReceiveOAuthIOResponse(request: OAuthIORequest!) {
        var cred: NSDictionary = request.getCredentials()
        println(cred.objectForKey("access_token")!)
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

