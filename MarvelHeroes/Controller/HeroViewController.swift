//
//  HeroViewController.swift
//  MarvelHeroes
//
//  Created by Erick Borges on 02/07/21.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = hero?.name
        getWebView()
    }
    
    func getWebView() {
        if let hero = hero?.urls.first?.url {
            let url = URL(string: hero)
            let request = URLRequest(url: url!)
            webView.allowsBackForwardNavigationGestures = true
            webView.allowsLinkPreview = true
            webView.navigationDelegate = self
            webView.uiDelegate = self
            webView.load(request)
        }
    }
}

extension HeroViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
